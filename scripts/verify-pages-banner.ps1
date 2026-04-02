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
    "nest-github-corner",
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

Write-Host "Pages banner smoke checks passed."
