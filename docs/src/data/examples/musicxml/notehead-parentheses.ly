\version "2.27.5"
% convert to png using: lilypond --png -dresolution=300 -dpixmap-format=pngalpha /path/to/musicxml/docs/src/data/examples/musicxml/notehead-parentheses.ly
\pointAndClickOff

\layout {
  \context {
    \Staff
    printKeyCancellation = ##f
  }
  \context {
    \Score
    autoBeaming = ##f
  }
}
PartPOneVoiceOne = \relative ais' {
  \clef "treble" \time 6/4 \key c \major \parenthesize ais4 \tweak style #'cross
  \parenthesize a4. <a \parenthesize c e>4 <\parenthesize a \parenthesize c
    \parenthesize e>4 \parenthesize r4 \parenthesize e8\rest \bar "|."
}


% The score definition
\score {
  <<
    \new Staff = "P1" <<
      \context Staff <<
        \override Staff.BarLine.allow-span-bar = ##f
        \mergeDifferentlyDottedOn
        \mergeDifferentlyHeadedOn
        \context Voice = "PartPOneVoiceOne" {
          \PartPOneVoiceOne
        }
      >>
    >>
  >>
  \layout {}
  % To create MIDI output, uncomment the following line:
  % \midi { \tempo 4 = 100 }
}

