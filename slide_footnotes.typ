#import "slides.typ": *

#let slide_footnotes = state("slide_footnotes")

#let slide-footnote(e) = {
    slide_footnotes.update(k => {
        if (k == none) {
            return (e,)
        }

        k.push(e)
        return k
    })

    locate(loc => {
        let f = slide_footnotes.at(loc)

        if f != none {
            super([#{f.len()}])
        }
    })
}

#let gen-footnotes() = {
    locate(loc => {
        let f = slide_footnotes.at(loc)

        if f != none {
            let i = 1

            for e in f {
                [#super(str(i))#e #h(0.5em)]

                i += 1
            }
        }
    })

    state("slide_footnotes").update(())
}