# LaTeX Thesis Template

This LaTeX template was implemented in January 2025, based on the university's official Word template.

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
* Page numbers are positioned at the bottom right of each page.

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

* **TeX Gyre Heros**: A free alternative to Helvetica for first pages. While the original template specifies Helvetica, TeX Gyre Heros, based on Nimbus Sans, provides a visually similar open-source alternative.
* **Linux Libertine**: A free and elegant font family for main content. According to the specifications, the body font is not restricted. Linux Libertine was chosen as the default for its professional appearance, excellent readability, and comprehensive character set, including extensive math support.

## Adding Content

### To add abstracts and keywords:

1. Edit the corresponding files in `abstract/`:
   * `abstract_en.tex` for English abstract
   * `abstract_pt.tex` for Portuguese abstract
   * `keywords_en.tex` for English keywords
   * `keywords_pt.tex` for Portuguese keywords

### To add new sections:

1. Create a new .tex file in `sections/`
2. Add it using:
   ```tex
   \input{sections/your_file}
   ```

### To add acronyms:

1. Open `acronyms.tex`
2. Add new entries using:
   ```tex
   \newacronym{abc}{ABC}{Acronym Basic Component}
   ```
3. While the traditional `\gls{acronym}` command is available, this template provides several enhanced commands for better flexibility:
   * `\longshort{acronym}` displays the full form followed by the abbreviation in parentheses. After first use, only shows the full form.
   * `\shortlong{acronym}` displays the abbreviation followed by the full form in parentheses. After first use, only shows the abbreviation.
   * `\forcelongshort{acronym}` forces the long-short format regardless of previous usage.
   * `\forceshortlong{acronym}` forces the short-long format regardless of previous usage.
4. Note that for `\gls`, `\longshort`, and `\shortlong`, the complete form will only be shown on first use. Subsequent uses will display according to their respective styles.
5. By default (command `\gls`), the template uses the short-long style (abbreviation followed by full form). This can be modified in `main.tex` by changing:
   ```tex
   \setabbreviationstyle[acronym]{short-long}
   ```

### To add bibliography entries:

1. Open `references.bib`
2. Add entries in BibTeX format:
   ```tex
   @article{reference-key,
       author  = {Author Name},
       title   = {Title},
       journal = {Journal},
       year    = {2024},
   }
   ```
3. To cite in the text, use `\cite{key}`.

## Features

### Automatic Index Generation:
* Table of contents
* List of figures
* List of tables
* List of acronyms

### Bibliography Management:
* Default citation style: numeric-comp
* To change the citation style, modify the biblatex style parameter in `main.tex`:
  ```tex
  \usepackage[style=your-style]{biblatex}
  ```
  where `your-style` can be ieee, apa, chicago, etc.

### Scientific Area Colors:
* Template includes all Pantone colors defined in the original specifications.
* Change the active color in `main.tex` using:
  ```tex
  \colorlet{pantonecolor}{your_color}
  ```
  where `your_color` can be: artscomm, sciences, education, accounting1, accounting2, economics, engineering, languages, or health.

## Note

This implementation was originally designed for engineering theses; minor adjustments might be needed for other fields.