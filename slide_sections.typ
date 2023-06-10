#import "slides.typ": *
#import "slide_footnotes.typ": *

// Meine eigene Implementation für ein Inhaltsverzeichnis.
// Überschreibt die Standardfunktion "new-section" aus "slides.typ"

#let new-section(title) = {
  // Und eine neue Folie wird erzeugt, zusammen mit einer Überschrift.
  slide(theme-variant: "section-slide")[= #title]
  state("current_slide_section").update(title)
}