\relative {
    \override NoteHead.color = "lightsalmon"
    \override Flag.color = "#E30074"
    \override Beam.color = "#5e45ad"
    \override Rest.color = "#3058"
    \override Clef.color = "lightsalmon"

    \override Staff.Clef     #'color = #(rgb-color 0.4 0.5 0.6)
    \override Staff.TimeSignature     #'color = #(rgb-color 0.0 0.5 0.6)

    c'2 e2 \tuplet 3/2 { f8 a b } a2 e4
}