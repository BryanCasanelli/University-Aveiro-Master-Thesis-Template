// Color definitions
#let artscomm = rgb(193, 175, 229)
#let sciences = rgb(113, 214, 224)
#let education = rgb(255, 110, 0)
#let accounting1 = rgb(0, 82, 147)
#let accounting2 = rgb(245, 63, 91)
#let economics = rgb(245, 63, 91)
#let engineering = rgb(152, 50, 34)
#let languages = rgb(0, 82, 147)
#let health = rgb(255, 218, 37)

// User variables
#let pantone-color = engineering
#let author-name = "Author's Full Name"
#let title-pt = "PT DISSERTATION TITLE (MAX 130 CHARACTERS)\n(Mandatory)"
#let title-en = "EN DISSERTATION TITLE (MAX 130 CHARACTERS)\n(Optional)"

// Main content
#block(
  width: 100%,
  height: 100%,
)[
  // Top colored bar
  #place(
    top + right,
    dx: 1.5cm,
    dy: -0.8cm,
    block(
      width: 13.89cm,
      height: 0.5cm,
      fill: pantone-color,
    )
  )
  
  // Row 1 - First column (logo)
  #place(
    top + left,
    block(
      width: 30%,
      height: 5cm,
    )[
      #align(right)[
        #box(
          height: 1.35cm,
          width: 1.25cm,
          image("../img/logo.svg")
        )
      ]
    ]
  )
  
  // Row 1 - Second column (University name)
  #place(
    top + left,
    dx: 31.3%,
    block(
      width: 22.2%,
      height: 5cm,
    )[
      #pad(top: 3pt)[
        #text(weight: "bold")[Universidade de Aveiro]
        #linebreak()
        #text(weight: "bold")[YEAR]
      ]
    ]
  )
  
  // Row 1 - Third column (empty)
  #place(
    top + left,
    dx: 53.5%,
    block(
      width: 46.4%,
      height: 5cm,
    )[]
  )
  
  // Row 2 - First column (Author name)
  #place(
    top + left,
    dy: 5cm,
    block(
      width: 31.3%,
      height: 3.01cm,
    )[
      #pad(top: 3pt)[
        #set text(lang: "en")
        #text(size: 14pt, weight: "bold")[#author-name]
      ]
    ]
  )
  
  // Row 2 - Second column (Title)
  #place(
    top + left,
    dx: 31.3%,
    dy: 5cm,
    block(
      width: 68.6%,
      height: 3.01cm,
    )[
      #pad(top: 3pt)[
        #set text(lang: "pt")
        #text(size: 14pt, weight: "bold")[#title-pt]
        #linebreak()
        #linebreak()
        #linebreak()
        #set text(lang: "en")
        #text(size: 14pt, weight: "bold")[#title-en]
      ]
    ]
  )
  
  // Row 3 - First column (empty)
  #place(
    top + left,
    dy: 8.01cm,
    block(
      width: 31.3%,
      height: 14.25cm,
    )[]
  )
  
  // Row 3 - Second column (empty)
  #place(
    top + left,
    dx: 31.3%,
    dy: 8.01cm,
    block(
      width: 68.6%,
      height: 14.25cm,
    )[]
  )
  
  // Row 4 - First column (empty)
  #place(
    top + left,
    dy: 22.26cm,
    block(
      width: 31.3%,
      height: 4.73cm,
    )[]
  )
  
  // Row 4 - Second column (empty)
  #place(
    top + left,
    dx: 31.3%,
    dy: 22.26cm,
    block(
      width: 34.3%,
      height: 4.73cm,
    )[]
  )
  
  // Row 4 - Third column (empty)
  #place(
    top + left,
    dx: 65.6%,
    dy: 22.26cm,
    block(
      width: 34.3%,
      height: 4.73cm,
    )[]
  )
]