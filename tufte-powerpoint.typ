/*
  A typst template to emulate the typography of Edward Tufte's _The congnitive style of powerpoint.
  license: CC-by-4.0
  v0.0.1, Bjorn

This template defines the following functions:

The following features are planned but not yet implemented:
- Italicized headers

The following functions are planned but not yet implemented:

//Sideref
//Sidenote
//Sideimage
//With caption
//block quote
//Italicized headers
//Title page
//Smallcaps (IBM)
//Starting sections with small caps
//Indent 2-3 characters on subsequent paras
//Wide image, two panes, two captions
//Whole page image/table
//Adaptive text width, to match figure width
//bottom, full-width images.

*/

//Font sizes and line spacing
#let footnotesize = 8pt
#let normalsize = 10pt
#let baselineskip = 14pt

//Margins for outer margin
#let pagewidth = 8.5in //TODO: make this "if letterpaper"
#let leftmargin = 1in
#let topmargin = 1in
#let headsep = 2 * baselineskip
#let textwidth = 312pt // 26 pc * 12 pt
#let marginparsep = 14pt // space between text and sidenote column; 2 pc
#let marginparwidth = 12pt // width of sidenote column
#let textheight = 44 * baselineskip
#let headheight = baselineskip

/* Reference margins for other paper sizes, from tufte-latex:
\geometry{
  a4paper,
  left=24.8mm,
  top=27.4mm,
  textwidth=107mm,
  marginparsep=8.2mm,
  marginparwidth=49.4mm
}
\geometry{
  left=14.66mm,
  textwidth=102.66mm,
  marginparsep=7.33mm,
  marginparwidth=36.66mm
}
*/

#set page(
  paper: "us-letter",
  width: pagewidth,
  header: rect(fill:white)[
     // Copy the document title here?
    ],
  // Page numbering. Ignored if footer.
  numbering: "1",
  number-align: right,
  margin: (
    top: 1in,
    bottom: 1in,
    inside: 1in,
    outside: marginwidth
    )
)

#set par(
  justify: true,
)
#set text(
  font: "New Computer Modern",
  size: 10pt // default font size for the tufte-latex package.
)

// This doesn't work.
#let sidenote(note) = block(
  width: marginwidth,
  align(right, note),
  fill: rgb("808080"),
  text(note)
  )

// TODO: Italics headings.
#show heading.where(
  level: 1
): it => block(width: 100%)[
  #set align(center)
  #set text(13pt, weight: "regular")
  #smallcaps(it.body)
]

// TODO: smallcaps secondary headings
#show heading.where(
  level: 2
): it => text(
  size: 11pt,
  weight: "regular",
  style: "italic",
  it.body + [.],
)

// WIP.
#let tufte(body) = block[
  // 2-column flexible layout for sidenotes.
  set align(left)
  grid(
    columns: (textwidth, marginwidth),
    column-gutter: 5 mm,
    [
      body
    ],
    [] //empty margin by default
  )
]

#set par(justify: true)

= Introduction

#lorem(100)

#lorem(200)
//#sidenote[Test test]

#lorem(100)

#tufte[
  Edward Tufte argued that *PowerPoint weakens verbal and spatial reasoning*,
  preferring layouts that show _adjacent evidence_ rather than sequential slides.
  //  #sidenote[See _The Cognitive Style of PowerPoint_, p. 4-6]
]
