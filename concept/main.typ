#import "theme.typ": *
#set document(title: "Kaltic — Visual Identity & Design System", author: "Kaltic", date: none)
#set page(width: 320mm, height: 180mm, margin: (x: 17mm, top: 13mm, bottom: 15mm), fill: canvas,
  footer: context [#line(length: 100%, stroke: .5pt + rule) #v(5pt) #grid(columns: (1fr, auto),
    label("Kaltic / Visual identity & design system / Direction 01"), label(str(counter(page).get().first()) + " / " + str(counter(page).final().first())))])
#set text(font: "Inter", size: 10pt, fill: ink)
#set par(leading: .5em, spacing: 4pt)
#set block(above: 0pt, below: 0pt)

#include "foundations.typ"
#pagebreak()
#include "presentation.typ"
#include "applications.typ"
#pagebreak()
#include "review.typ"
