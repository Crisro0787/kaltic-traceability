#import "theme.typ": *
// Light presentation application / an intentional inversion of the dark guide.
#set page(fill: paper, footer: context [#grid(columns: (1fr, auto), label("Kaltic / Light presentation application / Direction 01", color: brand-green), label(str(counter(page).get().first()) + " / " + str(counter(page).final().first()), color: brand-green))])
#grid(columns: (1fr, auto), image("assets/logo-forest.svg", width: 46mm), label("Origin. Integrity. Identity.", color: brand-green))
#v(13mm)
#grid(columns: (1fr, 1fr), gutter: 8mm,
  [
    #label("Agricultural provenance", color: brand-green)
    #v(7mm)
    #title([Every harvest.\ A story worth\ tracing.], size: 40pt, color: brand-ink)
    #v(8mm)
    #block(width: 108mm)[#text(size: 12pt, fill: rgb("48513E"))[From a place in the soil to a record the world can inspect. Agricultural traceability, by Kaltic.]]
    #v(10mm)
    #line(length: 25mm, stroke: 1pt + brand-green)
    #v(5mm)
    #label("Product vision / Design edition 2026", color: brand-green)
  ],
  [
    #image("assets/terroir-light.svg", width: 108mm)
    #v(3mm)
    #align(center)[#label("The landscape becomes a record.", color: brand-green)]
  ])

#pagebreak()
