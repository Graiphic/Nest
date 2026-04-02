# NEST Pages Banner Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a GitHub-only red banner to the root README, hide it on GitHub Pages, and add a Pages-only top-right button back to the GitHub repository.

**Architecture:** Keep the current GitHub Pages Jekyll README rendering. Add one README banner asset, one Pages head include for CSS and button injection, and one smoke test script that verifies the required tokens are present.

**Tech Stack:** Markdown, GitHub Pages Jekyll include hooks, HTML/CSS/JavaScript, PowerShell

---

### Task 1: Add the failing smoke test first

**Files:**
- Create: `C:\Users\PortableDEV\.config\superpowers\worktrees\Nest\codex-nest-pages-banner\scripts\verify-pages-banner.ps1`
- Test: `C:\Users\PortableDEV\.config\superpowers\worktrees\Nest\codex-nest-pages-banner\scripts\verify-pages-banner.ps1`

- [ ] **Step 1: Write the failing test**

```powershell
$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$requiredFiles = @(
    "README.md",
    "assets\\open-github-pages-banner.svg",
    "_includes\\head-custom.html"
)

foreach ($relativePath in $requiredFiles) {
    if (-not (Test-Path -LiteralPath (Join-Path $repoRoot $relativePath))) {
        throw "Missing expected file: $relativePath"
    }
}
```

- [ ] **Step 2: Run test to verify it fails**

Run: `powershell -ExecutionPolicy Bypass -File .\scripts\verify-pages-banner.ps1`
Expected: FAIL because `assets\open-github-pages-banner.svg` and `_includes\head-custom.html` do not exist yet.

- [ ] **Step 3: Write minimal implementation**

```text
Create:
- assets/open-github-pages-banner.svg
- _includes/head-custom.html
Update:
- README.md
```

- [ ] **Step 4: Run test to verify it passes**

Run: `powershell -ExecutionPolicy Bypass -File .\scripts\verify-pages-banner.ps1`
Expected: PASS with a success message.

- [ ] **Step 5: Commit**

```bash
git add README.md assets/open-github-pages-banner.svg _includes/head-custom.html scripts/verify-pages-banner.ps1 docs/superpowers/specs/2026-04-02-nest-pages-banner-design.md docs/superpowers/plans/2026-04-02-nest-pages-banner.md
git commit -m "feat: add contextual GitHub Pages banner"
```

### Task 2: Verify the repository state after implementation

**Files:**
- Modify: `C:\Users\PortableDEV\.config\superpowers\worktrees\Nest\codex-nest-pages-banner\scripts\verify-pages-banner.ps1`
- Test: `C:\Users\PortableDEV\.config\superpowers\worktrees\Nest\codex-nest-pages-banner\scripts\verify-pages-banner.ps1`

- [ ] **Step 1: Extend the smoke test assertions**

```powershell
$rootReadme = Get-Content -LiteralPath (Join-Path $repoRoot "README.md") -Raw
$headCustom = Get-Content -LiteralPath (Join-Path $repoRoot "_includes\\head-custom.html") -Raw
$bannerSvg = Get-Content -LiteralPath (Join-Path $repoRoot "assets\\open-github-pages-banner.svg") -Raw

foreach ($token in @(
    '<div class="nest-pages-link">',
    'https://graiphic.github.io/Nest/',
    './assets/open-github-pages-banner.svg'
)) {
    if ($rootReadme -notmatch [regex]::Escape($token)) {
        throw "README.md is missing token: $token"
    }
}

foreach ($token in @(
    ".nest-pages-link",
    "display: none !important",
    "View on GitHub",
    "https://github.com/Graiphic/Nest"
)) {
    if ($headCustom -notmatch [regex]::Escape($token)) {
        throw "_includes/head-custom.html is missing token: $token"
    }
}

if ($bannerSvg -notmatch [regex]::Escape("OPEN THE GITHUB PAGES VERSION")) {
    throw "Banner SVG is missing expected title text"
}
```

- [ ] **Step 2: Run test to verify it fails if implementation is incomplete**

Run: `powershell -ExecutionPolicy Bypass -File .\scripts\verify-pages-banner.ps1`
Expected: FAIL until all README, asset, and head include tokens are present.

- [ ] **Step 3: Finish implementation details**

```text
Ensure:
- README banner is at the top
- head include hides the banner on Pages
- head include injects a fixed top-right GitHub button
- SVG banner text matches the Pages CTA
```

- [ ] **Step 4: Run test to verify it passes**

Run: `powershell -ExecutionPolicy Bypass -File .\scripts\verify-pages-banner.ps1`
Expected: PASS with `Pages banner smoke checks passed.`

- [ ] **Step 5: Commit**

```bash
git add README.md assets/open-github-pages-banner.svg _includes/head-custom.html scripts/verify-pages-banner.ps1 docs/superpowers/specs/2026-04-02-nest-pages-banner-design.md docs/superpowers/plans/2026-04-02-nest-pages-banner.md
git commit -m "feat: add contextual GitHub Pages banner"
```
