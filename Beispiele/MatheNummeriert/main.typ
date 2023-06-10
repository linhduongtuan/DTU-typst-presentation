#set math.equation(numbering: "(1)")

#show heading.where(level: 1): it => {
    counter(math.equation).update(0)
    it
}

= Eine sehr wichtige Überschrift
$ a^2 + b^2 = c^2 $
$ c + d = e $

== Eine Unterüberschrift
$ c + d $

= Noch eine Überschrift
$ a + b $
$ c + d $
$ e + f $