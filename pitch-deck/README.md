# K’altic: harvest-to-packer workflow

A 14-page Typst product presentation. It follows one illustrative tomato grower answering a packer’s request, shows the MVP’s actual record fields, and separates the proposed handoff from implemented functionality. Dark/light pacing and the existing concept identity are preserved.

```sh
npm --prefix pitch-deck ci
npm --prefix pitch-deck test
npm --prefix pitch-deck run build
```

Node.js 20+; no global Typst installation needed. The pinned npm compiler and bundled fonts make subsequent builds offline. Output: `kaltic-pitch-deck.pdf`, gitignored. All package changes stay here.

Edit `main.typ` for the story, `theme.typ` for visual styling, and `sources.json` for citations. `research.md` records the product hypotheses and factual boundaries. `presentation.test.mjs` checks citation references and scope regressions.

The financial expansion and its model have been removed entirely. The remaining price is a proposed MXN 100/month software subscription, not validated demand. No observed customer workflow, time saving, official approval or working packer integration is invented.

The examples use fictional identifiers and quantities. Fonts and vector assets come from the repo’s concept package; licenses are bundled. No dependency on `../concept` at build time.
