// =========================================
// Duy Tân University theme for Typst slides.
// Made By DƯƠNG TUẤN LINH.
// https://github.com/linhduongtuan/DTU-typst-presentations
// =========================================

#import "slides.typ": *

#let slide_footnote_counter = page


#let sans = ("New Computer Modern Sans")
#set text(font: sans, lang: "vi")

#let dtu-theme(
    mail: "duongtuanlinhlduytan.edu.vn",
    college: "ĐẠI HỌC DUY TÂN",
    usage: "Master Thesis Defense",
    color: rgb("#711A5F"), 
    biglogo: "images/bgd.png", // left cover page logo
    watermark: "images/nankai-10.png", //watermark logo
    logo: "images/duoc.jpeg", // small logo for headers
    dtulogo: "images/dtu.png", // right cover page logo
    ) = data => {
    
    let my-dark = rgb("#192e41")
    let my-bright = rgb("#fafafa")
    let my-accent = rgb("#fc9278")

    let title-slide(slide-info, bodies) = {
     	// setting watermark
        place(dx: 10%, dy: -13%,
        image(watermark, height: 1pt)
        )
        // setting right cover page logo
        place(dx: 0.4em+500pt+0.4em, //set the logo postions at the cover page
        dy: 0.4em,
        image(dtulogo, height: 80pt)
        )
        // setting left cover page logo
        place(dx: 0.4em + 50pt,
        dy: 0.4em,
        image(biglogo, height: 90pt)
        )
        v(82pt)
        // Setting title 
        align(center + horizon)[
            #block(
                // border line color for the title presentation
                stroke: (y: 1mm + rgb("#FF0000"), x: 1mm + rgb("#FF0000")),
                //stroke: (y: 1mm + rgb("#3399FF"), x: 1mm + rgb("#3399FF")),
                inset: 1em,
                breakable: false,
                // fill color for the title presentation
                fill: rgb("#CCFFE5"),
                radius: 15pt,
                [
                    #box()[#text(1.3em)[*#data.title*] \
                    #{
                        if data.subtitle != none {
                            parbreak()  
                            text(.9em)[#data.subtitle]
                        }
                    }
                    ]
                ]
            )
            // #h(1fr)
            #set text(size: 1em)
            #grid(
                columns: (1fr,) * calc.min(data.authors.len(), 3),
                column-gutter: 1em,
                row-gutter: 1em,
                ..data.authors
            )
            #block(
                // Setting vertical line for Author & Supervisor
                stroke: (left: 2mm + rgb("#FF9999")),
                inset: 0.4em,
                breakable: false,
                align(left)[
            #if bodies.len() > 1 {
                panic("title slide of default theme does not support too many bodies")
            } else if bodies.len() == 1 {
                let body = bodies.first()
                text(size: 1em, body)
            }
                ]
            )            
            #parbreak()
            #text(0.8em)[#data.date]
            #v(15fr)
        ]
    }
    // globe font setting

    // Next Pages
    let displayed-title(slide-info) = if "title" in slide-info {
        // Setting text color for section on header
        text(fill: rgb("#FFFFFF"), slide-info.title)
        } else {
        []
    }
    
    let decoration(position, body) = {
        let border =  color
        let strokes = (
            header: ( bottom: border ),
            footer: ( top: border )
        )
        block(
            stroke: none,
            width: 100%,
            height: 1em,
            fill: color,
            outset: 0em, inset: 0em, breakable: false,
            align(left + horizon)[#h(0.2em) 
            #box[
            #box(image(logo, width: .8em))]
            // Setting text color for the others on header and footer
                #text(fill: rgb("#FFFFFF"), 0.5em,body
                )
            ]
        )
    }
    
    let default(slide-info, bodies) = {
        if bodies.len() != 1 {
            panic("default variant of default theme only supports one body per slide")
        }
        let body = bodies.first()
     	place(dx: 50%,
        dy: -13%,
        image(watermark, height: 510pt)
        )

        // header
        decoration("header", section.display() + h(1fr) +displayed-title(slide-info)+ h(1fr)+ data.date +h(1em)+ usage + h(1em))

        if "title" in slide-info {
            block(
                width: 100%, inset: (x: 2em), breakable: false,
                outset: 0em,
                heading(level: 1, slide-info.title)
            )
        }
        
        v(1fr)
        block(
            width: 100%, inset: (x: 2em), breakable: false, outset: 0em,
            text(size: 0.8em)[#body]
        )
        v(2fr)
        
        // footer
        decoration("footer")[
            #h(1em)
            #data.short-authors #h(4em)
            #mail #h(4em)
            #college #h(1fr)
            #text(1.5em)[#logical-slide.display()] #h(1em)
        ]
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
      let wake-up(slide-info, bodies) = {
        if bodies.len() != 1 {
            panic("wake up variant of default theme only supports one body per slide")
        }
        let body = bodies.first()
        v(0em)
        // block(
        //     width: 100%, inset: (x: 2em), breakable: false, outset: 0em,
        //     text(size: 1.5em, fill: white, {v(1fr); body; v(1fr);})
        // )
        block(
            width: 100%, height: 100%-1em,inset: 2em, breakable: false, outset: 0em,
            fill: color,
            text(size: 1.5em, fill: white, {v(1fr); body; v(1fr);})
        )
        v(1fr)
        decoration("footer")[
            #h(1fr)#text(1.5em)[#logical-slide.display()] #h(1em)
        ]
    }

    (
        "title slide": title-slide,
        "default": default,
        "wake up": wake-up,
    )
    
}





