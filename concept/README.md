# Kaltic visual identity & design system

A fourteen-page, 16:9 client-facing design presentation for developing Kaltic's visual identity and pitch deck. It starts with the palette and vector logo, then covers logo usage, typography, layout, components, illustration, presentation and product applications, and review decisions. Thirteen pages use a dark forest canvas with ivory type and layered green panels. Page 7 inverts that treatment to warm paper, a forest logo and light cartographic artwork.

## Build

This directory is a self-contained monorepo package (`@kaltic/concept`): dependencies, lockfile, source, assets and ignore rules live here. Requires Node.js 20 or newer and npm:

```sh
cd concept
npm ci
npm run build
```

Output: `concept/kaltic-concept.pdf`. PDFs in this directory and `node_modules` are ignored by Git. Commit the source, assets, `package.json` and `package-lock.json`; regenerate the PDF locally.

From the repository root, the equivalent commands are `npm --prefix concept ci` and `npm --prefix concept run build`. `npm run build:concept` is also available inside the package as an alias.

The pinned npm compiler includes its native Typst engine, so a global Typst installation is not needed. Keep npm's optional dependencies enabled: they contain the platform-specific binary. The first install requires registry access; subsequent builds use local assets with no network requests. Fonts are included, so no system font installation or Python tooling is required.

Alternatively, from inside `concept`, with Typst 0.14 or newer already installed:

```sh
typst compile --root . --font-path assets/fonts main.typ kaltic-concept.pdf
```

The npm lockfile is the canonical build path; a different installed Typst version may produce slightly different output. The builder sets a fixed PDF timestamp and the document has no automatic date.

## Editing

- `main.typ`: document settings and section ordering.
- `foundations.typ`: palette, vector logo, usage rules, typography, layout, components and illustration.
- `presentation.typ`: the light editorial treatment for a pitch-deck opener, shown after the dark foundations.
- `applications.typ`: workspace, field registration, harvesting, passport, verification and proposed organizational identity.
- `review.typ`: client review points and next-iteration handoff.
- `theme.typ`: brand anchors, dark semantic colors, typography, reusable UI components and field illustration.
- `assets/terroir.svg` and `assets/terroir-light.svg`: dark and light illustrations, with contours, a field polygon and surveying details.
- `assets/kaltik-logo.png`: original white logo extracted from the supplied Joget application.
- `assets/logo-forest.svg` and `assets/logo-ivory.svg`: proposed vector reconstructions, using outlined Fraunces lettering and a simplified redraw of the circular symbol. They contain no raster image or font dependency and are not claimed to be the original master artwork.
- `assets/fonts`: static Source Serif 4 and Inter fonts, plus SIL Open Font License texts. The Fraunces license is retained for the existing outlined logo lettering.

The book follows the repository's product scope. It distinguishes current Preprod workflows from proposed KERI/CIP-0170/mainnet functionality. Screen compositions and data are illustrative, not screenshots or live records. Public transaction links come from `docs/testnet-evidence.md` and do not belong to the fictional examples.

## Visual sources and licensing

The palette and original Fraunces/Inter pairing come from the `kaltic-harvest-passport` CSS inside `appDefinition.xml` in `joget/APP_kaltic_v1-1-20260824012721.jwa`. This guide replaces Fraunces headings with Source Serif 4 Semibold for more conventional, readable letterforms, especially J and f; Inter and the outlined logo artwork are retained. Original color tokens include paper `F1F4E9`, surface `FEFEFA`, ink `161F17`, green `2B5540`, evidence `545FCF` and seal `A8431F`. The presentation adds deep forest `162C23` and muted brass `C4B583` as accents. The legacy logo spells the name “K’altik”; editorial text follows the repository's “Kaltic” spelling. The guide explicitly leaves final spelling and vector master approval as client review decisions.

Dark presentation roles are separate from those brand anchors: canvas `162C23`, surface `20392E`, raised surface `2A4638`, ivory text `F1F4E9`, secondary text `B8C7B7` and rules `456150`. Actions use mint `B5D5AE`; evidence uses `C2C1FF` on `303349`; future states use `F2B899` on `44372F`. The first-page swatches retain the original brand hex values, while semantic badges show their dark-mode tints. The light logo specimen and page 7 explicitly use dark text on paper.

Font sources (downloaded 2026-09-18):

- [Source Serif 4](https://github.com/adobe-fonts/source-serif/tree/4.005R), SIL OFL: upstream static `TTF/SourceSerif4-Semibold.ttf`, release `4.005R`. Used for all presentation headings and the complete alphabet specimen.
- [Fraunces](https://github.com/google/fonts/tree/main/ofl/fraunces), SIL OFL: the existing SVG wordmarks contain outlines from a medium instance at `wght=500`, `opsz=72`, `SOFT=50`, `WONK=1`. No longer used for document text.
- [Inter](https://github.com/google/fonts/tree/main/ofl/inter), SIL OFL: regular and semibold instances at `wght=400/600`, `opsz=14`.

Source Serif 4 is the upstream static font. The Inter instances and existing logo outlines were prepared with fontTools 4.57.0 to avoid Typst's variable-font warnings. License files accompany the assets. Regeneration of these assets is not part of the build. Concept source and original vector art follow the repository's GPL-3.0 license.

The Node builder uses the [typst.ts Node compiler API](https://myriad-dreamin.github.io/typst.ts/cookery/guide/all-in-one-node.html). It prints compiler diagnostics and exits unsuccessfully on compilation errors.
