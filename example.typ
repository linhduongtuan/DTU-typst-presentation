#import "dtu.typ": *
#import "slides.typ": *
#import "th_bipartite.typ": *
#import "latex_symbol.typ": *
#import "slide_footnotes.typ": *

//#set heading(numbering: "1.1.1.")
#show link: set text(blue)
// Show Latex like LaTeX logo
#show "La!!TeX": [La]+[!TeX]
#show "La!TeX": [#h(-0.2em)#latex-symbol#h(-0.3em)]

#set text(
  font: "New Computer Modern Sans", lang: "vi"
)

#show: slides.with(
    authors: "", //better not type your name here.
    short-authors: "Dương",
    title: "WHY WE SHOULD USE TYPST AS ALTERNATION OF La!TeX FOR TYPSETTING",
    subtitle: "CÓ PHẢI La!TeX ĐÃ LỖI THỜI HAY?",
    short-title: "CHATGPT ASSISTS YOUR WRITTING",
    date: "June 10 2023",
    theme: dtu-theme(mail: "Contact me via: duongtuanlinh@duytan.edu.vn",
    college: "DUY TAN UNIVERSITY - ĐÀ NẴNG - VIET NAM",
    usage: "DƯƠNG TUẤN LINH",
    color: rgb("#0080FE"), // fill a color of header and footer
    ),
)


#let task(description, solution) = [
  #slide[
    #counter("main_task_counter").step()
    #text(size: 1.25em, strong([Câu hỏi ]+locate(loc => counter("main_task_counter").at(loc).first())))

    #par(justify: true, description)
  ]

  #slide[
    #text(size: 1.25em, strong([Cách thực hiện ]+locate(loc => counter("main_task_counter").at(loc).first())))

    #solution]
]

#slide(theme-variant: "title slide")[
// you can write some text here
Supervisor: LINH T. DƯƠNG \
Student: DƯƠNG TUẤN LINH
]

// TODO: need to improve this TOC
/*
#slide[
 #outline(depth:1)
]
*/

#align(center)[
    #new-section(
    text(size:36pt, "BÀI GIẢNG NÀY GỒM 2 PHẦN:

    PHẦN 1. TẠI SAO NÊN DÙNG TYPST 

    PHẦN 2. MỘT SỐ HƯỚNG DẪN CƠ BẢN CHO THƯ VIỆN SOẠN THẢO SLIDE 
    ")
)
]

#align(center)[
    #new-section(
    text(size:40pt, "PHẦN 1. TẠI SAO NÊN DÙNG TYPST")
)
]


#slide(title: "LƯỢC SỬ PHÁT TRIỂN TeX?")[
    //#align(center)[
    - Ai đã từng sử dụng LaTeX? → Bạn sẽ thấy mình may mắn
    - Ai có viết các API? → Làm cho nó dễ dàng hơn
]

#align(center)[
    #new-section(
    text(size:50pt, "Một số vấn đề với La!TeX")
)
]


#slide(title: "Cha để của La!TeX là ai????")[
  #align(center)[
    #image("images/donald_e_knuth.png", height: 35%)

    Donald E. Knuth#slide-footnote("Foto: Brian Flaherty / The New York Times") #text(size: 0.75em, "(born. 10. Jan. 1938)")
  ]
   - Tác giả của TeX và METAFONT, phát triển từ 1977.
   - Tác phẩm nổi tiếng nhất bên cạnh TeX: The Art of Computer Programming
   - Đặc biệt phát triển TeX cho cuốn sách của anh ấy vì anh ấy có những yêu cầu thẩm mỹ đặc biệt mà các nhà xuất bản không đáp ứng được
 
]

#slide(title: "Tiếp theo có những ai đóng góp vào sự phát triển của La!TeX?????")[
  #align(center)[
    #image("images/leslie_lamport.png", height: 35%)

    Leslie Lamport#slide-footnote("Foto: Talia Herman / Quanta Magazine")
    #text(size: 0.75em, "(born 7. Feb. 1941)")
  ]

- Tác giả của LaTeX, phát triển từ đầu những năm 1980
- LaTeX là tập hợp các macro để mở rộng và đơn giản hóa TeX
]

#slide(title: "NHỮNG VẤN ĐỀ TỒN ĐỌNG CỦA La!TeX")[
   + Kích thước chương trình lớn
   + Lựa chọn trình biên dịch
   + Lỗi khó hiểu
]

#slide(title: "Kích thước của chương trình lớn?")[
  #align(center)[
    #image("images/installation_size_latex.png", width: 30%)
    #v(-0.5em)
    So với `21MB` của trình biên dịch của Typst...
    #v(-0.5em)
    #image("images/installation_size_typst.png", width: 30%)
  ]
  - Kích thước cài đặt có thể thay đổi rất nhiều, 300MB..7GB, tuỳ vào các thư viện như TexStudio với texlive hay MiKTex,...
  - vô cùng nhiều gói (đây vừa là thuận lợi nhưng cũng là khó khăn)
]

#slide(title: "Sự đa dạng của chương trình TeX")[
  "La!TeX" không phải là một chương trình duy nhất mà còn:
  - pdfLa​TeX 
  - LuaTeX
  - XeTeX
  - MikTeX
  - KaTeX
  - ...
]

#slide(title: "Thông báo lỗi của Typst, một số ví dụ điển hình")[
  #columns(2, [
    Typst:
```typst
$a+b
```
    #colbreak()
    #set text(size: 16pt)
```
  error: expected dollar sign
  ┌─ test.typ:1:5
  │
1 │ $a+b
  │     ^
```
  ])
]

#slide(title: "Thông báo lỗi của La!TeX")[
  #columns(2, [
    #v(2em)
    La!TeX:

    #set text(size: 22pt)
```tex
\documentclass{article}

\begin{document}
    $a+b
\end{document}
```

#colbreak()
#set text(size: 7pt)

#raw(read("latex_error.log"))
  ])
]

#slide(title: "So sánh thông báo lỗi giữa Typst và La!TeX")[
  

  #set text(size: 18pt)
  #align(center)[
  #table(columns: (auto, auto),
    inset: 0.5em,
    [Typst], [La!TeX],
    ```typ
#set par(leading: [Hello])
                  ^^^^^^^
expected integer, found content
  ```,

    ```latex
\baselineskip=Hello
Missing number, treated as zero.
Illegal unit of measure (pt inserted).
  ```,
    ```typ
#heading()
        ^^
missing argument: body
  ```,
    ```latex
\section
Missing \endcsname inserted.
Missing \endcsname inserted.
...
  ```,
  )

  #set text(size: 12pt)
  (Nguồn: Mädje, Laurenz: #emph["Typst -- A Programmable Markup Language for Typesetting."] Luận văn thạc sĩ Đại học Kĩ thuật Berlin (Technische Universität, 2022.))
]
]
#align(center)[
#new-section(
  text(size:50pt,"Giải pháp cho vấn đề này là Typst")
)
]

#slide(title: "Typst")[
  #align(center, block(width: 60%)[
    #set text(size: 0.65em)

    #grid(columns: (auto, auto),
      gutter: 1em,
      [ #image(height: 40%, width: auto, "images/martin_haug.png")
        Martin Haug\
        (Người phát triển ứng dụng nền web)
      ],
      [ #image(height: 40%, width: auto, "images/laurenz_maedje.png")
        Laurenz Mädje\
        (Người phát triển trình biên dịch)
      ])

    #set text(size: 0.75em)
    #link("https://typst.app/about/"), (Cập nhật lần gần nhất: 26.05.2023, 10:16)
  ])

  #align(horizon)[#block(align(top)[
    - Năm 2019, dự án được bắt đầu tại Technische Universität Berlin
    - Lí do chính là sự thất vọng khi sử dụng La!TeX
  ])]
]

#slide(title: "Mục Đích của việc phát triển Typst")[
  _"Während bestehende Lösungen langsam, schwer zu bedienen oder einschränkend sind, ist Typst sorgfältig entworfen, um leicht erlernbar, flexibel und schnell zu sein. Dafür haben wir eine komplett eigene Markupsprache und Textsatzengine von Grund auf entwickelt. Dadurch sind wir in allen Bereichen des Schreib- und Textsatzprozesses innovationsfähig."_
  + Tạm dịch:
 // _"Mặc dù các giải pháp hiện tại chậm, khó sử dụng hoặc hạn chế, nhưng Typst được thiết kế cẩn thận để dễ học, linh hoạt và nhanh chóng. Chúng tôi đã xây dựng một ngôn ngữ đánh dấu và công cụ sắp chữ hoàn toàn độc quyền ngay từ đầu. Quá trình viết và sắp chữ đổi mới sáng tạo. "_
  _"Trong khi các giải pháp hiện có chậm chạp, khó sử dụng hoặc có hạn chế, Typst đã được thiết kế cẩn thận để dễ học, linh hoạt và nhanh chóng. Để làm được điều đó, chúng tôi đã phát triển một ngôn ngữ đánh dấu và hệ thống xuất bản văn bản hoàn toàn riêng từ đầu. Điều này giúp chúng tôi có khả năng đổi mới trong tất cả các khía cạnh của quá trình viết và xuất bản văn bản."_

  #set text(size: 0.5em)
  #link("https://www.tu.berlin/entrepreneurship/startup-support/unsere-startups/container-profile/startups-2023-typst"), (Truy cập lần gần nhất: 03.05.2023, 10:13)
]

#slide(title: "So sánh một chút giữa Typst và La!TeX")[
  #set text(size: 20pt)

  #align(horizon, table(columns: (auto, auto, auto),
    inset: 1em,
    stroke: none,
    [La!TeX], [Typst], [Kết quả],

    align(top, ```latex
\documentclass{article}

\begin{document}
    \begin{enumerate}
        \item Dies
        \item Ist
        \item Eine
        \item Liste!
    \end{enumerate}
\end{document}
```),

    align(top, ```typst
+ Cái này
+ Là
+ một
+ danh sách!
```), align(top)[
    + Cái này
    + Là
    + một
    + danh sách!
  ]))
]
#align(center)[
#new-section(text(size:50pt, "Ứng dụng Web-App")
)
]
#slide(title: "Nào chúng ta cùng tiến lên!")[
  #set text(size: 20pt)
  *Thuận lợi:*
   - Tất cả các tập tin trực tuyến
   - Các dự án khác nhau có thể được tạo ra
   - Trình soạn thảo trực tuyến tốt
   - Làm việc trên các tệp theo nhóm cùng một lúc
   - Tài liệu tích hợp

  #link("https://typst.app/")

  Tài khoản tạm thời (với $1 <= #[`N`] <= 15$):
  - E-Mail: `typstseminarN@byom.de`
  - Passwort: `typstseminarN`

 Đường dẫn tới: #link("https://github.com/linhduongtuan/DTU-typst-presentations")

  - Mở trình duyệt và trang web
  - Tạo tài khoản của riêng bạn
]

#align(center)[
#new-section(text(size:50pt, "Định dạng trang cơ bản")
)
]
#slide(title: "Định dạng trang cơ bản")[
  - Tiêu đề
  - Đậm, nghiêng
  - danh sách
  - Những bức ảnh
  - Đặt và hiển thị các quy tắc
  - Thay đổi kích thước phông chữ và màu sắc
  - Căn chỉnh văn bản
  - Viết công thức Toán học (tài liệu có ký hiệu)
]

#slide(title: "Heading level")[#{
    let code = ```


= Heading 1!
== Heading 2!
=== Heading 3!
Text ~ Câu chữ

Đoạn văn mới!
    ```

    table(stroke: none,
      columns: (1fr, auto),
      align(top, text(size: 20pt, raw(lang: "typst", code.text))), align(top)[
        #strong[
          #text(size: 36pt, [1. Heading 1!])

          #text(size: 30pt, [1.1. Đầu mục 2!])

          #text(size: 24pt, [1.1.1. Đầu mục 3!])
        ]

        Text

        Đoạn văn mới!
      ])
}]

#slide(title: "Đoạn văn")[#{
    let code = ```
= Tiêu đề thú của tôi
Một đoạn mới bắt đầu trong Typst ngay khi có một dòng trống trong mã.

Thật không may, theo mặc định, các đoạn văn được căn trái, không được căn đều. Chúng ta sắp học cách thay đổi điều đó!
    ```

    // Điều chỉnh khoảng cách giữa các đoạn một chút để bạn có thể
    // nhưng vì vậy nó không giống như một dòng trống
    set block(spacing: 0.75em)

    table(stroke: none,
      columns: (50%, 50%),
      align(top, text(size: 20pt, raw(lang: "typst", code.text))),
      align(top)[
          #strong(text(size: 28pt, [\1. Tổng Quan Tài Liêuj]))
          #set text(size: 20pt)

          - Một đoạn mới bắt đầu trong Typst ngay khi có một dòng trống trong mã.

          - Thật không may, theo mặc định, các đoạn văn được căn trái, không được căn đều. Chúng ta sắp học cách thay đổi điều đó!
      ])
}]

#slide(title: "Chú ý")[#{
    let code = ```
+ Một danh sách được đánh số
+ Có thể rất đẹp!

1. Đó là cách cô ấy đi!
2. Vâng!

- Và ở đây không đánh số!
- Không có bất kỳ con số nào!
    ```

    table(stroke: none,
      columns: (1fr, auto),
      align(top, text(size: 20pt, raw(lang: "typst", code.text))),
      align(top, text(size: 20pt, eval("["+code.text+"]"))))
}]

#slide(title: "Kiểu font chữ")[#{
    let code = ```
#text(font: "Arial", [Xin chào!])

#text(font: "Courier New", [Xin chào!])

#text(font: "New Computer Modern", [Xin chào!])
    ```

    table(stroke: none,
      columns: (1fr, auto),
      align(top, text(size: 20pt, raw(lang: "typst", code.text))),
      align(top, text(size: 20pt, eval("["+code.text+"]"))))
}]

#slide(title: "Nội dung, chuỗi, tập lệnh")[
  #set text(size: 16pt)
  - Có hai loại nội dung trong Typst:
     - Nội dung trong `[...]`
     - Tập lệnh trong `{...}`
     - từ nội dung đến tập lệnh với `#`

   - Mọi tài liệu về cơ bản là nội dung
  #v(1em)

  #table(columns: (50%, 50%),
    stroke: none,
    ```typ
#strong([Đây là nội dung trong tập lệnh!])

#{
  strong([In đậm!])
  [Một lần nữa, đây là nội dung trong tập lệnh!]
}

#{ 3/4 }
    ```, align(top)[
#strong([Đây là nội dung.])

#{
  strong([In đậm!]) 
  [Một lần nữa, đây là nội dung trong tập lệnh!]
}

#{ 3/4 }
    ])
]

#slide(title: "Định dạng font chữ" + slide-footnote(link("https://typst.app/docs/reference/syntax/")))[#{
    let code = ```
*Xin chào!* #strong([Xin chào!])

_Xin chào!_ #emph([Xin chào!])

Xin chào!#super([Xin chào!])

Xin chào!#sub([Xin chào!])

#text(fill: red, [Xin chào chữ màu đỏ!])

#text(fill: rgb("#ff00ff"), [Xin chào chữ màu hồng!])

#text(fill: rgb("#ff00ff"), strong([Xin chào chữ màu hồng!]))
    ```

    table(stroke: none,
      columns: (1fr, auto),
      align(top, text(size: 20pt, raw(lang: "typst", code.text))),
      align(top, text(size: 20pt, eval("["+code.text+"]"))))
}]

#slide(title: "Định dạng vị trí chữ")[#{
    let code = ```
#align(left, [Xin chào!])
#align(center, [Xin chào!])
#align(right, [Xin chào!])
#align(right, strong([Xin chào!]))
    ```

    table(stroke: none,
      columns: (60%, 1fr),
      align(top, text(size: 20pt, raw(lang: "typst", code.text))),
      align(top, text(size: 20pt, eval("["+code.text+"]"))))
}]


#task[Làm thế nào để bạn thực hiện những điều sau đây trong Typst?

#block(stroke: black,
  inset: 1em, [
  #align(center, emph[Trích đoạn từ ngẫu nhiên với lorem])
  #lorem(20)
])
][
  ```typ
#align(center, emph[Trích đoạn từ ngẫu nhiên với lorem])
#lorem(20)
  ```
]

#slide(title: "Thiết lập khoảng cách #1")[#{
    let code = ```
#align(right, [Chiều ngang])
#v(2cm)
Khoảng cách #h(2cm) theo chiều ngang
    ```

    table(stroke: none,
      columns: (1fr, auto),
      align(top, text(size: 18pt, raw(lang: "typst", code.text))),
      align(top, text(size: 18pt, eval("["+code.text+"]"))))
}]

#slide(title: "Thiết lập khoảng cách (Dọc)")[#{
    let code = ```
Liệt kê ví dụ từ slide 21 với khoảng cách dọc.

+ Một danh sách được đánh số
+ Có thể rất đẹp!
#v(2em)
1. Đó là cách cô ấy đi!
2. Vâng!
#v(2em)
- Và ở đây không đánh số!
- Không có bất kỳ con số nào!
    ```

    table(stroke: none,
      columns: (50%, 50%),
      align(top, text(size: 18pt, raw(lang: "typst", code.text))),
      align(top, text(size: 18pt, eval("["+code.text+"]"))))
}]

#slide(title: "Thiết lập khoảng cách (Ngang)")[#{
    let code = ```
+ Mọi đức tính hoàn hảo đều thuộc về Đức Chúa Trời vì bản chất hoàn hảo của ngài.
+ Tồn tại hoàn hảo hơn là không tồn tại.
+ Vì vậy sự tồn tại là một tài sản hoàn hảo.
+ Vậy là có Chúa. #h(1fr) QED
    ```

    table(stroke: none,
      columns: (auto),
      align(top, text(size: 18pt, raw(lang: "typst", code.text))),
      v(1em),
      align(top, text(size: 18pt, eval("["+code.text+"]"))))
}]

#slide(title: "Với ảnh")[#{
    let code = ```
#image(height: 50%, "leslie_lamport.png")
    ```

    table(stroke: none,
      columns: (auto),
      align(top, text(size: 20pt, raw(lang: "typst", code.text))),
      align(top + center, v(1em) + image(width: 50%, "images/leslie_lamport.png")))
}]

#slide(title: [`#block()` và `#box()`])[#{
    let code = ```
Điều này có thể được thực hiện với `#block`: #block(stroke: black, inset: 0.5em, [ `#block()` tạo một dòng mới và có thể được ngắt giữa các trang. Nó có nhiều đối số tùy chọn.])
Đó là cách nó trông ra sao.
    ```

    table(stroke: none,
      columns: (auto, auto),
      align(top, text(size: 18pt, raw(lang: "typst", code.text))),
      align(top, text(size: 18pt, eval("["+code.text+"]"))))
}]

#slide(title: [`#block()` và `#box()`])[#{
    let code = ```

Mặt khác: #box(stroke: black, inset: 2pt, [`#box()`]) tạo ngắt dòng #box(stroke: (bottom: black), inset: 2pt, [không]) và cho phép #box(stroke: (bottom: black), inset: 2pt, [không]) ngắt giữa các trang. Nhưng bạn có thể sử dụng nó để đóng khung mọi thứ chẳng hạn. Để gạch chân, bạn nên sử dụng #underline[`#underline`] thay thế.
    ```

    table(stroke: none,
      columns: (auto, auto),
      align(top, text(size: 18pt, raw(lang: "typst", code.text))),
      align(top, text(size: 18pt, eval("["+code.text+"]"))))
}]

#slide(title: "Bảng")[#{
    let code = ```
#table(
  columns: (auto, 3cm, auto),
  [Xin chào A!],
  [2a],
  [Xin chào B!],
  [Thiên đàng!],
  [2b],
  [Địa ngục!]
)
    ```

    table(stroke: none,
      columns: (1fr, auto),
      align(top, text(size: 18pt, raw(lang: "typst", code.text))),
      align(top, text(size: 18pt, eval("["+code.text+"]"))))
}]

#slide(title: "Công thức toán")[#{
    let code = ```

$ sum_(k=0)^n k = 1 + ... + n $

$ A = pi r^2 $

$ "area" = pi dot.op "radius"^2 $

$ cal(A) :=
    { x in RR | x "is natural" } $

$ frac(a^2, 2) $
    ```

    table(stroke: none,
      columns: (60%, 40%),
      align(top, text(size: 18pt, raw(lang: "typst", code.text))),
      align(top, text(size: 18pt, [
        #set text(font: "New Computer Modern Math")
        #eval("["+code.text+"]")
      ])))
}]

#task[Làm thế nào để bạn thực hiện những điều sau đây trong typst?

#table(columns: (auto, auto),
  strong[Công thức], strong[Cho là],
  $a^2 + b^2 = c^2$, [Định lý Pythagoras],
  $c <= a + b$, [Không xác định])
][
```typ
#table(columns: (auto, auto),
  strong[Công thức], strong[Cho là],
  $a^2 + b^2 = c^2$, [Định lý Pythagoras],
  $c <= a + b$, [Không xác định])
```
]

#slide(title: "Thiết lập quy tắc" + slide-footnote(link("https://typst.app/docs/reference/styling/")))[#{
    let code = ```
Đây là phông chữ mặc định! Q

#set text(font: "New Computer Modern", fill: blue)

Q Từ bây giờ mọi thứ hoàn toàn ở phông chữ khác và thậm chí cả màu xanh lam!
#set par(first-line-indent: 1.5em, justify: true)

Từ bây giờ, mọi dòng đầu tiên của đoạn văn sẽ được thụt vào và căn đều!

Thực sự, tôi chắc chắn! #lorem(20)
    ```

    table(stroke: none,
      columns: (1fr, 1fr),
      align(top, text(size: 18pt, raw(lang: "typst", code.text))),
      align(top, text(size: 18pt, eval("["+code.text+"]"))))
}]

#slide(title: "Thiết lập quy tắc" + slide-footnote(link("https://typst.app/docs/reference/styling/")))[#{
    let code = ```
#show heading: set text(red)

=== Xin chào!

==== Thiên đàng!

// Từ trang giới thiệu 
// cách sử dụng chính thức của Typst
#show "Project": smallcaps
#show "badly": "great"

*We started Project in 2019
and are still working on it.
Project is progressing badly.*
(_Chúng tôi bắt đầu Dự án vào năm 2019
và vẫn đang làm việc trên nó.
Dự án đang tiến triển không mấy khả quan._)
    ```
    table(stroke: none,
      columns: (60%, auto),
      align(top, text(size: 20pt, raw(lang: "typst", code.text))),
      align(top, text(size: 20pt, eval("["+code.text+"]"))))
}]


#task[Làm thế nào để bạn thực hiện những điều sau đây trong Typst? Lưu ý: Quy tắc `show` không áp dụng cho `#lorem()`.

#block(inset: 1em, stroke: black, [
  #set par(justify: true)
  #show "Typst": strong

  Trong typst hiển thị và thiết lập quy tắc là rất mạnh mẽ. Bạn có thể, bạn có thể gõ. Typst phải luôn được in đậm. Đoạn văn có lý. _Lặp lại một chút: Làm thế nào để bạn tạo lại một cái gì đó in nghiêng trong Typst?_
])
][
```typ
#set par(justify: true)
#show "Typst": strong

Trong typst hiển thị và thiết lập quy tắc là rất mạnh mẽ. Bạn có thể, bạn có thể gõ. Typst phải luôn được in đậm. Đoạn văn có lý. _Lặp lại một chút: Làm thế nào để bạn tạo lại một cái gì đó in nghiêng trong Typst?_
```
]

#slide[
  #table(columns: (50%, 50%),
    stroke: none,
    inset: 1em, [
    #set text(size: 12pt)
    #align(left, raw(lang: "latex", read("Beispiele/MatheDeltaEpsilon/edk_latex.tex")))
  ], align(top)[
    #set text(size: 12pt)
    #align(left, raw(lang: "typst", read("Beispiele/MatheDeltaEpsilon/edk_typst.typ")))
  ])
]

#slide[
  #align(center, [
    #image(width: 90%, "Beispiele/MatheDeltaEpsilon/edk_latex.svg")
    #image(width: 90%, "Beispiele/MatheDeltaEpsilon/edk_typst.svg")
  ])
]

#new-section("Tài liệu tham khảo chính thức của Typst...")

#slide[
  - #link("https://typst.app/docs") như một công việc tham khảo
  - Tài liệu rất quan trọng!
]

#slide(title: [Ví dụ về tài liệu tham khảo: Hàm `image`])[#{
    [`image` có thể có nhiều chức năng hơn bạn nghĩ!]

    let code = ```
    #image("leslie_lamport.png")
    ```

    table(stroke: none,
      columns: (auto),
      align(top, text(size: 20pt, raw(lang: "typst", code.text))),
      align(top + center, v(1em) + [
        #image("images/leslie_lamport.png")
      ]))
}]

#slide(title: [Ví dụ về tài liệu tham khảo: Hàm `image`])[#{
    [`image` có thể có nhiều chức năng hơn bạn nghĩ!]

    let code = ```
    #image(height: 50%, "leslie_lamport.png")
    ```

    table(stroke: none,
      columns: (auto),
      align(top, text(size: 20pt, raw(lang: "typst", code.text))),
      align(top + center, v(1em) + [
        #image(height: 50%, "images/leslie_lamport.png")
      ]))
}]

#slide(title: [Ví dụ về tài liệu tham khảo: Hàm `image`])[#{
    // Làm thế nào để tôi có được tất cả thông tin này bây giờ, 
    // hình ảnh với mọi thứ có thể? -> tham khảo Tài liệu hướng dẫn!
    [`image` có thể có nhiều chức năng hơn bạn nghĩ!]
    
    let code = ```
    #image(fit: "stretch", width: 100%, height: 100%, "leslie_lamport.png")
    ```

    table(stroke: none,
      columns: (auto),
      align(top, text(size: 20pt, raw(lang: "typst", code.text))),
      align(top + center, v(1em) + block(height: 50%, width: 100%, [
        #image(fit: "stretch", width: 100%, height: 100%, "images/leslie_lamport.png")
    ])))
}]

#slide[#image("images/doku_image_1.png", fit: "contain")]
#slide[#image("images/doku_image_2.png", fit: "contain")]
#slide[#image("images/doku_image_3.png", fit: "contain")]
#slide[#image("images/doku_image_4.png", fit: "contain")]
#slide[#image("images/doku_image_5.png", fit: "contain")]
#slide[
  Ví dụ `#enum()`:
  #image("images/doku_image_6.png", fit: "contain")
]
#slide[
  Ví dụ `#enum()`:
  #image("images/doku_image_7.png", height: 80%)
]

#task[Tham số nào có thể được sửa đổi theo quy tắc `set` để định dạng danh sách liệt kê (`#enum()`) như sau? tài liệu!

#block(inset: 1em, width: 100%, stroke: black, [
  #set enum(numbering: "I.")
  + Tài liệu tham khảo số 1
  + Tài liệu tham khảo số 2
  + Tài liệu tham khảo số 3
])
][
```typ
#set enum(numbering: "I.")
+ Tài liệu tham khảo số 1
+ Tài liệu tham khảo số 2
+ Tài liệu tham khảo số 3
```
]

#task[Tham số nào có thể được sửa đổi theo quy tắc `set` để định dạng một danh sách không được đánh số như thế này? Hãy đọc tài liệu tham khảo tài liệu!

#block(inset: 1em, width: 100%, stroke: black, [
  #set list(marker: ">")
  - Tài liệu tham khảo số 1
  - Tài liệu tham khảo số 2
  - Tài liệu tham khảo số 3
])
][
```typ
#set list(marker: ">")
  - Tài liệu tham khảo số 1
  - Tài liệu tham khảo số 2
  - Tài liệu tham khảo số 3
```
]

#new-section("Cách tạo mẫu và tập lệnh trong Typst")
//- Chỉnh sửa trang, kích thước trang, header, footer,...
//- Tập lệnh (chú ý: đây là chức năng thuần túy!)

//Không liên quan, bạn có thể tra cứu:
// ----------------------------------
#slide(title: "Sử dụng nhiều tập lệnh")[
#set text(size: 20pt)
#table(stroke: none,
     columns: (50%, 50%),
     image("images/file_list2.png", width: 90%), [
       `chapter1.typ`:
       #pad(left: 1em)[```typst
 == Caption 1
 #lorem(10)
      ```]

       `chapter2.typ`:
       #pad(left: 1em)[```typst
 == Caption 2
 #lorem(10)
       ```]
    ])

   `main.typ`:
   #pad(left: 1em)[```typst
= Cuốn sách tuyệt vời của tôi
  Đây, chapter!

 #include "chapter1.typ"
 #include "chapter2.typ"
  ```]
]

#slide(title: "Các hàm và biến #1")[#{
    let code = ```
#let var = 3.14159
#let double(e) = {
  return 2*e
}

$pi$ xấp xỉ #var! \
$tau$ xấp xỉ #double(var)!

$pi approx var$ \
$tau approx double(var)$
    ```

    table(stroke: none,
      columns: (60%, auto),
      align(top, text(size: 20pt, raw(lang: "typst", code.text))),
      align(top, text(size: 20pt, eval("["+code.text+"]"))))
}]

#slide(title: "Các hàm và biến #2")[
Một lưu ý: chúng tôi đang làm việc với #emph[tên hàm].
  #{
    let code = ```
#let var = 2
#let change_var(new_v) = {
  var = new_v
  return var
}

#change_var(100)
    ```

    table(stroke: none,
      columns: (50%, auto),

      align(top, text(size: 18pt, [Không hoạt động:] + par(raw(lang: "typst", code.text)))),

      align(top, text(size: 18pt, [
        SAI:
```typc
#let change_var(new_v) = {
  var = new_v
  ``` ```
  ^^^
variables from outside the function are read-only and cannot be modified
```])))
}]

#slide(title: "Các hàm và biến #3")[#{
  set text(size: 22pt)
  let code = ```
#let names = ("Peter", "Petra", "Josef", "Josefa")
#let greet(names) = {
  [Xin chào ]
  names.join(last: " và ", ", ")
  [! #names.len() Tên rất hay!]
}

#greet(names)
    ```

  raw(lang: "typst", code.text)

  v(1em)
  eval("["+code.text+"]")
}]

// Kann man auch nachschlagen:
// ---------------------------
 #slide(title: "Hàm chức năng khác từ tệp bên ngoài")[
   #set text(size: 20pt)
   #table(stroke: none,
     columns: (50%, 50%),
     image("images/file_list.png", width: 90%), [
       `greet_me.typ` definiert:
       - `greet(names)`
       - `double(n)`
   ])


   ```typst
 #import "greet_me.typ": *
 #import "greet_me.typ": greet
   ```
 ]

#task[Chúng ta muốn tạo một hàm cộng hai số và định dạng kết quả #text(red, [red]) và #strong[bold]. Như thế này:

#let add(a, b) = strong(text(red, [#(a+b)]))
```typ
#add(20, 40)
```

#add(20, 40)
][
  #set text(18pt)
  #grid(columns: (auto, auto),
    gutter: 1em,
    [Cách phổ biến nhất:

```typ
#let add(a, b) = strong(text(red, [#(a+b)]))
#add(20, 40)
```

hoặc biến số thành chuỗi bằng `#str()`:

```typ
#let add(a, b) = strong(text(red, str(a+b)))
#add(20, 40)
```], align(top)[hoặc với dấu ngoặc:

```typ
#let add(a, b) = {
  let result = a+b
  strong(text(red, str(result)))
}

#add(20, 40)
```
  ])
]

#new-section("Typst có thể còn làm được nhiều việc hơn nữa!")

#slide(title: "Typst có thể còn làm được nhiều việc hơn nữa!")[
   // #set text(size: 20pt)
- Thư mục
- Số liệu và tài liệu tham khảo
- hiển thị tài liệu!!!
- Raytracing #link("https://github.com/elteammate")
]


#slide(title: "Hình và Tài liệu tham khảo " + slide-footnote(link("https://typst.app/docs/reference/meta/figure/")))[
  #align(center, table(stroke: none,
    columns: (auto),

    align(left, text(size: 18pt, raw(lang: "typst",
```
@glacier shows a glacier. Glaciers
are complex systems.

#figure(
  image("glacier.jpg", height: 80%),
  caption: [A curious figure.],
) <glacier>
```.text) + v(1em))),

    image(height: 50%, "images/figures_and_references.png")))
]

#slide(title: "TÀI LIỆU THAM KHẢO" + slide-footnote(link("https://typst.app/docs/reference/meta/bibliography/")))[
  #align(center, table(stroke: none,
    columns: (auto, auto),
    align(left)[#text(size: 14pt)[`works.bib`: ```bib
@article{netwok,
  title={At-scale impact of the {Net Wok}: A culinarically holistic investigation of distributed dumplings},
  author={Astley, Rick and Morris, Linda},
  journal={Armenian Journal of Proceedings},
  volume={61},
  pages={192--219},
  year={2020},
  publisher={Automattic Inc.}
}

@article{arrgh,
  title={The Pirate Organization},
  author={Leeson, Peter T.},
}
```]],

    align(left, text(size: 18pt, raw(lang: "typst",
```
This was already noted by
pirates long ago. @arrgh

Multiple sources say ...
#cite("arrgh", "netwok").

#bibliography("works.bib")
```.text) + v(1em))) +

    image(height: 50%, "images/bibliography.png")))
]

#slide(title: "Raytracing")[
  #image("images/raytracer.png")

  Công cụ dò tia đầy đủ chức năng để kết xuất 3D.#slide-footnote([Autor: ] + link("https://github.com/elteammate"))
]

#new-section("TẠM KẾT")

#slide(title: [Typst còn thiếu những gì?#slide-footnote(link("https://github.com/typst/typst/issues/712"))])[
  - Bản cập nhật version 0.4.0 ngày 10.06.2023
  - Quản lý thư viện #text(size: 20pt, fill: rgb("#8a8a8a"))[(Xem nhanh tại đây: GitHub)]
  - StackOverflow #text(size: 20pt, fill: rgb("#8a8a8a"))[(Thảo luận tại đây: Discord)]
]

#slide(title: [Một số cập nhật tiếp theon#slide-footnote(link("https://github.com/typst/typst/issues/712"))])[
  #block[#align(top)[
    - Cải thiện công cụ bố trí
    - Quản lý gói
    - Cải thiện bố cục toán học
    - Đầu ra HTML
    - Tham khảo thêm về lộ trình phát triển Typst tại đây https://typst.app/docs/roadmap
  ]]
]

#slide(title: "Ai (không) nên dùng Typst?")[#box[#align(top)[

 Việc cần làm: mở rộng và đánh giá nghiêm túc Typst để giải thích các câu hỏi:
   
    - Tại sao tôi nên sử dụng Typst khi LaTeX đang chạy khắp mọi nơi?
    - Vấn đề con gà và quả trứng
    - Chúng ta không thể hào hứng với những công nghệ mới chỉ vì chúng ta nghĩ rằng chúng hay sao? 
    - Làm sao mọi thứ có thể bắt kịp nếu chúng ta cứ nghĩ, "Ừ, nhưng chúng ta đã từng làm khác đi."?

     LaTeX có nhiều gói hỗ trợ hơn. Typst thậm chí chưa hỗ trợ công cụ vẽ hình như TikZ (tôi biết có người đang phát triển công cụ tương đương).
       - Các lựa chọn thay thế: Tạo SVG bằng TikZ và nhúng nó vào Typst hoặc sử dụng GraphViz
       - https://github.com/johannes-wolf/typst-canvas làm thư viện cơ bản để vẽ các hình

     Tổng quát: vấn đề con gà và quả trứng. Đôi khi bạn không thể làm những việc ngoài sở thích? Chúng ta không thể chỉ quan tâm đến các công nghệ mới sao? Tôi có thực sự cần tất cả "khả năng" không, con quái vật LaTeX?
]
]
]

#slide(title: "Ai (không) nên dùng Typst?")[#box[#align(top)[
#set text(size: 18pt)
  #set list(marker: text(fill: green, emoji.checkmark))
  #underline[*Thuận lợi:*]
  - #strong[steile] Đường cong học tập
   - Lập trình viên có nhiều cách tiếp cận, và cực kỳ dễ mở rộng
   - Cộng đồng tích cực
   - Thời gian biên cực dịch nhanh
   - IDE trực tuyến
   - Thông báo lỗi dễ hiểu

  #set list(marker: text(fill: red, [✗]))
  #underline[*Khó khăn:*]
   - Lập trình viên có nhiều cách tiếp cận khác nhau
   - Bố cục phức tạp (chưa có hình nổi)
   - Các hàm thuần túy có thể nặng (trạng thái, bộ đếm, ...)
   - Cho đến nay chưa có sự hỗ trợ từ các tạp chí lớn
   - Chưa quản lý gói trung tâm

  #emph[(Stand: 10.06.2023)]
]
]
]

#slide(title: "Tiếp theo")[
  #set text(size: 18pt)
  *Lưu ý:* Toàn bộ bản trình bày này chỉ được tạo bằng Typst và Typst-LPS trên VSC.

   - Tài liệu Typst: https://typst.app/docs/

   - Hướng dẫn Typst chính thức: https://typst.app/docs/tutorial

   - Typst Discord chính thức: https://discord.gg/2uDybryKPe

   - Mã cho bài thuyết trình này và các ví dụ khác: https://github.com/linhduongtuan/DTU-typst-presentations

   - Luận văn thạc sĩ về Typst của Laurenz Mädje: https://www.user.tu-berlin.de/laurmaedje/programmable-markup-lingu-for-typesetting.pdf

   - Luận văn thạc sĩ về Typst của Martin Haug: https://www.user.tu-berlin.de/mhaug/fast-typesetting-incremental-compilation.pdf

   - Lambdas, Bang và Bộ đếm: https://typst.app/project/rpnqiqoQNfxXjHQmpJ81nF

   - Danh sách dự án về Typst: https://github.com/qjcg/awesome-typst
]
#align(center)[
    #new-section(
    text(size:36pt, "PHẦN 2. MỘT SỐ HƯỚNG DẪN CƠ BẢN CHO THƯ VIỆN SOẠN THẢO SLIDE")
    )
]
#slide(title: "Về soạn thảo slides sử dụng mã nguồn này")[
    - Phần trình bày này nhằm giới thiệu ngắn gọn những gì bạn có thể làm với phần mềm này bản mẫu.

     - Để có tài liệu đầy đủ, hãy đọc
    #link("https://andreaskroepelin.github.io/typst-slides/book/")[online book].
]

#slide(title: "Who are you")[
    + Hãy khám phá những gì chúng ta có ở đây.

    - Trên đầu trang chiếu này, bạn có thể thấy tiêu đề trang chiếu.

    - Chúng tôi đã sử dụng đối số `title` của hàm `#slide` cho điều đó:
    ```typ
    #slide(title: "First slide")[
        ...
    ]
    ```
]

#slide[
    - Tiêu đề không bắt buộc, slide này không có tiêu đề.

    - Nhưng bạn có để ý rằng tên phần hiện tại được hiển thị phía trên
     dòng trên cùng?

    - Chúng tôi đã xác định nó bằng cách sử dụng
    #raw("#new-section(\"Introduction\")", lang: "typst", block: false).

    - Điều này giúp khán giả của chúng tôi không bị lạc sau một giấc ngủ ngắn.
]

#slide(title: "Phần bên dưới mỗi slide")[
    - Bây giờ, hãy nhìn xuống dưới mỗi slide!

    - Ở đó chúng tôi có một số thông tin chung cho khán giả về những gì họ đang nói
     thực sự tham dự ngay bây giờ.

    - Bạn cũng có thể thấy số slide ở đó.
]

#new-section("Nội dung cho mỗi slide động")

#slide(title: [Slide động với hàm `pause`s])[
    - Đôi khi chúng ta không muốn hiển thị mọi thứ cùng một lúc.
    #let pc = 1
    #{ pc += 1 } #show: pause(pc)

    - Đó là mục đích của chức năng `pause`!
    - Sử dụng nó như sau:
    ```typ
    #show: pause(n)
    ```
    #{ pc += 1 } #show: pause(pc)

    Nó làm cho mọi thứ sau nó xuất hiện ở trang phụ thứ `n`.

    #text(.6em)[(Cũng lưu ý rằng số trang chiếu không thay đổi khi chúng tôi ở đây.)]
]

#slide(title: "Kiểm soát những chi tiết nhỏ")[
    + Khi `#pause` không đủ, bạn có thể sử dụng các lệnh nâng cao hơn để hiển thị hoặc ẩn nội dung.

    + Đây là những lựa chọn của bạn:
    - `#uncover`
    - `#only`
    - `#alternatives`
    - `#one-by-one`
    - `#line-by-line`

    #set text(size: 24pt, style: "oblique")
    Hãy khám phá chúng chi tiết hơn!
]

#let example(body) = block(
    width: 100%,
    inset: .5em,
    fill: aqua.lighten(80%),
    radius: .5em,
    text(size: .8em, body)
)

#slide(title: [`#uncover`: Bảo tồn Khoảng cách])[
    Sử dụng hàm `#uncover`, nội dung vẫn chiểm khoảng không gian, thậm chí not sẽ không hiện nội dung.

    Ví dụ , #uncover(2)[Từ này] chỉ nhìn thấy ở slide phụ ("subslide") thứ hai.

    Trong `()` đằng sau `#uncover`, bạn chỉ định _when_ để hiển thị nội dung và trong
     `[]` sau đó bạn nói _what_ để hiển thị:
    #example[
        ```typ
        #uncover(3)[chỉ nhìn thấy ở slide phụ ("subslide") thứ ba"]
        ```
        #uncover(3)[chỉ nhìn thấy ở slide phụ ("subslide") thứ ba]
    ]
]

#slide(title: "Các nguyên tắc hiển thị phức tạp")[
    - Cho đến nay, chúng tôi chỉ sử dụng các chỉ mục trang chiếu con duy nhất để xác định thời điểm hiển thị nội dung nào đó.

    - Chúng ta cũng có thể sử dụng các mảng số...
    #example[
        ```typ
        #uncover((1, 3, 4))[Hiển thị các slides thứ 1, 3, và 4]
        ```
        #uncover((1, 3, 4))[Hiển thị các slides thứ 1, 3, và 4]
    ]

    ...hay với một dictionary khi sử dụng `beginning` hay `until`:
    #example[
        ```typ
        #uncover((beginning: 2, until: 4))[Hiển thị các slides phụ 2, 3, và 4]
        ```
        #uncover((beginning: 2, until: 4))[Hiển thị các slides phụ 2, 3, và 4]
    ]
]

#slide(title: "Nguyên tắc đơn giản với chuỗi")[
    - Là một tùy chọn ngắn gọn, bạn cũng có thể chỉ định các quy tắc dưới dạng các chuỗi trong một tùy chọn đặc biệt với cú pháp.

    - Được phân tách bằng dấu phẩy, bạn có thể sử dụng các quy tắc có dạng
    #table(
        columns: (auto, auto),
        column-gutter: 1em,
        stroke: none,
        align: (x, y) => (right, left).at(x),
        [`1-3`], [Từ slide phụ số 1 tới 3 (bao gồm cả slide số 2)],
        [`-4`], [Tất cả các slides cho tới slide số 4],
        [`2-`], [Từ slide thứ 2 trở đi],
        [`3`], [Chỉ hiện thị slide số 3],
    )
    #example[
        ```typ
        #uncover("-2, 4-6, 8-")[Hiển thị các slides số 1, 2, 4, 5, 6, và tất cả các từ slide thứ 8 trở đi]
        ```
        #uncover("-2, 4-6, 8-")[Hiển thị các slides số 1, 2, 4, 5, 6, và tất cả các từ slide thứ 8 trở đi]
    ]
]

#slide(title: [`#only`: Bảo tồn không giữ khoảng cách])[
    - Mọi thứ hoạt động với `#uncover` cũng hoạt động với `#only`.

    - Tuy nhiên, nội dung hoàn toàn biến mất khi nó không được hiển thị.

    - Ví dụ: #only(2)[#text(red)[see how]] phần còn lại của câu này di chuyển.

    - Một lần nữa, bạn có thể sử dụng các quy tắc chuỗi phức tạp nếu muốn.
    #example[
        ```typ
        #only("2-4, 6")[Hiển thị các slides 2, 3, 4, và 6]
        ```
        #only("2-4, 6")[Hiển thị các slides 2, 3, 4, và 6]
    ]
]

#slide(title: [`#alternatives`: Thay thế nội dụng])[
    - Bạn có thể bị cám dỗ khi thử
    #example[
        ```typ
        #only(1)[Ann] #only(2)[Bob] #only(3)[Christopher] likes #only(1)[chocolate] #only(2)[strawberry] #only(3)[vanilla] ice cream.
        ```
        #only(1)[Ann] #only(2)[Bob] #only(3)[Christopher]
        likes
        #only(1)[chocolate] #only(2)[strawberry] #only(3)[vanilla]
        ice cream.
    ]

    - Nhưng thật khó để thấy đoạn văn bản nào thực sự thay đổi vì mọi thứ Di chuyển xung quanh.
    - Tốt hơn:
    #example[
        ```typ
        #alternatives[Ann][Bob][Christopher] likes #alternatives[chocolate][strawberry][vanilla] ice cream.
        ```
        #alternatives[Ann][Bob][Christopher] likes #alternatives[chocolate][strawberry][vanilla] ice cream.
    ]
]

#slide(title: [`#one-by-one`: An alternative for `#pause`])[
    `#alternatives` là để `#only` khi hàm `#one-by-one` dùng để `#uncover`.

    `#one-by-one` hoạt động tương tự như sử dụng `#pause` nhưng bạn cũng có thể
     trạng thái khi khám phá nên bắt đầu.
    #example[
        ```typ
        #one-by-one(start: 2)[one ][by ][one]
        ```
        #one-by-one(start: 2)[one ][by ][one]
    ]

    `start` cũng có thể được bỏ qua, sau đó nó bắt đầu với phần phụ đầu tiên:
    #example[
        ```typ
        #one-by-one[one ][by ][one]
        ```
        #one-by-one[one ][by ][one]
    ]
]

#slide(title: [`#line-by-line`: Cú pháp dễ dàng với `#one-by-one`])[
   - Đôi khi thật thuận tiện khi viết các nội dung khác nhau để khám phá một
     tại một thời điểm trong các dòng tiếp theo.

- Điều này đặc biệt hữu ích cho danh sách dấu đầu dòng, kiểu liệt kê và danh sách thuật ngữ.
    #example[
        #grid(
            columns: (1fr, 1fr),
            gutter: 1em,
            ```typ
            #line-by-line(start: 2)[
                - first
                - second
                - third
            ]
            ```,
            line-by-line(start: 2)[
                - first
                - second
                - third
            ]
        )
    ]

    `start` là tùy chọn và mặc định là `1`.
]

#slide(title: "Các cách khác nhau để bao phủ nội dung")[
    - Khi nội dung được che phủ, nó sẽ hoàn toàn ẩn theo mặc định.

    - Tuy nhiên, bạn cũng có thể chỉ hiển thị nó bằng màu xám nhạt bằng cách sử dụng
     đối số `mode` với giá trị `"transparent"`:
    #let pc = 1
    #{ pc += 1 } #show: pause(pc, mode: "transparent")

    - Nội dung bị che phủ sau đó được hiển thị khác nhau.
    #{ pc += 1 } #show: pause(pc, mode: "transparent")

    
    - Mọi chức năng dựa trên `uncover` đều có đối số `mode` tùy chọn: 
    - `#show: pause(...)`
    - `#uncover(...)[...]`
    - `#one-by-one(...)[...][...]`
    - `#line-by-line(...)[...][...]`
]

#new-section("Themes")

#slide(title: "Các diện mạo mỗi slide được chiếu ...")[
    ... được xác định bởi _theme_ của bản trình bày.

    - Bản trình diễn này sử dụng chủ đề mặc định.

    - Chính vì vậy, tiêu đề slide và phần trang trí trên mỗi slide (có
     tên phần, tiêu đề ngắn, số trang, v.v.) trông giống như cách họ làm.

    - Chủ đề cũng có thể cung cấp các biến thể, ví dụ...
]

#slide(theme-variant: "wake up")[
    ... với hàm này!

    - Nó rất tối giản và giúp khán giả tập trung vào một điểm quan trọng.
]

#slide(title: "Your own theme?")[
    Nếu bạn muốn tạo thiết kế của riêng mình cho các trang chiếu, bạn có thể xác định tùy chỉnh
    themes!

    #link("https://andreaskroepelin.github.io/typst-slides/book/themes.html#create-your-own-theme")[Xem sách này]
    explains how to do so.
]

#new-section("TẠM KẾT")

#slide(title: "Chúc các bạn học vui!")[
    - Hy vọng rằng bây giờ bạn đã có một số ý tưởng về những gì bạn có thể làm với mẫu này.

    - Mong các bạn cho mình nhiều sao
    #link("https://github.com/linhduongtuan/DTU-typst-presentation")[GitHub của mình tại đây #text(font: "OpenMoji")[#emoji.star]]
    
    - Hoặc mở một `issuse` nếu bạn gặp lỗi hoặc có yêu cầu về tính năng.
]


#slide(theme-variant: "wake up")[
	= HÃY CHỨNG MINH ĐỊNH LÝ GAUSS, TỈNH DẬY NÀO CÁC BẠN!
]


#slide(title: "Problem statement")[
	Let $n in NN$.
	We are interested in sums of the form
	$ 1 + ... + n = sum_(i=1)^n i $
]

#slide(title: "The theorem")[

	I discovered that
	$ sum_(i=1)^n i = n(n+1)/2 $

	Let's prove that!
]

#new-section("CHỨNG MINH")

#slide(title: "PHƯƠNG PHÁP CHỨNG MINH")[
	We will prove the theorem by induction, following these steps:

	+ base case
	+ induction hypothesis
	+ induction step
]

#slide(title: "Proof")[
	#set text(.7em)

	#one-by-one[
		*base case:* Let $n = 1$. Then $sum_(i=1)^1 i = (1 dot.c 2)/2 = 1$ $checkmark$

	][
		*ind. hypothesis:* Let $sum_(i=1)^k i = k(k+1)/2$ for some $k >= 1$.

	][
		*ind. step:* Show that
		$sum_(i=1)^(k+1) i = ((k+1)(k+2))/2$

		$sum_(i=1)^(k+1) i = sum_(i=1)^k i quad + quad (k+1)$
	][
		$= k(k+1)/2 + (k+1)$
	][
		$= (k+1) dot.c (k/2 + 1)
		= (k+1) dot.c (k/2 + 2/2)
		= ((k+1)(k+2))/2
		#h(1em) checkmark$
	]
]


#slide(theme-variant: "wake up")[
	= CHÚNG TA ĐÃ CHỨNG MINH XONG ĐỊNH LÝ GAUSS, TỈNH DẬY NÀO CÁC BẠN!
]