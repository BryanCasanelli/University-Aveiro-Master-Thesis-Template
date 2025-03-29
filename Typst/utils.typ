// For acronyms
#import "@preview/acrostiche:0.5.1": *

// For long-short captions
#let flex-caption(short: none, long: none) = context if state("in-outline", false).get() {
  short
} else { long }