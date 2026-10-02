// Each slide receives its own semantic colors and helpers.
#let sources = json("sources.json")
#let theme(mode) = {
assert(mode in ("dark", "light"), message: "Unknown slide theme")
let light = mode == "light"
let bg = rgb(if light { "F1F4E9" } else { "162C23" })
let panel = rgb(if light { "E5EBDD" } else { "20392E" })
let white = rgb(if light { "162C23" } else { "F1F4E9" })
let mint = rgb(if light { "2B5540" } else { "B5D5AE" })
let muted = rgb(if light { "4F6255" } else { "B8C7B7" })
let gold = rgb(if light { "795A25" } else { "D6BA80" })
let line-color = rgb(if light { "B5C3AE" } else { "456150" })
let label(t) = text(size: 8pt, tracking: 1.2pt, weight: "semibold", fill: mint, upper(t))
let title(t, size: 32pt) = text(font: "Source Serif 4", weight: "semibold", size: size, t)
let note(t) = text(size: 8pt, fill: muted, t)
let card(t) = block(width: 100%, fill: panel, radius: 6pt, inset: 17pt, stroke: .5pt + line-color, t)
let metric(n, caption) = [#text(font: "Source Serif 4", size: 40pt, weight: "semibold", fill: gold, n) #v(5pt) #text(size: 10pt, caption)]
let cols(..items) = grid(columns: (1fr,) * items.pos().len(), gutter: 18pt, ..items.pos())
let section(k, h, subtitle: none) = [#label(k) #v(10pt) #title(h) #v(7pt) #if subtitle != none { text(size: 11pt, fill: muted, subtitle); v(9pt) } #v(9pt)]
let smallhead(h, body) = [#title(h, size: 20pt) #v(9pt) #body]
let cite(..ids) = [#v(1fr) #text(size: 7pt, fill: muted)[#for (i, id) in ids.pos().enumerate() { if i > 0 { [ · ] }; link(sources.at(id).url)[#id / #sources.at(id).short] }]]
let divider(n, h, body) = [#label(n) #v(28pt) #title(h, size: 49pt) #v(18pt) #text(size: 15pt, fill: muted, body)]
(bg: bg, panel: panel, white: white, mint: mint, muted: muted, gold: gold, line-color: line-color, label: label, title: title, note: note, card: card, metric: metric, cols: cols, section: section, smallhead: smallhead, cite: cite, divider: divider)
}

#let slide(mode, body) = {
  let t = theme(mode)
  set page(fill: t.bg,
    footer: context [#line(length: 100%, stroke: .4pt + t.line-color) #v(5pt) #grid(columns: (1fr, auto), text(size: 7pt, fill: t.muted)[K’ALTIC / INVESTOR DISCUSSION / 18 SEPTEMBER 2026], text(size: 7pt, fill: t.mint, counter(page).display("1")))])
  set text(fill: t.white)
  set table(stroke: .5pt + t.line-color, inset: 11pt, fill: t.panel)
  body(t)
}
