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

// Improve headers spacing
#show heading: it => {
  if it.level == 1 {
    it
  } else {
    block(
      above: 1.5em,
      below: 1em,
      it
    )
  }
}

// To number figures and equations based on the section number
#show heading.where(level: 1): it => {
  counter(math.equation).update(0)
  counter(figure.where(kind: image)).update(0)
  counter(figure.where(kind: table)).update(0)
  counter(figure.where(kind: raw)).update(0)
  it
}
#set math.equation(numbering: (..num) =>
  numbering("(1.1)", counter(heading).get().first(), num.pos().first())
)
#set figure(numbering: (..num) =>
  numbering("1.1", counter(heading).get().first(), num.pos().first())
)

// For tables, place the caption above
#show figure.where(
  kind: table
): set figure.caption(position: top)

// Custom table format
#set table(
  align: left,
  stroke: (_, y) => (
       top: if y <= 1 { 0.8pt } else { 0pt },
       bottom: 0.8pt,
     )
)

// Improve figures caption
#show figure.caption: it => {
  align(box(align(it, left)), center)
}

// For improved equations support
#import "@preview/equate:0.3.1": equate
#show: equate.with()

// For acronyms support
#import "@preview/acrostiche:0.5.1": *
#import "acronyms.typ": *
#init-acronyms(acronyms)

// Custom function to know when we are in a ToC or not
#let in-outline = state("in-outline", false)
#show outline: it => {
  in-outline.update(true)
  it
  in-outline.update(false)
}

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

// Reset page counter
#counter(page).update(1)

// Pages 1-2: Cover and Title
#include "first_part/01_cover.typ"
#include "first_part/02_title.typ"

// Enable roman numbering
#set page(numbering: "I", number-align: right)

// Pages 3-7: Preliminary pages
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
#print-index(title: "List of Acronyms", delimiter: "", row-gutter: 5pt, used-only: true)
#pagebreak()

// Switch to arabic numbering and reset counter
#set page(numbering: "1", number-align: right)
#counter(page).update(1)

// Thesis content
#include "second_part/01_about.typ"
#pagebreak()
#include "second_part/02_example.typ"


// --------------------------------------------------
// References
// --------------------------------------------------

#pagebreak()
#bibliography("references.bib", title: "References", style: "the-institution-of-engineering-and-technology")


// --------------------------------------------------
// Appendix
// --------------------------------------------------

// Reset section counter
#counter(heading).update(0)

// Change "Section" by "Appendix"
#set heading(
  numbering: ("A.1."),
  supplement: "Appendix"
)

// Configure heading with "Appendix" prefix
#show heading.where(level: 1): it => {
  set align(center)
  set text(size: 24pt, weight: "bold")
  [
    Appendix
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

// Number figures and equations based on appendix letter
#set math.equation(numbering: (..num) =>
  numbering("(A.1)", counter(heading).get().first(), num.pos().first())
)
#set figure(numbering: (..num) =>
  numbering("A.1", counter(heading).get().first(), num.pos().first())
)

// Add your appendices here