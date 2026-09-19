// Brand anchors from the Joget passport, plus dark presentation roles.
#let paper = rgb("F1F4E9")
#let brand-green = rgb("2B5540")
#let brand-ink = rgb("161F17")
#let canvas = rgb("162C23")
#let surface = rgb("20392E")
#let raised = rgb("2A4638")
#let ink = paper
#let muted = rgb("B8C7B7")
#let rule = rgb("456150")
#let green = rgb("B5D5AE")
#let leaf = rgb("A9C7B5")
#let blue = rgb("C2C1FF")
#let lavender = rgb("303349")
#let rust = rgb("F2B899")
#let peach = rgb("44372F")

#let label(body, color: muted) = text(font: "Inter", size: 7.5pt, weight: "semibold", tracking: 1pt, fill: color, upper(body))
#let display-font = "Source Serif 4"
#let title(body, size: 30pt, color: ink) = text(font: display-font, size: size, weight: "semibold", fill: color, body)
#let pill(body, color: green, fill: raised) = box(fill: fill, radius: 3pt, inset: (x: 8pt, y: 5pt), text(size: 7.5pt, weight: "semibold", fill: color, body))
#let card(body, fill: surface, inset: 15pt) = block(width: 100%, fill: fill, radius: 7pt, stroke: .6pt + rule, inset: inset, body)
#let datum(name, value) = [#label(name) #v(3pt) #text(size: 12pt, weight: "semibold", value)]
#let note(body) = text(size: 8pt, fill: muted, body)
#let button(body) = box(fill: green, radius: 4pt, inset: (x: 12pt, y: 8pt), text(size: 9pt, fill: canvas, weight: "semibold", body))
#let intro(n, name, heading, body) = [
  #grid(columns: (1fr, auto), label("Kaltic / Design direction 01"), label(n + " / " + name))
  #v(12pt)
  #title(heading)
  #v(5pt)
  #text(fill: muted, size: 10pt, body)
  #v(16pt)
]
#let screen(body, section: "Traceability workspace") = card(inset: 0pt)[
  #block(width: 100%, fill: brand-green, inset: (x: 14pt, y: 9pt), radius: (top-left: 7pt, top-right: 7pt))[
    #grid(columns: (1fr, auto), image("assets/logo-ivory.svg", width: 29mm), text(fill: white, size: 8pt, section))
  ]
  #block(inset: 14pt, width: 100%, body)
]

// Stylized geography: vector illustration, never a real boundary or satellite image.
#let field-art(w: 126mm, h: 77mm) = block(width: w, height: h, fill: rgb("263F32"), radius: 6pt)[
  #place(top + left, dx: w * .06, dy: h * .1, polygon(fill: rgb("526347"), stroke: none,
    (0pt, 0pt), (w * .36, h * .04), (w * .30, h * .39), (w * .02, h * .31)))
  #place(top + left, dx: w * .48, dy: h * .09, polygon(fill: rgb("476857"), stroke: none,
    (0pt, 0pt), (w * .40, h * .05), (w * .37, h * .33), (w * .02, h * .29)))
  #place(top + left, dx: w * .10, dy: h * .51, polygon(fill: rgb("43533C"), stroke: none,
    (0pt, 0pt), (w * .27, 0pt), (w * .24, h * .36), (w * .03, h * .30)))
  #place(top + left, dx: w * .45, dy: h * .49, polygon(fill: brand-green, stroke: 1.5pt + green,
    (0pt, 0pt), (w * .43, h * .02), (w * .39, h * .36), (w * .04, h * .39)))
  #for i in range(7) {
    place(top + left, dx: w * (.51 + i * .045), dy: h * .55,
      line(start: (0pt, 0pt), end: (w * -.015, h * .25), stroke: .8pt + rgb("A9C7B5")))
  }
  #place(top + left, dx: w * .04, dy: h * .45, line(end: (w * .91, h * -.015), stroke: 4pt + canvas))
  #place(top + left, dx: w * .43, dy: h * .04, line(end: (w * -.025, h * .90), stroke: 4pt + canvas))
  #place(top + left, dx: w * .58, dy: h * .65, pill("FIELD 0042", color: green, fill: surface))
  #place(top + left, dx: w * .045, dy: h * .84, text(size: 7pt, fill: green, "SCHEMATIC / NOT TO SCALE"))
  #place(top + right, dx: -8pt, dy: 8pt, text(size: 9pt, weight: "bold", fill: green, "N ↑"))
]

#let step(number, heading, body, color: green) = card[
  #label(number, color: color)
  #v(8pt)
  #title(heading, size: 16pt, color: color)
  #v(6pt)
  #text(size: 9pt, body)
]
