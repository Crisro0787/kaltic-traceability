#import "theme.typ": *
#intro("14", "Review / Next iteration", "A direction to refine together.", "This presentation establishes a visual vocabulary and demonstrates its use. The following decisions shape the next design iteration.")
#grid(columns: (1fr, 1fr), gutter: 14mm,
  [
    #title("Client review", size: 25pt)
    #v(11pt)
    #step("01 / IDENTITY", "Confirm the signature", [Resolve Kaltic versus K’altik. Review the proposed vector reconstruction before treating it as a master brand asset.])
    #v(9pt)
    #step("02 / EXPRESSION", "Tune the level of formality", [Review the deep forest and brass presentation accents, serif scale and the balance of brand expression with operational clarity.])
    #v(9pt)
    #step("03 / APPLICATION", "Choose a screen to develop", [Use the passport or field registration as the first detailed prototype, then carry validated patterns into other workflows.])
  ],
  [
    #title("Design handoff", size: 25pt)
    #v(11pt)
    #card[
      #datum("Included", "Palette · vector logos · type · components")
      #v(10pt)
      #text(size: 10pt)[Layout guidance, original vector artwork, presentation treatment and product/system application studies. Typst sources and fonts are included for iteration.]
      #v(13pt)
      #datum("Next design pass", "Responsive screens & interaction states")
      #v(8pt)
      #text(size: 10pt)[Develop mobile layouts, loading and empty states, validation behavior, accessibility checks and a reusable UI component specification.]
    ]
    #v(12pt)
    #label("Review status / Direction 01")
    #v(7pt)
    #pill("PROPOSED / FOR DISCUSSION", color: rust, fill: peach)
    #v(9pt)
    #note[All sample operational data is fictional. Application layouts are design proposals. Current and proposed technical capabilities follow the repository sources listed on the preceding page.]
  ])
