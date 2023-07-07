\version "2.22" 
\include "lilypond-book-preamble.ly"
    

color = #(define-music-function (parser location color) (string?) #{
        \once \override NoteHead #'color = #(x11-color color)
        \once \override Stem #'color = #(x11-color color)
        \once \override Rest #'color = #(x11-color color)
        \once \override Beam #'color = #(x11-color color)
     #})
    
\header { 
 title = "bwv65.2.mxl"   
  
  } 
 
\score  { 
 
      << \new Staff  = Soprano { \partial 32*8 
      \override Staff.Clef     #'color = #(rgb-color 0.4 0.5 0.6)
    \override Staff.TimeSignature     #'color = #(rgb-color 0.0 0.5 0.6)
    \override Staff.Tie     #'color = #(rgb-color 0.0 0.5 0.0)
             \break
             \key c \major 
             \time 3/4
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "yellow"
\override Stem.color = "yellow"
a' 4  
             \bar "|"  %{ end measure 0 %} 
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "yellow"
\override Stem.color = "yellow"
a' 2  
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "yellow"
\override Stem.color = "yellow"
a' 4  
             \bar "|"  %{ end measure 1 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "black"
\override Stem.color = "black"
b' 2  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "black"
\override Stem.color = "black"
b' 4  
             \bar "|"  %{ end measure 2 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "blue"
\override Stem.color = "blue"
c'' 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "black"
\override Stem.color = "black"
b' 4  
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "yellow"
\override Stem.color = "yellow"
a' 4  
             \bar "|"  %{ end measure 3 %} 
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "magenta"
\override Stem.color = "magenta"
g' 2.  \fermata  
             \bar "|"  %{ end measure 4 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "blue"
\override Stem.color = "blue"
c'' 2  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "green"
\override Stem.color = "green"
d'' 4  
             \bar "|"  %{ end measure 5 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "blue"
\override Stem.color = "blue"
c'' 2  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "black"
\override Stem.color = "black"
b' 4  
             \bar "|"  %{ end measure 6 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "blue"
\override Stem.color = "blue"
c'' 2  \fermata  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "blue"
\override Stem.color = "blue"
c'' 4  
             \bar "|"  %{ end measure 7 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "blue"
\override Stem.color = "blue"
c'' 2  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "blue"
\override Stem.color = "blue"
c'' 4  
             \bar "|"  %{ end measure 8 %} 
             \break
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "black"
\override Stem.color = "black"
b' 2  
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "yellow"
\override Stem.color = "yellow"
a' 4  
             \bar "|"  %{ end measure 9 %} 
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "yellow"
\override Stem.color = "yellow"
a' 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "black"
\override Stem.color = "black"
b' 4  
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "magenta"
\override Stem.color = "magenta"
gis' 4  
             \bar "|"  %{ end measure 10 %} 
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "yellow"
\override Stem.color = "yellow"
a' 2  \fermata  
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "yellow"
\override Stem.color = "yellow"
a' 4  
             \bar "|"  %{ end measure 11 %} 
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "magenta"
\override Stem.color = "magenta"
g' 2  
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "yellow"
\override Stem.color = "yellow"
a' 4  
             \bar "|"  %{ end measure 12 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "black"
\override Stem.color = "black"
b' 2  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "black"
\override Stem.color = "black"
b' 4  
             \bar "|"  %{ end measure 13 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "blue"
\override Stem.color = "blue"
c'' 2  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "black"
\override Stem.color = "black"
b' 4  
             \bar "|"  %{ end measure 14 %} 
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "yellow"
\override Stem.color = "yellow"
a' 2  
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "magenta"
\override Stem.color = "magenta"
gis' 4  
             \bar "|"  %{ end measure 15 %} 
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "yellow"
\override Stem.color = "yellow"
a' 2  \fermata  
             \bar "|."  %{ end measure 16 %} 
              } 
            
\addlyrics { \set alignBelowContext = #"Soprano"  
              "Ein" 
              "Kind" 
              "ge" -- 
              "born"__ 
              "zu" 
              "Beth" -- 
               _  
              "le" -- 
              "hem,"__ 
              "Beth" -- 
               _  
               _  
              "le" -- 
              "hem,"__ 
              "des" 
              "freu" -- 
              "et"__ 
              "sich" 
              "Je" -- 
              "ru" -- 
               _  
              "sa" -- 
              "lem."__ 
              "Al" -- 
              "le" -- 
              "lu" -- 
              "ja,"__ 
              "Al" -- 
              "le" -- 
               _  
               _  
              "lu" -- 
              "ja!"__ 
               } 
              
       \new Staff  = Alto { \partial 32*8 
             \break
             \key c \major 
             \time 3/4
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "red"
\override Stem.color = "red"
e' 4  
             \bar "|"  %{ end measure 0 %} 
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "red"
\override Stem.color = "red"
e' 2  
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "yellow"
\override Stem.color = "yellow"
a' 4  
             \bar "|"  %{ end measure 1 %} 
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "magenta"
\override Stem.color = "magenta"
g' 2  
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "magenta"
\override Stem.color = "magenta"
g' 4  
             \bar "|"  %{ end measure 2 %} 
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "magenta"
\override Stem.color = "magenta"
g' 2  
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "cyan"
\override Stem.color = "cyan"
f' 4  
             \bar "|"  %{ end measure 3 %} 
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "red"
\override Stem.color = "red"
e' 2.  \fermata  
             \bar "|"  %{ end measure 4 %} 
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "magenta"
\override Stem.color = "magenta"
g' 2  
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "magenta"
\override Stem.color = "magenta"
gis' 4  
             \bar "|"  %{ end measure 5 %} 
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "yellow"
\override Stem.color = "yellow"
a' 2  
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "magenta"
\override Stem.color = "magenta"
g' 4  
             \bar "|"  %{ end measure 6 %} 
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "magenta"
\override Stem.color = "magenta"
g' 2  \fermata  
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "magenta"
\override Stem.color = "magenta"
g' 4  
             \bar "|"  %{ end measure 7 %} 
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "yellow"
\override Stem.color = "yellow"
a' 2  
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "cyan"
\override Stem.color = "cyan"
fis' 4  
             \bar "|"  %{ end measure 8 %} 
             \break
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "magenta"
\override Stem.color = "magenta"
g' 2  
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "magenta"
\override Stem.color = "magenta"
g' 4  ~  
             \bar "|"  %{ end measure 9 %} 
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "magenta"
\override Stem.color = "magenta"
g' 4  
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "cyan"
\override Stem.color = "cyan"
fis' 4  
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "red"
\override Stem.color = "red"
e' 4  
             \bar "|"  %{ end measure 10 %} 
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "red"
\override Stem.color = "red"
e' 2  \fermata  
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "green"
\override Stem.color = "green"
d' 4  
             \bar "|"  %{ end measure 11 %} 
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "green"
\override Stem.color = "green"
d' 4  
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "red"
\override Stem.color = "red"
e' 4  
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "green"
\override Stem.color = "green"
d' 4  
             \bar "|"  %{ end measure 12 %} 
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "green"
\override Stem.color = "green"
d' 2  
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "cyan"
\override Stem.color = "cyan"
f' 4  
             \bar "|"  %{ end measure 13 %} 
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "red"
\override Stem.color = "red"
e' 4  
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "cyan"
\override Stem.color = "cyan"
f' 4  
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "magenta"
\override Stem.color = "magenta"
g' 4  ~  
             \bar "|"  %{ end measure 14 %} 
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "magenta"
\override Stem.color = "magenta"
g' 4  
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "cyan"
\override Stem.color = "cyan"
fis' 4  
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "red"
\override Stem.color = "red"
e' 4  
             \bar "|"  %{ end measure 15 %} 
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "red"
\override Stem.color = "red"
e' 2  \fermata  
             \bar "|."  %{ end measure 16 %} 
              } 
            
 
       \new Staff  = Tenor { \partial 32*8 
             \break
             \key c \major 
             \time 3/4
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "blue"
\override Stem.color = "blue"
c' 4  
             \bar "|"  %{ end measure 0 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "blue"
\override Stem.color = "blue"
c' 2  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "green"
\override Stem.color = "green"
d' 4  
             \bar "|"  %{ end measure 1 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "green"
\override Stem.color = "green"
d' 2  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "green"
\override Stem.color = "green"
d' 4  
             \bar "|"  %{ end measure 2 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "blue"
\override Stem.color = "blue"
c' 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "red"
\override Stem.color = "red"
e' 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "blue"
\override Stem.color = "blue"
c' 4  
             \bar "|"  %{ end measure 3 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "blue"
\override Stem.color = "blue"
c' 2.  \fermata  
             \bar "|"  %{ end measure 4 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "red"
\override Stem.color = "red"
e' 2.  ~  
             \bar "|"  %{ end measure 5 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "red"
\override Stem.color = "red"
e' 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "green"
\override Stem.color = "green"
d' 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "green"
\override Stem.color = "green"
d' 4  
             \bar "|"  %{ end measure 6 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "red"
\override Stem.color = "red"
e' 2  \fermata  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "red"
\override Stem.color = "red"
e' 4  
             \bar "|"  %{ end measure 7 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "red"
\override Stem.color = "red"
e' 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "green"
\override Stem.color = "green"
d' 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "green"
\override Stem.color = "green"
d' 4  
             \bar "|"  %{ end measure 8 %} 
             \break
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "green"
\override Stem.color = "green"
d' 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "red"
\override Stem.color = "red"
e' 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "red"
\override Stem.color = "red"
e' 4  
             \bar "|"  %{ end measure 9 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "green"
\override Stem.color = "green"
d' 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "black"
\override Stem.color = "black"
b 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "black"
\override Stem.color = "black"
b 4  
             \bar "|"  %{ end measure 10 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "blue"
\override Stem.color = "blue"
c' 2  \fermata  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "yellow"
\override Stem.color = "yellow"
a 4  
             \bar "|"  %{ end measure 11 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "black"
\override Stem.color = "black"
b 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "blue"
\override Stem.color = "blue"
c' 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "yellow"
\override Stem.color = "yellow"
a 4  
             \bar "|"  %{ end measure 12 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "magenta"
\override Stem.color = "magenta"
g 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "black"
\override Stem.color = "black"
b 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "green"
\override Stem.color = "green"
d' 4  
             \bar "|"  %{ end measure 13 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "blue"
\override Stem.color = "blue"
c' 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "green"
\override Stem.color = "green"
d' 2  
             \bar "|"  %{ end measure 14 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "blue"
\override Stem.color = "blue"
c' 2  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "black"
\override Stem.color = "black"
b 4  
             \bar "|"  %{ end measure 15 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "blue"
\override Stem.color = "blue"
cis' 2  \fermata  
             \bar "|."  %{ end measure 16 %} 
              } 
            
 
       \new Staff  = Bass { \partial 32*8 
             \break
             \key c \major 
             \time 3/4
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "yellow"
\override Stem.color = "yellow"
a, 4  
             \bar "|"  %{ end measure 0 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "yellow"
\override Stem.color = "yellow"
a 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "magenta"
\override Stem.color = "magenta"
g 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "cyan"
\override Stem.color = "cyan"
fis 4  
             \bar "|"  %{ end measure 1 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "magenta"
\override Stem.color = "magenta"
g 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "green"
\override Stem.color = "green"
d 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "cyan"
\override Stem.color = "cyan"
f 4  
             \bar "|"  %{ end measure 2 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "red"
\override Stem.color = "red"
e 4  
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "blue"
\override Stem.color = "blue"
c 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "cyan"
\override Stem.color = "cyan"
f 4  
             \bar "|"  %{ end measure 3 %} 
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "blue"
\override Stem.color = "blue"
c 2.  \fermata  
             \bar "|"  %{ end measure 4 %} 
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "blue"
\override Stem.color = "blue"
c 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "blue"
\override Stem.color = "blue"
c' 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "black"
\override Stem.color = "black"
b 4  
             \bar "|"  %{ end measure 5 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "yellow"
\override Stem.color = "yellow"
a 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "cyan"
\override Stem.color = "cyan"
fis 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "magenta"
\override Stem.color = "magenta"
g 4  
             \bar "|"  %{ end measure 6 %} 
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "blue"
\override Stem.color = "blue"
c 2  \fermata  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "blue"
\override Stem.color = "blue"
c' 4  
             \bar "|"  %{ end measure 7 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "yellow"
\override Stem.color = "yellow"
a 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "cyan"
\override Stem.color = "cyan"
fis 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "green"
\override Stem.color = "green"
d 4  
             \bar "|"  %{ end measure 8 %} 
             \break
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "magenta"
\override Stem.color = "magenta"
g 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "red"
\override Stem.color = "red"
e 4  
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "blue"
\override Stem.color = "blue"
cis 4  
             \bar "|"  %{ end measure 9 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "green"
\override Stem.color = "green"
d 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "green"
\override Stem.color = "green"
dis 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "red"
\override Stem.color = "red"
e 4  
             \bar "|"  %{ end measure 10 %} 
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "yellow"
\override Stem.color = "yellow"
a, 2  \fermata  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "cyan"
\override Stem.color = "cyan"
f 4  ~  
             \bar "|"  %{ end measure 11 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "cyan"
\override Stem.color = "cyan"
f 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "red"
\override Stem.color = "red"
e 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "cyan"
\override Stem.color = "cyan"
fis 4  
             \bar "|"  %{ end measure 12 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "magenta"
\override Stem.color = "magenta"
g 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "cyan"
\override Stem.color = "cyan"
fis 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "magenta"
\override Stem.color = "magenta"
gis 4  
             \bar "|"  %{ end measure 13 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "yellow"
\override Stem.color = "yellow"
a 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "green"
\override Stem.color = "green"
d 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "red"
\override Stem.color = "red"
e 4  
             \bar "|"  %{ end measure 14 %} 
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "cyan"
\override Stem.color = "cyan"
f 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "green"
\override Stem.color = "green"
dis 4  
             \once \override Stem #'direction = #DOWN 
             \override NoteHead.color = "red"
\override Stem.color = "red"
e 4  
             \bar "|"  %{ end measure 15 %} 
             \once \override Stem #'direction = #UP 
             \override NoteHead.color = "yellow"
\override Stem.color = "yellow"
a, 2  \fermata  
             \bar "|."  %{ end measure 16 %} 
              } 
            
 
        >>
      
  } 
 
\paper { }
\layout {
  \context {
    \RemoveEmptyStaffContext
    \override VerticalAxisGroup #'remove-first = ##t
  }
 }
 
