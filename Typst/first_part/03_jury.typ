// User variables for jury page
#let jury-title = "O júri"
#let presidente-title = "Presidente"
#let vogais-title = "Vogais"
#let portuguese-mandatory = "(Portuguese mandatory)"

// Define presidente
#let presidente = (
  nombre: "Prof. Doutor João Antunes da Silva",
  titulo: "Professor associado da Universidade de Aveiro"
)

// Define vogais
#let vogais = (
  (
    nombre: "Prof. Doutor João Antunes da Silva",
    titulo: "Professor associado da Universidade de Aveiro"
  ),
  (
    nombre: "Prof. Doutor João Antunes da Silva",
    titulo: "Professor associado da Universidade de Aveiro" 
  ),
  (
    nombre: "Prof. Doutor João Antunes da Silva",
    titulo: "Professor associado da Universidade de Aveiro"
  ),
  (
    nombre: "Prof. Doutor João Antunes da Silva",
    titulo: "Professor associado da Universidade de Aveiro"
  ),
  (
    nombre: "Prof. Doutor João Antunes da Silva",
    titulo: "Professor associado da Universidade de Aveiro"
  ),
  (
    nombre: "Prof. Doutor João Antunes da Silva",
    titulo: "Professor associado da Universidade de Aveiro"
  )
)

// Function to render professor info
#let render-professor(profesor) = {
  [
    #profesor.nombre
    #linebreak()
    #set text(size: 8pt)
    #profesor.titulo
  ]
}

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
      width: 5.7cm,
      height: 5cm,
    )[]
  )
  
  #place(
    top + left,
    dx: 5.7cm,
    block(
      width: 12.42cm,
      height: 5cm,
    )[]
  )
  
  // Second row - 2.47cm (Portuguese mandatory text)
  #place(
    top + left,
    dy: 5cm,
    block(
      width: 5.7cm,
      height: 2.47cm,
    )[
      #pad(top: -8pt)[
        #align(left)[
          #set text(lang: "pt")
          #portuguese-mandatory
        ]
      ]
    ]
  )
  
  #place(
    top + left,
    dx: 5.7cm,
    dy: 5cm,
    block(
      width: 12.42cm,
      height: 2.47cm,
    )[]
  )
  
  // Jury title row
  #place(
    top + left,
    dy: 7.47cm,
    block(
      width: 5.7cm,
      height: 0.75cm,
    )[
      #pad(top: -8pt)[
        #align(left)[
          #set text(size: 11pt, weight: "bold", lang: "pt")
          #jury-title
        ]
      ]
    ]
  )
  
  #place(
    top + left,
    dx: 5.7cm,
    dy: 7.47cm,
    block(
      width: 12.42cm,
      height: 0.75cm,
    )[]
  )
  
  // Presidente row
  #place(
    top + left,
    dy: 8.22cm,
    block(
      width: 5.7cm,
      height: 0.75cm,
    )[
      #pad(top: -8pt)[
        #align(left)[
          #set text(lang: "pt")
          #presidente-title
        ]
      ]
    ]
  )
  
  #place(
    top + left,
    dx: 5.7cm,
    dy: 8.22cm,
    block(
      width: 12.42cm,
      height: 0.75cm,
    )[
      #pad(top: -8pt)[
        #align(left)[
          #set text(lang: "pt")
          #render-professor(presidente)
        ]
      ]
    ]
  )
  
  // Empty row
  #place(
    top + left,
    dy: 8.97cm,
    block(
      width: 5.7cm,
      height: 0.75cm,
    )[]
  )
  
  #place(
    top + left,
    dx: 5.7cm,
    dy: 8.97cm,
    block(
      width: 12.42cm,
      height: 0.75cm,
    )[]
  )
  
  // Vogais row with title
  #place(
    top + left,
    dy: 9.72cm,
    block(
      width: 5.7cm,
      height: 0.75cm,
    )[
      #pad(top: -8pt)[
        #align(left)[
          #set text(lang: "pt")
          #vogais-title
        ]
      ]
    ]
  )
  
  // Render each vogal
  #for (i, vogal) in vogais.enumerate() {
    // Professor row - first vogal goes right after the title
    place(
      top + left,
      dx: 5.7cm,
      dy: 9.72cm + (i * 1.5cm),
      block(
        width: 12.42cm,
        height: 0.75cm,
      )[
        #pad(top: -8pt)[
          #align(left)[
            #set text(lang: "pt")
            #render-professor(vogal)
          ]
        ]
      ]
    )
    
    // Only add spacer if this isn't the last vogal
    if i < vogais.len() - 1 {
      place(
        top + left,
        dy: 10.47cm + (i * 1.5cm),
        block(
          width: 5.7cm,
          height: 0.75cm,
        )[]
      )
      
      place(
        top + left,
        dx: 5.7cm,
        dy: 10.47cm + (i * 1.5cm),
        block(
          width: 12.42cm,
          height: 0.75cm,
        )[]
      )
    }
  }
]