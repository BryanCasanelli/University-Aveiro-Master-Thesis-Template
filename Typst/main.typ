// Basic document configuration
#set page(paper: "a4")

// Configure link styling
#show link: set text(fill: blue)

// Enable section numbering
#set heading(numbering: "1.")

// Configure section headings
#show heading.where(level: 1): it => {
  set align(center)
  set text(size: 24pt, weight: "bold")
  [
    #if it.numbering != none {
      counter(heading).display()
      [ ]
    }
    #it.body
  ]
  v(-0.7cm)
  line(length: 100%, stroke: 1pt)
  v(0.2cm)
}

// For acronyms support
#import "@preview/acrostiche:0.5.1": *

// --------------------------------------------------
// First part
// --------------------------------------------------

// Helvetica like font
#set text(font: "TeX Gyre Heros")

// Font size
#set text(size: 10pt)

// Margins
#set page(
  margin: (
    left: 1.50cm,
    right: 1.50cm,
    top: 0.80cm,
    bottom: 1.00cm
  )
)

// Pages
#include "first_part/01_cover.typ"
#include "first_part/02_title.typ"
#include "first_part/03_jury.typ"
#include "first_part/04_acknowledgements.typ"
#include "first_part/05_abstract_pt.typ"
#include "first_part/06_abstract_en.typ"
#include "first_part/07_tools.typ"


// --------------------------------------------------
// Second part
// --------------------------------------------------

// Linux Libertine
#set text(font: "Linux Libertine")

// Font size
#set text(size: 11pt)

// Set alignment
#set par(justify: true)

// Set english as language
#set text(lang: "en")

// Enable numbering
#set page(numbering: "1", number-align: right)
#counter(page).update(1)

// Margins
#set page(margin: (left: 3cm, right: 2.5cm, top: 3cm, bottom: 3cm))

// Table of contents
#outline()
#pagebreak()

// Table of figures
#outline(title: "List of Figures", target: figure.where(kind: image))
#pagebreak()

// Table of tables
#outline(title: "List of Tables", target: figure.where(kind: table))
#pagebreak()

// Table of acronyms
#import "acronyms.typ": *
#init-acronyms(acronyms)
#print-index(title: "List of Acronyms")
#pagebreak()

// Thesis content
#include "second_part/01_about.typ"
#include "second_part/02_example.typ"

// Bibliography
#pagebreak()
#bibliography("references.bib", title: "References", style: "american-physics-society")