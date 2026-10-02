#import "theme.typ": *
#let forest = rgb("162C23")
#let brass = rgb("C4B583")
#let swatch(name, hex, color, usage) = [
  #block(width: 100%, height: 20mm, fill: color, radius: 3pt, stroke: .5pt + rule)
  #v(5pt) #label(name) #v(2pt) #text(size: 9pt, hex) #v(3pt) #note(usage)
]

#intro("01", "Identity / Palette", "Rooted in the field. Refined for the world.", "Visual identity & design system · Direction 01 · A proposed evolution of Kaltic’s existing agricultural passport.")
#grid(columns: (1fr, 1.55fr), gutter: 13mm,
  [
    #block(fill: surface, radius: 5pt, inset: 22pt, width: 100%)[
      #v(7mm)
      #align(center)[#image("assets/logo-ivory.svg", width: 86mm)]
      #v(10mm)
      #align(center)[#label("Agricultural provenance", color: brass)]
      #v(6mm)
    ]
    #v(12pt)
    #title("Quiet confidence.", size: 25pt)
    #v(6pt)
    #text(size: 10pt)[A cultivated, editorial identity. Deep green grounds the system; warm paper gives it tactility; fine brass details add ceremony without dominating the product.]
    #v(9pt)
    #note[Vector logo reconstruction shown above. The existing mark and serif character inform this proposal; the redraw is for design review.]
  ],
  [
    #grid(columns: (1fr, 1fr, 1fr), gutter: 10pt,
      swatch("01 / Deep forest", "#162C23", forest, "Presentation backgrounds"),
      swatch("02 / Paper", "#F1F4E9", paper, "Dark-mode text / light canvas"),
      swatch("03 / Warm white", "#FEFEFA", rgb("FEFEFA"), "Light-mode surfaces"),
      swatch("04 / Field green", "#2B5540", brand-green, "Brand / navigation"),
      swatch("05 / Ink", "#161F17", brand-ink, "Light-mode text"),
      swatch("06 / Brass", "#C4B583", brass, "Fine accents on dark"))
    #v(12pt)
    #grid(columns: (1fr, 1fr), gutter: 10pt,
      [#pill("EVIDENCE / #C2C1FF", color: blue, fill: lavender) #v(5pt) #note[Violet tint for evidence on dark.]],
      [#pill("PROPOSED / #F2B899", color: rust, fill: peach) #v(5pt) #note[Terracotta tint for future states.]])
  ])
#v(9pt)
#note[Palette & logo → typography → layout → components → illustration → applications → review. Brand colors are retained; dark surfaces use lighter semantic accents for contrast.]

#pagebreak()
#intro("02", "Identity / Logo", "One signature. Space to breathe.", "A proposed vector reconstruction of the repository’s legacy K’altik mark, with outlined lettering and a simplified circular symbol.")
#grid(columns: (1.4fr, 1fr), gutter: 12mm,
  [
    #card(fill: paper, inset: 22pt)[
      #label("Light application / forest on paper", color: brand-green)
      #v(11pt)
      #align(center)[#box(inset: 24pt, stroke: .6pt + brass)[#image("assets/logo-forest.svg", width: 104mm)]]
      #v(9pt)
      #align(center)[#text(size: 8pt, fill: brand-green)[Minimum clear space: ¼ of the symbol diameter on every side.]]
    ]
    #v(10pt)
    #block(fill: forest, radius: 5pt, inset: 17pt, width: 100%)[
      #label("Primary / ivory on forest", color: brass)
      #v(9pt)
      #image("assets/logo-ivory.svg", width: 80mm)
    ]
  ],
  [
    #title("Usage principles", size: 23pt)
    #v(9pt)
    *Preserve proportion.* Scale the lockup as one unit; keep the symbol and lettering aligned.
    #v(8pt)
    *Keep contrast.* Use forest on light surfaces and ivory on dark forest. Place the mark on a quiet field of color.
    #v(8pt)
    *Minimum size.* Proposed starting point: 30 mm in print or 150 px on screen. Validate at the final output size.
    #v(8pt)
    *Avoid effects.* No stretch, shadows, outlines, gradients or photography directly behind the mark.
    #v(12pt)
    #pill("REVIEW / NAME & MASTER ARTWORK", color: rust, fill: peach)
    #v(6pt)
    #note[The legacy artwork reads K’altik; the repository uses Kaltic. Confirm the final spelling before approving the master logo. These SVGs are a proposed redraw, not an exact vector original.]
  ])

#pagebreak()
#intro("03", "Foundations / Typography", "An editorial voice. An operational rhythm.", "Source Serif 4 brings a clear, classical voice to headings; Inter retains the application’s familiar information layer.")
#grid(columns: (1.35fr, 1fr), gutter: 14mm,
  [
    #label("Display / Source Serif 4 semibold")
    #v(9pt)
    #title([A story worth\ tracing.], size: 44pt)
    #v(11pt)
    #text(font: display-font, weight: "semibold", size: 15pt)[ABCDEFGHIJKLMNOPQRSTUVWXYZ\ abcdefghijklmnopqrstuvwxyz\ Jj Ff Iil1 · Field / Joget / Origin · 0123456789]
    #v(15pt)
    #line(length: 100%, stroke: .6pt + rule)
    #v(10pt)
    #label("Body / Inter regular & semibold")
    #v(6pt)
    #text(size: 12pt)[Clear records connect a harvest to its origin.]
    #v(5pt)
    #text(size: 12pt, weight: "semibold")[Field 0042 · Harvest record · 1,250 kg]
  ],
  [
    #card[
      #label("Presentation type scale")
      #v(9pt)
      #title("Display / 40–44 pt", size: 23pt)
      #v(6pt)
      #title("Page title / 30 pt", size: 20pt)
      #v(7pt)
      #title("Panel / 19–23 pt", size: 17pt)
      #v(9pt)
      #text(size: 10pt)[Body / 10–12 pt / regular]
      #v(7pt)
      #label("Label / 7.5 pt / semibold")
      #v(7pt)
      #note[Annotation / 8 pt / supporting copy]
    ]
    #v(10pt)
    #text(size: 10pt)[Source Serif 4 replaces Fraunces for clearer J and f forms while retaining an editorial serif character. Use one expressive headline per composition; keep labels brief and body text left aligned.]
    #v(8pt)
    #note[These sizes refer to the 320 × 180 mm presentation. Product UI needs a separately tested screen scale: 16 px body, 14 px labels and 24–40 px headings as initial values.]
  ])

#pagebreak()
#intro("04", "Foundations / Layout", "Order creates the sense of luxury.", "Generous margins, deliberate alignment and a small set of proportions let the content feel composed.")
#grid(columns: (1.6fr, 1fr), gutter: 12mm,
  [
    #card(inset: 16pt)[
      #label("16:9 presentation / 12-column planning grid")
      #v(10pt)
      #grid(columns: (1fr,) * 12, gutter: 4pt, ..range(12).map(i => block(width: 100%, height: 21mm, fill: raised, radius: 2pt)))
      #v(10pt)
      #grid(columns: (1fr, 1fr), gutter: 10pt,
        block(width: 100%, height: 32mm, fill: brand-green, inset: 12pt)[#label("6 columns", color: white) #v(7pt) #title("Narrative", size: 23pt, color: white)],
        block(width: 100%, height: 32mm, fill: lavender, inset: 12pt)[#label("6 columns", color: blue) #v(7pt) #title("Hero object", size: 23pt, color: blue)])
      #v(10pt)
      #grid(columns: (2fr, 1fr), gutter: 10pt,
        block(width: 100%, height: 18mm, fill: raised, inset: 10pt)[#label("8 columns / Product application")],
        block(width: 100%, height: 18mm, fill: peach, inset: 10pt)[#label("4 columns / Annotation")])
    ]
  ],
  [
    #title("A repeatable composition", size: 23pt)
    #v(10pt)
    #datum("Canvas", "320 × 180 mm / 16:9")
    #v(9pt)
    #datum("Page margins", "17 mm sides · 13 mm top")
    #v(9pt)
    #datum("Spacing rhythm", "4 / 8 / 12 / 16 / 24 / 32")
    #v(5pt)
    #note[Use points in presentation layouts; translate the rhythm to pixels when designing the UI.]
    #v(10pt)
    #text(size: 10pt)[Align the eyebrow, headline and first content edge. Give the hero more space than its caption. Use thin rules to group information; reserve filled panels for meaning.]
    #v(9pt)
    #note[The planning grid is a guide, not a rigid template. Product screens use their own responsive layout; examples here explore desktop composition.]
  ])

#pagebreak()
#intro("05", "Foundations / Components", "A small, coherent family of details.", "The product language translates the editorial identity into clear actions, quiet surfaces and explicit states.")
#grid(columns: (1fr, 1fr, 1fr), gutter: 10mm,
  [
    #label("01 / Actions")
    #v(11pt)
    #button("Review record")
    #v(11pt)
    #box(inset: (x: 12pt, y: 8pt), radius: 4pt, stroke: .8pt + green)[#text(size: 9pt, fill: green, weight: "semibold")[View evidence ↗]]
    #v(11pt)
    #box(fill: rule, radius: 4pt, inset: (x: 12pt, y: 8pt))[#text(size: 9pt, fill: muted)[Awaiting required fields]]
    #v(13pt)
    #note[One primary action per panel. Secondary actions use an outline or text link. Disabled actions require an explanation.]
    #v(12pt)
    #label("Keyboard focus / proposed")
    #v(7pt)
    #box(inset: 3pt, radius: 6pt, stroke: 1.5pt + blue)[#button("Review record")]
  ],
  [
    #label("02 / Fields & surfaces")
    #v(11pt)
    #card[
      #label("Field name")
      #v(6pt)
      #box(width: 100%, inset: 9pt, radius: 3pt, stroke: .6pt + muted)[Field 0042]
      #v(5pt)
      #note[Use the registered field name.]
      #v(12pt)
      #label("Quantity", color: rust)
      #v(6pt)
      #box(width: 100%, inset: 9pt, radius: 3pt, stroke: 1pt + rust)[—]
      #v(5pt)
      #text(size: 8pt, fill: rust)[Enter a quantity greater than zero.]
    ]
    #v(10pt)
    #note[Dark surface: 20392E. Border: 0.6 pt / 456150. Card radius: 7 pt. Controls: 3–4 pt. Pair every validation color with a specific message.]
  ],
  [
    #label("03 / Status & evidence")
    #v(11pt)
    #pill("Recorded")
    #v(9pt)
    #pill("Evidence linked", color: blue, fill: lavender)
    #v(9pt)
    #pill("Proposed", color: rust, fill: peach)
    #v(13pt)
    #text(size: 10pt)[Status labels describe one fact. “Recorded” means stored; “evidence linked” means a reference exists. Neither implies a completed integrity or identity check.]
    #v(10pt)
    #note[Dark text roles: ivory F1F4E9 and sage B8C7B7. Mint B5D5AE marks actions; violet and terracotta use pale tints. Light applications use ink or forest on paper.]
  ])

#pagebreak()
#intro("06", "Foundations / Illustration", "The field becomes the visual language.", "Cartographic linework connects the agricultural origin to the precision of a traceability record.")
#grid(columns: (1fr, 1fr, 1fr), gutter: 10mm,
  [
    #block(fill: forest, radius: 5pt, inset: 9pt, width: 100%)[#align(center)[#image("assets/terroir.svg", width: 77mm)]]
    #v(10pt)
    #title("Expressive / Terroir", size: 21pt)
    #v(5pt)
    #note[Contour lines, a surveyed polygon and a circular frame. Use as a single hero on presentation openers or brand moments.]
  ],
  [
    #field-art(w: 88mm, h: 83mm)
    #v(10pt)
    #title("Functional / Field", size: 21pt)
    #v(5pt)
    #note[Flat neighboring parcels, a defined boundary and a short identifier. Use inside field registration and passport concepts.]
  ],
  [
    #title("Art direction", size: 23pt)
    #v(10pt)
    *Linework.* Keep contours fine and consistent. Use a limited set of strokes and generous separation.
    #v(9pt)
    *Geometry.* Let polygons and boundaries provide structure. Avoid ornamental shapes with no connection to the product.
    #v(9pt)
    *Composition.* One hero per page. Crop deliberately; keep body copy outside detailed artwork.
    #v(9pt)
    *Meaning.* These illustrations are schematic. Real operational maps need real boundaries, provenance and a separate map legend.
    #v(10pt)
    #pill("EDITABLE VECTOR ARTWORK")
  ])
