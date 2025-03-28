= Template Information and Instructions

This Typst version was implemented in March 2025, based on the university's official Word template.

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
|-- main.typ            # Main document
+-- references.bib      # Bibliography
```

== Fonts
The template uses the following free fonts:
- First pages use *TeX Gyre Heros*, a free alternative to Helvetica. While the original template specifies Helvetica, it is a proprietary font that each user would need to purchase. TeX Gyre Heros, based on Nimbus Sans, provides a visually similar open-source alternative.
- Main content uses *Linux Libertine*, a free and elegant font family. According to the specifications, the body font is not restricted, so users can change it to their preferred font.

== Adding Content
*To modify first part pages:*
1. Each page in the first part is contained in its own file in the `first_part/` directory.
2. Edit the corresponding files to modify titles, names, and other content.
3. Each file contains variables at the top that can be customized.

*To add main thesis content:*
1. Create new .typ files in the `second_part/` directory
2. Follow a naming convention like `XX_section_name.typ` for organization
3. Include each file in the main document using:
   ```typst
   #include "second_part/XX_section_name.typ"
   ```
4. Update your main.typ file to include all sections in the desired order

*To add acronyms:*
1. Make sure to import the Acrostiche package at the beginning of your file:
   ```typst
   #import "@preview/acrostiche:0.5.1": *
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

*To add bibliography entries:*
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

- *Mathematical Equations:*
  - Typst has robust support for typesetting mathematical formulas and equations.
  - For comprehensive information on writing equations, refer to: #link("https://typst.app/docs/reference/math/")[typst.app/docs/reference/math]
  - For a complete list of available mathematical symbols, refer to: #link("https://typst.app/docs/reference/symbols/sym/")[typst.app/docs/reference/symbols/sym]
  - Example of an equation in Typst:
    ```typst
    $ F(x) = integral_(- infinity)^(infinity) f(t) e^(-2 pi i t x) dif t $
    ```
    $ F(x) = integral_(- infinity)^(infinity) f(t) e^(-2 pi i t x) dif t $

== Note
This implementation was originally designed for engineering theses; minor adjustments might be needed for other fields.