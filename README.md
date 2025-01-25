# Template Information and Instructions

This LaTeX version was implemented in January 2025, based on the university's official Word template.

## Page Setup

Following the original template specifications:

* Paper size: A4
* First pages margins:
  * Left: 1.50cm
  * Right: 1.50cm
  * Top: 0.80cm
  * Bottom: 1.00cm
* Main content margins:
  * Left: 3cm
  * Right: 2.5cm
  * Top: 3cm
  * Bottom: 3cm
* Page numbers are positioned at the bottom right of each page

## Directory Structure

The template follows this structure:

```
thesis/
|-- abstract/           # Abstracts and keywords
|   |-- abstract_en.tex # English abstract
|   |-- abstract_pt.tex # Portuguese abstract
|   |-- keywords_en.tex # English keywords
|   +-- keywords_pt.tex # Portuguese keywords
|-- img/               # Images folder
|-- sections/          # Content sections
|-- single_pages/      # Initial pages
|-- acronyms.tex      # Acronyms definitions
|-- main.tex          # Main document
+-- references.bib    # Bibliography
```

## Fonts

The template uses the following free fonts:

* First pages use **TeX Gyre Heros**, a free alternative to Helvetica. While the original template specifies Helvetica, it is a proprietary font that each user would need to purchase. TeX Gyre Heros, based on Nimbus Sans, provides a visually similar open-source alternative.

* Main content uses **Linux Libertine**, a free and elegant font family. According to the specifications, the body font is not restricted, so users can change it to their preferred font. Linux Libertine was chosen as the default for its professional appearance, excellent readability, and comprehensive character set, including extensive math support.

## Adding Content

### Abstracts and Keywords

1. Edit the corresponding files in `abstract/`:
   * `abstract_en.tex` for English abstract
   * `abstract_pt.tex` for Portuguese abstract
   * `keywords_en.tex` for English keywords
   * `keywords_pt.tex` for Portuguese keywords

### New Sections

1. Create a new .tex file in `sections/`
2. Add it using:
   ```
   \input{sections/your_file}
   ```

### Acronyms

1. Open `acronyms.tex`
2. Add new entries using:
   ```
   \newacronym{abc}{ABC}{Acronym Basic Component}
   ```
3. Use in text with `\gls{acronym}` for first use (expands to full form)
4. Subsequent uses with `\gls{acronym}` will show only the short form

### Bibliography

1. Open `references.bib`
2. Add entries in BibTeX format:
   ```
   @article{reference-key,
       author  = {Author Name},
       title   = {Title},
       journal = {Journal},
       year    = {2024},
   }
   ```
3. Cite in text using `\cite{reference-key}`, `\textcite{reference-key}`, or `\parencite{reference-key}`

## Features

* **Automatic Index Generation:**
  * Table of contents
  * List of figures
  * List of tables
  * List of acronyms

* **Bibliography Management:**
  * Default citation style: IEEE
  * To change the citation style, modify the biblatex style parameter in `main.tex`:
    ```
    \usepackage[style=your-style]{biblatex}
    ```
    where `your-style` can be ieee, apa, chicago, etc.

* **Scientific Area Colors:**
  * Template includes all Pantone colors defined in the original specifications
  * Change the active color in `main.tex` using:
    ```
    \colorlet{pantonecolor}{your_color}
    ```
    where `your_color` can be: artscomm, sciences, education, accounting1, accounting2, economics, engineering, languages, or health

## Note

This implementation was originally designed for engineering theses; minor adjustments might be needed for other fields.