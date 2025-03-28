// User variables
#let author-name = "Author's Full Name"
#let title-pt = "PT DISSERTATION TITLE (MAX 130 CHARACTERS)\n(Mandatory)"
#let title-en = "EN DISSERTATION TITLE (MAX 130 CHARACTERS)\n(Optional)"
#let dissertation-text = "Dissertação apresentada à Universidade de Aveiro para cumprimento dos requisitos necessários à obtenção do grau de Mestre em (designação do mestrado), realizada sob a orientação científica do Doutor (nome do orientador), Professor (categoria do orientador) do Departamento de (designação do departamento) da Universidade de Aveiro\n\n(Portuguese mandatory)"
#let financial-support-1 = "Apoio financeiro do POCTI no âmbito do III Quadro Comunitário de Apoio.


(if applicable- Portuguese mandatory)"
#let financial-support-2 = "Apoio financeiro da FCT e do FSE no âmbito do III Quadro Comunitário de Apoio.

(if applicable- Portuguese mandatory)"
#let extra-space = 1cm // Increase if you need more space between title and dissertation text

// Main content
#block(
  width: 100%,
  height: 100%,
)[
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
  
  // Row 3 - Second column (dissertation text)
  #place(
    top + left,
    dx: 31.3%,
    dy: 8.01cm + extra-space,
    block(
      width: 68.6%,
      height: 14.25cm,
    )[
      #pad(top: -5pt)[
        #align(left)[
          #set text(lang: "pt")
          #dissertation-text
        ]
      ]
    ]
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
  
  // Row 4 - Second column (financial support 1)
  #place(
    top + left,
    dx: 31.3%,
    dy: 22.26cm,
    block(
      width: 34.3%,
      height: 4.73cm,
    )[
      #pad(top: -5pt)[
        #align(left)[
          #set text(lang: "pt")
          #financial-support-1
        ]
      ]
    ]
  )
  
  // Row 4 - Third column (financial support 2)
  #place(
    top + left,
    dx: 65.6%,
    dy: 22.26cm,
    block(
      width: 34.3%,
      height: 4.73cm,
    )[
      #pad(top: -5pt)[
        #align(left)[
          #set text(lang: "pt")
          #financial-support-2
        ]
      ]
    ]
  )
]