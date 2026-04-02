# NEST GitHub Pages Banner Design

## Goal

Add the same red call-to-action banner used in `GO-Whitepapers` to the repository `README.md`, but make sure it is visible on the GitHub repository view and hidden on the GitHub Pages site at `https://graiphic.github.io/Nest/`.

## Constraints

- Keep the current GitHub Pages rendering model based on GitHub's default Jekyll/README rendering.
- Do not rebuild the site into a custom Docsify-style site.
- Add a persistent Pages-only control in the top-right corner that links back to `https://github.com/Graiphic/Nest`.
- Preserve existing README content and asset paths.

## Design

### README banner

Insert a top-level HTML block at the top of `README.md`:

- Wrap the banner in a container class that is easy to target from Pages CSS.
- Link the banner to `https://graiphic.github.io/Nest/`.
- Reuse the red SVG banner visual from `GO-Whitepapers`, adapted to NEST copy and asset path.

### Pages-only hiding and GitHub return button

Use GitHub Pages theme customization through `_includes/head-custom.html`:

- Inject CSS that hides the README banner container on Pages.
- Inject CSS for a fixed top-right "View on GitHub" button.
- Inject a lightweight script that appends the button to `document.body` only when it is not already present.

This keeps the GitHub repository README untouched while letting Pages behave differently.

### Assets

Create `assets/open-github-pages-banner.svg` in the repository root:

- Keep the red visual style consistent with `GO-Whitepapers`.
- Update text to point to the NEST website version.

### Verification

Add a PowerShell smoke test script that checks:

- `README.md` contains the banner block and the Pages URL.
- `assets/open-github-pages-banner.svg` exists and contains the expected title text.
- `_includes/head-custom.html` exists and contains both the banner-hide selector and the GitHub return button tokens.

## Risks

- GitHub Pages theme HTML may change in the future, but `_includes/head-custom.html` is the intended extension point for the current setup.
- Without a local Jekyll runtime, verification is static rather than full rendered-page validation. The smoke test should therefore focus on the exact files and selectors required by GitHub Pages.
