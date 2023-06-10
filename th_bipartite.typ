// This theme is inspired by https://slidesgo.com/theme/modern-annual-report

#import "slides.typ": *
#let slide_footnote_counter = page

#let bipartite-theme() = data => {
  let my-dark = rgb("#192e41")
  let my-bright = rgb("#fafafa")
  let my-accent = rgb("#fc9278")

  let title-slide = {
    block(
      width: 100%, height: 60%, outset: 0em, inset: 0em, breakable: false,
      stroke: none, spacing: 0em, fill: my-bright,
      align(center + horizon, text(size: 1.7em, fill: my-dark, data.title))
    )
    block(
      width: 100%, height: 40%, outset: 0em, inset: 0em, breakable: false,
      stroke: none, spacing: 0em, fill: my-dark,
      align(center + horizon, text(fill: my-bright)[
        #text(size: 1.2em, data.subtitle)
        // #v(.0em)

       // #text(size: .9em)[ #data.authors.join(", ") #h(0.25em) #data.email #h(1em) #sym.dot.c #h(1em) #data.date ]
      ])
    )
    place(
      center + horizon, dy: 10%,
      rect(width: 6em, height: .5em, radius: .25em, fill: my-accent)
    )
  }

  let displayed-title(slide-info) = if "title" in slide-info {
    text(fill: my-bright, heading(level: 2, numbering: "1.", slide-info.title))
  } else {
    []
  }

  let west(slide-info, bodies) = {
    if bodies.len() != 1 {
      panic("default variant of bipartite theme only supports one body per slide, has "+str(bodies.len())+". / "+repr(slide-info))
    }
    let body = bodies.first()

    style(s => {
      let footer = box(width: 100%, height: 1em, stroke: my-dark, fill: my-bright,
        {
          box(
            width: if "title" in slide-info.keys() { 30% } else { 10% },
            height: 100%, outset: 0em, stroke: none, fill: my-dark, [])

          box(
            width: if "title" in slide-info.keys() { 70% } else { 90% },
            height: 100%, outset: 0em, inset: (x: 1em), baseline: 0em,
            stroke: none, fill: my-bright,
            align(left + horizon, text(fill: my-dark, size: 0.6em,
              [
                #locate(loc => {
                  let s = state("current_slide_section").at(loc)

                  if s != none {
                    s

                    if state("slide_footnotes").at(loc) != none and state("slide_footnotes").at(loc).len() > 0 {
                      h(0.5em)
                      sym.dot.c
                      h(0.5em)
                    }
                  }
                })
                #gen-footnotes()
                #h(1fr)
                #counter(slide_footnote_counter).display() / #locate(loc => counter(slide_footnote_counter).final(loc).at(0))]))
          )
      })

      box(
        height: 100% - measure(footer, s).height, outset: 0em, baseline: 0em,
        stroke: none, fill: my-dark,

        box(
          width: if "title" in slide-info.keys() { 30% } else { 10% },

          height: 100%, outset: 0em, inset: (x: 1em), baseline: 0em,
          stroke: none, fill: my-dark,
          align( left + horizon, displayed-title(slide-info) )
        ) +
        box(
          width: if "title" in slide-info.keys() { 70% } else { 90% },

          height: 100%, outset: 0em, inset: (x: 1em), baseline: 0em,
          stroke: none, fill: my-bright,
          align(left + horizon, text(fill: my-dark, body))
        )
      )

      v(0em, weak: true)

      footer
    })
  }

  let east(slide-info, bodies) = {
    if bodies.len() != 1 {
      panic("east variant of bipartite theme only supports one body per slide")
    }
    let body = bodies.first()

    box(height: 100% - 1em,
      box(
        width: if "title" in slide-info.keys() { 70% } else { 90% },

        height: 100%, outset: 0em, inset: (x: 1em), baseline: 0em,
        stroke: none, fill: my-bright,
        align(right + horizon, text(fill: my-dark, body))
      )+
      box(
        width: if "title" in slide-info.keys() { 30% } else { 10% },

        height: 100%, outset: 0em, inset: (x: 1em), baseline: 0em,
        stroke: none, fill: my-dark,
        align( right + horizon, displayed-title(slide-info) )
      )
    )

    v(0em, weak: true)
    box(width: 100%, height: 1em, stroke: my-dark, fill: my-bright,
      {
        box(
          width: if "title" in slide-info.keys() { 70% } else { 90% },
          height: 100%, outset: 0em, inset: (x: 1em), baseline: 0em,
          stroke: none, fill: my-bright,
          align(left + horizon, text(fill: my-dark, size: 0.6em,
            [#counter(slide_footnote_counter).display() / #locate(loc => counter(slide_footnote_counter).final(loc).at(0))
            #locate(loc => {
                let s = state("current_slide_section").at(loc)

                if s != none {
                  h(0.5em)
                  sym.dot.c
                  h(0.5em)
                  s
                }
              }) #h(1fr) #gen-footnotes()]))
        )

        box(
          width: if "title" in slide-info.keys() { 30% } else { 10% },
          height: 100%, outset: 0em, stroke: none, fill: my-dark, [])
    })
  }

  let center-split(slide-info, bodies) = {
    if bodies.len() != 2 {
      panic("center split variant of bipartite theme only supports two bodies per slide")
    }
    let body-left = bodies.first()
    let body-right = bodies.last()

    box(
      width: 50%, height: 100%, outset: 0em, inset: (x: 1em), baseline: 0em,
      stroke: none, fill: my-bright,
      align(right + horizon, text(fill: my-dark, body-left))
    )
    box(
      width: 50%, height: 100%, outset: 0em, inset: (x: 1em), baseline: 0em,
      stroke: none, fill: my-dark,
      align(left + horizon, text(fill: my-bright, body-right))
    )
  }

  let center-split-white(slide-info, bodies) = {
    if bodies.len() != 2 {
      panic("center split variant of bipartite theme only supports two bodies per slide")
    }
    let body-left = bodies.first()
    let body-right = bodies.last()

    box(
      width: 50%, height: 100%, outset: 0em, inset: (x: 1em), baseline: 0em,
      stroke: none, fill: my-bright,
      align(right + horizon, text(fill: my-dark, body-left))
    )
    box(
      width: 50%, height: 100%, outset: 0em, inset: (x: 1em), baseline: 0em,
      stroke: none, fill: my-bright,
      align(left + horizon, text(fill: my-dark, body-right))
    )
  }

  let section-slide(slide-info, bodies) = {
    let body-left = bodies.first()

    box(
      width: 100%, height: 100%, outset: 0em, inset: (x: 1em), baseline: 0em,
      stroke: none, fill: my-dark,
      align(center + horizon, text(fill: my-bright, body-left))
    )
  }

  (
    title-slide: title-slide,
    variants: ( "default": west, "east": east, "center split": center-split, "section-slide": section-slide, "center split white": center-split-white),
  )
}
