// User variables
#let palavras-chave-title = "Palavras-chave\n(Portuguese is mandatory)"
#let palavras-chave-content = "palavra1, palavra2, palavra3, palavra4, palavra5" // Replace with your keywords

#let resumo-title = "Resumo\n(Portuguese is mandatory)"
#let resumo-content = "Resumo" // Replace with your abstract

// Main content
#block(
  width: 100%,
  height: 100%,
)[
  #set text(lang: "pt")
  
  // First row - 5cm (empty rows)
  #place(
    top + left,
    block(
      width: 5.69cm,
      height: 5cm,
    )[]
  )
  
  #place(
    top + left,
    dx: 5.69cm,
    block(
      width: 12.43cm,
      height: 5cm,
    )[]
  )
  
  // Second row - 2.47cm (empty rows)
  #place(
    top + left,
    dy: 5cm,
    block(
      width: 5.69cm,
      height: 2.47cm,
    )[]
  )
  
  #place(
    top + left,
    dx: 5.69cm,
    dy: 5cm,
    block(
      width: 12.43cm,
      height: 2.47cm,
    )[]
  )
  
  // Third row - 2.47cm (keywords)
  #place(
    top + left,
    dy: 7.47cm,
    block(
      width: 5.69cm,
      height: 2.47cm,
    )[
      #pad(top: -8pt)[
        #align(left)[
          #set text(size: 11pt, weight: "bold")
          #palavras-chave-title
        ]
      ]
    ]
  )
  
  #place(
    top + left,
    dx: 5.69cm,
    dy: 7.47cm,
    block(
      width: 12.43cm,
      height: 2.47cm,
    )[
      #pad(top: -8pt)[
        #align(left)[
          #palavras-chave-content
        ]
      ]
    ]
  )
  
  // Fourth row - 16.23cm (abstract)
  #place(
    top + left,
    dy: 9.94cm,
    block(
      width: 5.69cm,
      height: 16.23cm,
    )[
      #pad(top: -8pt)[
        #align(left)[
          #set text(size: 11pt, weight: "bold")
          #resumo-title
        ]
      ]
    ]
  )
  
  #place(
    top + left,
    dx: 5.69cm,
    dy: 9.94cm,
    block(
      width: 12.43cm,
      height: 16.23cm,
    )[
      #pad(top: -8pt)[
        #align(left)[
          #resumo-content
        ]
      ]
    ]
  )
]