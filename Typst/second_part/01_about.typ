#import "../utils.typ": *

= Template Information and #linebreak() Instructions

This Typst version was implemented in March 2025, based on the University of Aveiro's official Word template. For the official guidelines, see: #link("https://www.ua.pt/pt/sga/page/12786")[www.ua.pt/pt/sga/page/12786].

== Page Setup
Following the original template specifications:
- Paper size: A4
- First pages margins:
  - Left: 1.50cm
  - Right: 1.50cm
  - Top: 0.80cm
  - Bottom: 1.00cm
- Main content margins:
  - Left: 3cm
  - Right: 2.5cm
  - Top: 3cm
  - Bottom: 3cm
- Page numbers are positioned at the bottom right of each page.

== Directory Structure
The template follows this structure:
```
thesis/
|-- first_part/         # Initial pages
|   |-- 01_cover.typ    # Cover page
|   |-- 02_title.typ    # Title page
|   |-- 03_jury.typ     # Jury page
|   |-- 04_acknowledgements.typ # Acknowledgements
|   |-- 05_abstract_pt.typ # Portuguese abstract
|   |-- 06_abstract_en.typ # English abstract
|   +-- 07_tools.typ    # AI tools acknowledgement
|-- second_part/        # Main thesis content
|   |-- ...             # Thesis sections
|-- img/                # Images folder
|-- acronyms.typ        # Acronyms definitions
|-- utils.typ           # Utility functions
|-- main.typ            # Main document
+-- references.bib      # Bibliography
```

#pagebreak()

== Fonts
The template uses the following free fonts:
- First pages use *TeX Gyre Heros*, a free alternative to Helvetica. While the original template specifies Helvetica, it is a proprietary font that each user would need to purchase. TeX Gyre Heros, based on Nimbus Sans, provides a visually similar open-source alternative.
- Main content uses *Linux Libertine*, a free and elegant font family. According to the specifications, the body font is not restricted, so users can change it to their preferred font.

== Adding Content

=== Required Import
At the beginning of each file, make sure to import utils.typ which provides support for acronyms, `flex-caption` and `no-num` functions:

```typst
#import "../utils.typ": *
```

- `flex-caption`: Allows different captions in document body vs. table of contents. Use when you need detailed captions but concise TOC entries.
- `no-num`: Creates unnumbered equations for intermediate steps or secondary formulas that don't need references.



=== Sections and Headings
To create headings and sections use equals signs:

```typst
= Main Section (Level 1)
== Subsection (Level 2)
=== Sub-subsection (Level 3)
==== Sub-sub-subsection (Level 4)
```

To reference a section, add a label after the heading and reference it later:

```typst
= Introduction <sec:intro>

// Later in the document
As mentioned in @sec:intro, the problem is complex.
```

For more information about headings, see: #link("https://typst.app/docs/reference/model/heading/")[typst.app/docs/reference/model/heading]

=== First Part Pages
*To modify first part pages:*
1. Each page in the first part is contained in its own file in the `first_part/` directory.
2. Edit the corresponding files to modify titles, names, and other content.
3. Each file contains variables at the top that can be customized.

=== Main Thesis Content
*To add main thesis content:*
1. Create new .typ files in the `second_part/` directory
2. Follow a naming convention like `XX_section_name.typ` for organization
3. Include each file in the main document using:
   ```typst
   #include "second_part/XX_section_name.typ"
   ```
4. Add the following import at the beginning of each new file:
  ```typst
  #import "../utils.typ": *
  ```
5. Add the desired content to the new files.

=== Images
To add images to your document:

1. Images must be added inside a figure:
   ```typst
   #figure(
     image("img/my_image.png", width: 80%),
     caption: flex-caption(
       short: [Short caption for table of contents],
       long: [Longer, more detailed caption for the document body],
     ),
   ) <fig:label>
   ```

2. To reference the figure elsewhere in the document:
   ```typst
   As shown in @fig:label, the results are significant.
   ```

For more information about figures, see: #link("https://typst.app/docs/reference/model/figure/")[typst.app/docs/reference/model/figure].

For more information about images, see: #link("https://typst.app/docs/reference/visualize/image/")[typst.app/docs/reference/visualize/image].

=== Tables
To add tables to your document:

1. Tables must be added inside a figure:
   ```typst
   #figure(
     table(
       columns: (auto, auto, auto),
       inset: 10pt,
       align: center,
       [*Header 1*], [*Header 2*], [*Header 3*],
       [Row 1, Col 1], [Row 1, Col 2], [Row 1, Col 3],
       [Row 2, Col 1], [Row 2, Col 2], [Row 2, Col 3],
     ),
     caption: flex-caption(
       short: [Short caption for list of tables],
       long: [Longer, more detailed caption for the document body],
     ),
   ) <tab:label>
   ```
   
#pagebreak()

2. To reference the table elsewhere in the document:
   ```typst
   As shown in @tab:label, the data indicates...
   ```

For more information about figures, see: #link("https://typst.app/docs/reference/model/figure/")[typst.app/docs/reference/model/figure].

For more information about tables, see: #link("https://typst.app/docs/reference/model/table/")[typst.app/docs/reference/model/table]

=== Mathematical Equations
Typst has support for mathematical formulas and equations. #underline[Note that Typst is a relatively new development and its equation handling may lack some features available in LaTeX].

Equations in Typst always use a single dollar sign (`$`):

=== Mathematical Equations
*Note that Typst is a relatively new development and its equation handling may lack some features available in LaTeX.*

Equations in Typst always use a single dollar sign (\$):

1. For inline equations, use dollar signs without spaces:
   ```typst
   The formula $E = m c^2$ is well-known.
   ```
   This renders as: The formula $E = m c^2$ is well-known.

2. For display equations (block-level), add spaces after the opening and before the closing dollar sign:
   ```typst
   $ E = m c^2 $
   ```
   This renders as:
   $ E = m c^2 $
   
   While this syntax works, it's recommended to use the block format as shown in point 3.

3. For multi-line display equations, structure as follows:
   - Place a dollar sign (\$) alone on the first line
   - Write each equation line, adding a backslash (\\) at the end of every line except the last one
   - End with a dollar sign (\$) alone on the final line:
   ```typst
   $
   E = m c^2 \
   F = m a
   $
   ```
   This renders as:
   $
   E = m c^2 \
   F = m a
   $

#pagebreak()

4. To create an unnumbered line in a block equation, add `#<equate:revoke>` at the end of the line:
   ```typst
   $
   E = m c^2 #<equate:revoke> \
   F = m a
   $
   ```
   This renders as:
   $
   E = m c^2 #<equate:revoke> \
   F = m a
   $

5. To label an equation for referencing, there are two methods:
   
   a. For single-line display equations, add the label after the closing dollar sign:
   ```typst
   $ F = m a $ <eq:newton>
   
   // Later reference it
   As shown in @eq:newton, force equals mass times acceleration.
   ```
   
   b. For multi-line equation blocks, add `#<eq:label>` at the end of the line within the equation block:
   ```typst
   $
   F = m a #<eq:newton> \
   E = m c^2
   $
   
   // Later reference it
   As shown in @eq:newton, force equals mass times acceleration.
   ```

7. To align multiple lines at the equals sign, use `&=`:
   ```typst
   $
   E &= m c^2 \
   E &= m c \cdot c \
   E &= m v^2 (c/v)^2
   $
   ```
   This renders as:
   $
   E &= m c^2 \
   E &= m c \cdot c \
   E &= m v^2 (c/v)^2
   $

8. For multi-letter variables or sequences of variables (like $E = m c^2$), separate them with spaces:
   ```typst
   $ E = m c^2 $   // Notice the spaces between m and c
   ```
   
   Without proper spacing, adjacent variables are interpreted as a single multi-letter identifier rather than separate variables multiplied together.

#pagebreak()
   
9. Example of a complex equation with the Fourier transform:
   ```typst
   $ F(omega) = integral_(- infinity)^(infinity) f(t) e^(- i omega t) d t $ <eq:fourier>
   ```
   This renders as:
   $ F(omega) = integral_(- infinity)^(infinity) f(t) e^(- i omega t) d t $ <eq:fourier>

10. Example of a system of equations with alignment:
    ```typst
    $
    a_1 x + b_1 y &= c_1 \
    a_2 x + b_2 y &= c_2
    $
    ```
    This renders as:
    $
    a_1 x + b_1 y &= c_1 \
    a_2 x + b_2 y &= c_2
    $

For comprehensive information on writing equations, refer to: #link("https://typst.app/docs/reference/math/")[typst.app/docs/reference/math].

For a complete list of available mathematical symbols, refer to: #link("https://typst.app/docs/reference/symbols/sym/")[typst.app/docs/reference/symbols/sym].

=== Acronyms
1. Make sure to import the utils.typ file at the beginning of your file:
   ```typst
   #import "../utils.typ": *
   ```

2. Open `acronyms.typ`
3. Add new entries to the acronyms dictionary:
   ```typst
   #let acronyms = (
     "SDA": ("Simply Defined Acronym", "Simply Defined Acronyms"),
     "ASDA": ("Another Simply Defined Acronym", "Another Simply Defined Acronyms"),
     // Add your new acronyms here
   )
   ```
   Note that each acronym has both singular and plural forms in the second element of each pair.

4. Use these functions to display acronyms in your text:
   - `#acr("SDA")` - Prints the acronym with its definition on the first call, then just the acronym in subsequent calls.
   - `#acrpl("SDA")` - Prints the plural version of the acronym. Uses plural definition if available, otherwise adds an 's' to the acronym.
   - `#acrfull("SDA")` - Displays the full (long) version of the acronym without affecting the state or tracking its usage.
   - `#acrfullp("SDA")` - Displays the full plural version of the acronym without affecting the state or tracking its usage.
   - `#reset-acronym("SDA")` - Resets a single acronym so the next usage will include its definition again.
   - `#reset-all-acronyms()` - Resets all acronyms so the next usage will include their definitions again.

=== Bibliography
1. Open `references.bib`
2. Add entries in BibTeX format:
   ```bibtex
   @article{reference-key,
       author  = {Author Name},
       title   = {Title},
       journal = {Journal},
       year    = {2024},
   }
   ```
3. To cite in the text, use `@reference-key`. For example:
   ```typst
   According to @smith2024, the results were significant.
   ```
   
4. For multiple citations, you can combine them:
   ```typst
   Several studies @smith2024@johnson2023@williams2022 have shown similar results.
   ```

== Features
- *Automatic Index Generation:*
  - Table of contents
  - List of figures
  - List of tables
  - List of acronyms

- *Bibliography Management:*
  - Default citation style: american-physics-society
  - To change the citation style, modify the style parameter in the bibliography function in `main.typ`:
    ```typst
    #bibliography("references.bib", title: "References", style: "your-style")
    ```
    where `your-style` can be any of the supported citation styles documented at #link("https://typst.app/docs/reference/model/bibliography/")[typst.app/docs/reference/model/bibliography] under the style option.

- *Scientific Area Colors:*
  - Template includes all Pantone colors defined in the original specifications.
  - Change the active color in the file `first_part/01_cover.typ` by modifying the pantone-color variable:
    ```typst
    #let pantone-color = engineering
    ```
    where the color can be: artscomm, sciences, education, accounting1, accounting2, economics, engineering, languages, or health.

== Note
This implementation was originally designed for engineering theses; minor adjustments might be needed for other fields.