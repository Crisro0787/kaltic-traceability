#import "theme.typ": *
#intro("08", "Application / Workspace", "One workspace for the harvest trail.", "Design intent: establish a clear operational hierarchy through a quiet sidebar, summary cards and a ruled activity ledger.")
#screen(section: "Demo farm / Overview")[
  #grid(columns: (37mm, 1fr), gutter: 15pt,
    [#label("Workspace") #v(12pt) #text(weight: "bold", fill: green)[Overview] #v(12pt) Farms #v(12pt) Fields #v(12pt) Coolers #v(12pt) Harvests #v(12pt) Passports],
    [
      #grid(columns: (1fr, auto), title("Good records start here.", size: 23pt), button("+ Register harvest"))
      #v(13pt)
      #grid(columns: (1fr, 1fr, 1fr), gutter: 8pt,
        card[ #datum("Farm", "Demo farm") #v(6pt) #note[Organization record] ],
        card[ #datum("Field", "Field 0042") #v(6pt) #note[Registered polygon] ],
        card[ #datum("Cooler", "Demo cooler") #v(6pt) #note[Recipient reference] ])
      #v(12pt)
      #label("Recent activity / illustrative")
      #v(8pt)
      #table(columns: (1.2fr, 1fr, 1fr, 1fr), stroke: (x: none, y: .5pt + rule), inset: 9pt,
        table.header([*Record*], [*Type*], [*Related record*], [*State*]),
        [DEMO-F-0042], [Field registration], [Demo farm], [Evidence linked],
        [DEMO-H-0042], [Harvest event], [Field 0042], [Recorded],
        [Demo cooler], [Cooler registration], [Recipient directory], [Registered])
    ])
]
#v(10pt)
#grid(columns: (1fr, 1fr), gutter: 12mm,
  note[Farm and cooler registration are implemented workflows. This consolidated dashboard is concept art, not a screenshot of the current application.],
  note[The cooler is a supply-chain recipient reference. This concept does not imply temperature telemetry or a live cold-chain monitoring service.])

#pagebreak()
// 04 — Field registration
#intro("09", "Application / Field", "Give every field a place and an identity.", "Design intent: let the field boundary lead; keep capture, review and submission in a calm, sequential panel.")
#grid(columns: (1.1fr, 1fr), gutter: 11mm,
  [
    #field-art(w: 137mm, h: 84mm)
    #v(9pt)
    #grid(columns: (1fr, 1fr), gutter: 8pt, card[#datum("Geometry", "GeoJSON polygon")], card[#datum("Area / demo", "2.40 hectares")])
    #v(7pt)
    #note[Illustrated boundary only. The MVP uses Leaflet, Leaflet Draw and Turf.js; its supporting service also prepares a satellite image and IPFS reference.]
  ],
  [
    #card[
      #grid(columns: (1fr, auto), label("Register field"), pill("01 / 03"))
      #v(13pt)
      #datum("Farm", "Demo farm")
      #v(12pt)
      #datum("Field name", "Field 0042")
      #v(12pt)
      #datum("Boundary", "Polygon captured")
      #v(14pt)
      #button("Review field record")
      #v(10pt)
      #note[Concept interaction: capture → review → submit.]
    ]
    #v(11pt)
    #label("Underlying MVP flow")
    #v(6pt)
    #text(size: 10pt)[GeoJSON + area → canonical geographic record → SHA-256 → field NFT → transaction ID linked to the field.]
    #v(8pt)
    #note[A field NFT identifies the registered field record. It does not establish land ownership or certify the geographic claim.]
  ])

#pagebreak()
// 05 — Harvest event
#intro("10", "Application / Harvest", "Capture the event while it is still in the field.", "Design intent: pair compact field groups with a clear review action and a short explanation of what happens next.")
#grid(columns: (1.65fr, 1fr), gutter: 10mm,
  [#screen(section: "Harvest / New record")[
    #grid(columns: (1fr, auto), title("Record a harvest", size: 23pt), pill("DRAFT / DEMO"))
    #v(14pt)
    #grid(columns: (1fr, 1fr), gutter: 15pt,
      datum("Commodity", "Tomato"), datum("Variety", "Roma"),
      datum("Quantity", "1,250"), datum("Unit of measure", "kg"),
      datum("Farm", "Demo farm"), datum("Field", "Field 0042"),
      datum("Harvest start", "18 Sep 2026"), datum("Harvest end", "18 Sep 2026"),
      datum("Subsequent recipient", "Demo cooler"), datum("Reference document", "DEMO-DOC-0042"))
    #v(17pt)
    #button("Review structured record")
  ]],
  [
    #title("A record with a trail", size: 23pt)
    #v(12pt)
    #step("01 / CAPTURE", "Event details", [Commodity, quantity, dates, growing area and the next recipient.])
    #v(7pt)
    #step("02 / PREPARE", "Canonical record", [The service sorts object keys recursively and computes a SHA-256 digest.])
    #v(7pt)
    #step("03 / LINK", "Public evidence", [Joget submits selected evidence and links the transaction ID back to the record.], color: blue)
  ])
#v(8pt)
#note[All values above are fictional. Full operational records remain in the application layer. The scripts prepare records and hashes; Joget handles Cardano submission.]

#pagebreak()
// 06 — Product passport
#intro("11", "Application / Passport", "The product story, with evidence in reach.", "Design intent: lead with commodity and origin; place technical evidence in a distinct, secondary panel.")
#grid(columns: (1.5fr, 1fr), gutter: 11mm,
  [#card(inset: 17pt)[
    #grid(columns: (1fr, auto), label("Kaltic / Harvest passport"), pill("DEMO RECORD"))
    #v(12pt)
    #title("Tomato", size: 39pt)
    #v(3pt)
    #text(size: 14pt, fill: leaf)[Roma / Harvest DEMO-H-0042]
    #v(12pt)
    #line(length: 100%, stroke: .6pt + rule)
    #v(10pt)
    #grid(columns: (1fr, 1fr, 1fr), gutter: 10pt, datum("Harvested", "18 Sep 2026"), datum("Quantity", "1,250 kg"), datum("Origin", "Demo farm"))
    #v(15pt)
    #grid(columns: (1.2fr, 1fr), gutter: 13pt,
      field-art(w: 75mm, h: 43mm),
      [#label("Growing area") #v(5pt) #title("Field 0042", size: 19pt) #v(10pt) #label("Next recipient") #v(5pt) Demo cooler #v(10pt) #note[Illustrated location; no real coordinates.]])
  ]],
  [
    #card(fill: lavender)[
      #label("Evidence panel / concept", color: blue)
      #v(9pt)
      #title("Inspect the record.", size: 23pt, color: blue)
      #v(10pt)
      #datum("Network", "Cardano Preprod")
      #v(12pt)
      #datum("Record digest", "Not submitted / demo")
      #v(12pt)
      #datum("Transaction", "None / illustrative record")
      #v(11pt)
      #text(size: 9pt)[A real passport would link to its associated transaction and report the result of comparing the canonical record digest.]
    ]
    #v(12pt)
    #title("Trust, stated precisely.", size: 19pt)
    #v(6pt)
    #text(size: 9pt)[A matching digest supports record integrity. It does not independently prove that a harvest happened, that a product is certified, or that the named farm signed the claim.]
  ])

#pagebreak()
// 07 — System and evidence
#intro("12", "Application / Diagrams", "Keep the detail close. Make the evidence public.", "Diagram language: forest surfaces for operational records, violet for public evidence, explicit arrows for the handoff.")
#grid(columns: (1.4fr, 1fr), gutter: 11mm,
  [
    #card[
      #label("Application layer / operational information", color: green)
      #v(9pt)
      #grid(columns: (1fr, auto, 1fr), gutter: 8pt,
        [#title("Joget DX8", size: 21pt) #v(5pt) #text(size: 9pt)[Forms · workflows\ Full traceability records]],
        [#v(12pt) →],
        [#title("Services", size: 21pt) #v(5pt) #text(size: 9pt)[Canonical JSON\ SHA-256 digest]])
    ]
    #align(center)[#text(size: 17pt, fill: green)[↓] #h(6pt) #text(size: 8pt)[Selected evidence via Joget’s Cardano integration]]
    #card(fill: lavender)[
      #label("Public verification layer", color: blue)
      #v(9pt)
      #grid(columns: (1fr, auto, 1fr), gutter: 8pt,
        [#title("Preprod", size: 21pt, color: blue) #v(5pt) #text(size: 9pt)[Field NFTs\ Transaction metadata]],
        [#v(12pt) →],
        [#title("Reference", size: 21pt, color: blue) #v(5pt) #text(size: 9pt)[Transaction ID\ Linked back to the record]])
    ]
    #align(center)[#text(size: 17pt, fill: blue)[↓]]
    #card[#grid(columns: (1fr, auto), title("Digital Product Passport", size: 21pt), pill("Evidence access", color: blue, fill: lavender))]
  ],
  [
    #title("What can be checked?", size: 23pt)
    #v(10pt)
    #text(size: 10pt)[Inspect a transaction. Recreate a record’s canonical representation. Compare its digest with the associated evidence.]
    #v(12pt)
    #label("Documented public examples")
    #v(7pt)
    #link("https://preprod.cardanoscan.io/transaction/8c7e02a0c3056d33587999337def2e03828510f993a92f70d671b8fac3a17292")[#text(fill: blue)[Field registration + NFT ↗]]
    #v(5pt)
    #note[8c7e02a0…3a17292]
    #v(10pt)
    #link("https://preprod.cardanoscan.io/transaction/2a42fb79867b948d5990dd564abee307b404de54cdcdd6d78dea84a4039b472b?tab=metadata")[#text(fill: blue)[Harvest transaction metadata ↗]]
    #v(5pt)
    #note[2a42fb79…39b472b]
    #v(12pt)
    #note[These links are copied from docs/testnet-evidence.md; their live contents were not independently audited for this document. They are separate from the fictional UI examples.]
    #v(9pt)
    #pill("Current submitter: Kaltic wallet")
  ])

#pagebreak()
// 08 — Future direction and source ledger
#intro("13", "Application / Future states", "From record integrity to organizational accountability.", "Use terracotta to signal a proposed extension. KERI, CIP-0170 and mainnet remain future work in the repository.")
#grid(columns: (1fr, 1fr, 1fr, 1fr), gutter: 8pt,
  step("01 →", "Organization", [A participating organization would establish a persistent KERI AID.], color: rust),
  step("02 →", "Claim", [The traceability event would reference a canonical record digest.], color: rust),
  step("03 →", "Attestation", [A CIP-0170 attestation would use the organization’s external wallet.], color: rust),
  step("04", "Verification", [A Kaltic verifier would connect mainnet evidence to the passport.], color: rust))
#v(12pt)
#grid(columns: (1fr, 1.2fr), gutter: 12mm,
  [
    #card(fill: peach)[
      #label("Proposed passport extension", color: rust)
      #v(7pt)
      #title("Who stands behind this claim?", size: 23pt, color: rust)
      #v(9pt)
      #text(size: 9pt)[An identity panel would show the organization identifier, the associated attestation and the verification result. The interface must distinguish record integrity from organizational attribution.]
      #v(10pt)
      #pill("PROPOSED / NOT IMPLEMENTED", color: rust, fill: surface)
    ]
  ],
  [
    #label("Source ledger / repository")
    #v(7pt)
    #set text(size: 8.5pt)
    *README.md* — product purpose, current scope and proposed identity stage.
    #v(4pt)
    *docs/architecture.md* — workflows, layer boundaries and wallet model.
    #v(4pt)
    *docs/testnet-evidence.md* — the two public Preprod transaction references.
    #v(4pt)
    #strong("scripts/google-apps-script") — field-registration.gs and harvesting.gs; structured records and hashing.
    #v(4pt)
    *joget/APP_kaltic_v1-1-20260824012721.jwa* — logo resources and harvest-passport CSS tokens (appDefinition.xml).
    #v(8pt)
    #note[Design interpretation: all page compositions, vector field illustrations, the dashboard and UI arrangements are new concept art. No operational data was imported from the application archive. The repo’s pitch-deck file was empty when this atlas was prepared.]
  ])
