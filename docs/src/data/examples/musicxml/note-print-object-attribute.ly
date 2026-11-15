\version "2.27.5"
% convert to png using: lilypond --png -dresolution=300 -dpixmap-format=pngalpha /path/to/musicxml/docs/src/data/examples/musicxml/note-print-object-attribute.ly
\pointAndClickOff

hidden-color = #(universal-color 'orange)

%% additional definitions required by the score:
hideNote =
  \tweak Dots.color #hidden-color
  \tweak NoteHead.color #hidden-color
  \tweak Stem.color #hidden-color
  \tweak Accidental.color #hidden-color
  \tweak Rest.color #hidden-color
  \tweak TabNoteHead.color #hidden-color \etc

\header {
  texidoc = "Testing print attribute combinations of <note>. The third beat is a
    chord with the pitches D-F-A, all other notes have the same pitch A.

    It is expected that only a subset of the possible combinations are supported
    by applications.

    Measure 1:

    A: No attributes.

    B: print-leger=\"no\" – the ledger line should be omitted.

    C: print-dot=\"no\" (middle note of chord) – the middle dot of the chord
    should be omitted.

    D: print-lyric=\"no\" – the lyric ‘D’ should be omitted.

    E: print-object=\"no\" – everything should be omitted.

    Measure 2:

    F: print-object=\"no\", print-leger=\"yes\" – only the ledger line should be
    visible.

    G: print-object=\"no\", print-dot=\"yes\" – only the dot should be visible.

    H: print-object=\"no\", print-lyric=\"yes\" – only the lyric ‘H’ should be
    visible.

    Measure 3:

    I: print-object=\"no\" for <lyric> (middle lyric line ‘I2’) – the lyrics
    ‘I2’ should be omitted.

    J: print-lyric=\"no\", print-object=\"yes\" for <lyric> (middle lyric line
    ‘J2’) – the lyrics ‘J1’ and ‘J3’ should be omitted.

    K: print-object=\"no\" print-lyric=\"yes\", print-object=\"no\" for <lyric>
    (middle lyric line ‘K2’) – only the lyrics ‘K1’ and ‘K3’ should be visible.

    L: print-object=\"no\" print-lyric=\"no\", print-object=\"yes\" for <lyric>
    (middle lyric line ‘L2’) – only the lyrics ‘L2’ should be visible."
}
\layout {
  \context {
    \Score
    autoBeaming = ##f
  }
}
PartPOneVoiceOne = \relative a'' {
  \clef "treble" \time 15/8 a4.
  % The color of staff and ledger lines can only be changed at the beginning
  % of a staff; we thus have to stop and restart the staff.
  \stopStaff
  \startStaff
  \override Score.LedgerLineSpanner.color = #hidden-color
  a4.
  \stopStaff
  \startStaff
  \revert Score.LedgerLineSpanner.color
  <d, \tweak Dots.color #hidden-color f a>4. a'4.
  \stopStaff
  \startStaff
  \override Score.LedgerLineSpanner.color = #hidden-color
  \hideNote a4. | % 1
  \stopStaff
  \startStaff
  \revert Score.LedgerLineSpanner.color
  \time 9/8
  % We want the ledger line cover the colored note head.
  \tweak NoteHead.layer #-1 \hideNote a4.
  \stopStaff
  \startStaff
  \override Score.LedgerLineSpanner.color = #hidden-color
  \hideNote \tweak Dots.color #(universal-color 'black) a4.
  \hideNote a4. | % 2
  \stopStaff
  \startStaff
  \revert Score.LedgerLineSpanner.color
  \time 12/8 a4. a4.
  \stopStaff
  \startStaff
  \override Score.LedgerLineSpanner.color = #hidden-color
  \hideNote a4. \hideNote a4. }

PartPOneVoiceOneLyricsOne = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  A B C
  \override Lyrics.LyricText.color = #hidden-color D E F G
  \revert Lyrics.LyricText.color H
  "I1"
  \tweak color #hidden-color "J1"
  "K1"
  \tweak color #hidden-color "L1"
}

PartPOneVoiceOneLyricsTwo = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  \tweak color #hidden-color "I2"
  "J2"
  \tweak color #hidden-color "K2"
  "L2"
}

PartPOneVoiceOneLyricsThree = \lyricmode {
  \set ignoreMelismata = ##t
  \set includeGraceNotes = ##t
  \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1 \skip1
  "I3"
  \tweak color #hidden-color "J3"
  "K3"
  \tweak color #hidden-color "L3"
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
        \new Lyrics \lyricsto "PartPOneVoiceOne" {
          \PartPOneVoiceOneLyricsOne
        }
        \new Lyrics \lyricsto "PartPOneVoiceOne" {
          \PartPOneVoiceOneLyricsTwo
        }
        \new Lyrics \lyricsto "PartPOneVoiceOne" {
          \PartPOneVoiceOneLyricsThree
        }
      >>
    >>
  >>
  \layout {}
  % To create MIDI output, uncomment the following line:
  % \midi { \tempo 4 = 100 }
}
