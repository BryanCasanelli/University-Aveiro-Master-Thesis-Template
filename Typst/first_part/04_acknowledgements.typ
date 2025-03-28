// User variables
#let acknowledgement-title = "Acknowledgement"
#let acknowledgement-text = "Text\n\n(Optional)"

// Main content
#block(
  width: 100%,
  height: 100%,
)[
  #set text(lang: "en")
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
  
  // Third row - 16.23cm (acknowledgement text)
  #place(
    top + left,
    dy: 7.47cm,
    block(
      width: 5.69cm,
      height: 16.23cm,
    )[
      #pad(top: -8pt)[
        #align(left)[
          #set text(size: 11pt, weight: "bold")
          #acknowledgement-title
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
      height: 16.23cm,
    )[
      #pad(top: -8pt)[
        #align(left)[
          #acknowledgement-text
        ]
      ]
    ]
  )
]