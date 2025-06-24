// For acronyms
#import "@preview/acrostiche:0.5.1": *

// For long-short captions
#let flex-caption(short: none, long: none) = context if state("in-outline", false).get() {
  short
} else { long }

// For review blocks
#let review(body, note: none) = {
  block(
    fill: yellow, // Yellow background
    inset: 8pt,   // Padding
    radius: 3pt,   // Rounded corners
    width: 100%   // Full width
  )[
    // Display the main content
    #body

    // Display the note if one was provided
    #if note != none {
      parbreak()
      line(length: 100%)
      strong("Note")
      parbreak()
      note    
    }
  ]
}

// For code blocks
#let code(body) = {
  block(
    fill: luma(240), // Fondo gris claro
    inset: 5pt,      // Padding interior
    radius: 2pt,     // Bordes redondeados
    width: 100%,     // Opcional: Ocupar todo el ancho
    body             // El contenido pasado a la función
  )
}