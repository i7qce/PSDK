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
             \break
             \key c \major 
             \time 3/4
             \once \override Stem #'direction = #UP 
             a' 4  
             \bar "|"  %{ end measure 0 %} 
             \once \override Stem #'direction = #UP 
             a' 2  
             \once \override Stem #'direction = #UP 
             a' 4  
             \bar "|"  %{ end measure 1 %} 
             \once \override Stem #'direction = #DOWN 
             b' 2  
             \once \override Stem #'direction = #DOWN 
             b' 4  
             \bar "|"  %{ end measure 2 %} 
             \once \override Stem #'direction = #DOWN 
             c'' 4  
             \once \override Stem #'direction = #DOWN 
             b' 4  
             \once \override Stem #'direction = #UP 
             a' 4  
             \bar "|"  %{ end measure 3 %} 
             \once \override Stem #'direction = #UP 
             g' 2.  \fermata  
             \bar "|"  %{ end measure 4 %} 
             \once \override Stem #'direction = #DOWN 
             c'' 2  
             \once \override Stem #'direction = #DOWN 
             d'' 4  
             \bar "|"  %{ end measure 5 %} 
             \once \override Stem #'direction = #DOWN 
             c'' 2  
             \once \override Stem #'direction = #DOWN 
             b' 4  
             \bar "|"  %{ end measure 6 %} 
             \once \override Stem #'direction = #DOWN 
             c'' 2  \fermata  
             \once \override Stem #'direction = #DOWN 
             c'' 4  
             \bar "|"  %{ end measure 7 %} 
             \once \override Stem #'direction = #DOWN 
             c'' 2  
             \once \override Stem #'direction = #DOWN 
             c'' 4  
             \bar "|"  %{ end measure 8 %} 
             \break
             \once \override Stem #'direction = #DOWN 
             b' 2  
             \once \override Stem #'direction = #UP 
             a' 4  
             \bar "|"  %{ end measure 9 %} 
             \once \override Stem #'direction = #UP 
             a' 4  
             \once \override Stem #'direction = #DOWN 
             b' 4  
             \once \override Stem #'direction = #UP 
             gis' 4  
             \bar "|"  %{ end measure 10 %} 
             \once \override Stem #'direction = #UP 
             a' 2  \fermata  
             \once \override Stem #'direction = #UP 
             a' 4  
             \bar "|"  %{ end measure 11 %} 
             \once \override Stem #'direction = #UP 
             g' 2  
             \once \override Stem #'direction = #UP 
             a' 4  
             \bar "|"  %{ end measure 12 %} 
             \once \override Stem #'direction = #DOWN 
             b' 2  
             \once \override Stem #'direction = #DOWN 
             b' 4  
             \bar "|"  %{ end measure 13 %} 
             \once \override Stem #'direction = #DOWN 
             c'' 2  
             \once \override Stem #'direction = #DOWN 
             b' 4  
             \bar "|"  %{ end measure 14 %} 
             \once \override Stem #'direction = #UP 
             a' 2  
             \once \override Stem #'direction = #UP 
             gis' 4  
             \bar "|"  %{ end measure 15 %} 
             \once \override Stem #'direction = #UP 
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
             e' 4  
             \bar "|"  %{ end measure 0 %} 
             \once \override Stem #'direction = #UP 
             e' 2  
             \once \override Stem #'direction = #UP 
             a' 4  
             \bar "|"  %{ end measure 1 %} 
             \once \override Stem #'direction = #UP 
             g' 2  
             \once \override Stem #'direction = #UP 
             g' 4  
             \bar "|"  %{ end measure 2 %} 
             \once \override Stem #'direction = #UP 
             g' 2  
             \once \override Stem #'direction = #UP 
             f' 4  
             \bar "|"  %{ end measure 3 %} 
             \once \override Stem #'direction = #UP 
             e' 2.  \fermata  
             \bar "|"  %{ end measure 4 %} 
             \once \override Stem #'direction = #UP 
             g' 2  
             \once \override Stem #'direction = #UP 
             gis' 4  
             \bar "|"  %{ end measure 5 %} 
             \once \override Stem #'direction = #UP 
             a' 2  
             \once \override Stem #'direction = #UP 
             g' 4  
             \bar "|"  %{ end measure 6 %} 
             \once \override Stem #'direction = #UP 
             g' 2  \fermata  
             \once \override Stem #'direction = #UP 
             g' 4  
             \bar "|"  %{ end measure 7 %} 
             \once \override Stem #'direction = #UP 
             a' 2  
             \once \override Stem #'direction = #UP 
             fis' 4  
             \bar "|"  %{ end measure 8 %} 
             \break
             \once \override Stem #'direction = #UP 
             g' 2  
             \once \override Stem #'direction = #UP 
             g' 4  ~  
             \bar "|"  %{ end measure 9 %} 
             \once \override Stem #'direction = #UP 
             g' 4  
             \once \override Stem #'direction = #UP 
             fis' 4  
             \once \override Stem #'direction = #UP 
             e' 4  
             \bar "|"  %{ end measure 10 %} 
             \once \override Stem #'direction = #UP 
             e' 2  \fermata  
             \once \override Stem #'direction = #UP 
             d' 4  
             \bar "|"  %{ end measure 11 %} 
             \once \override Stem #'direction = #UP 
             d' 4  
             \once \override Stem #'direction = #UP 
             e' 4  
             \once \override Stem #'direction = #UP 
             d' 4  
             \bar "|"  %{ end measure 12 %} 
             \once \override Stem #'direction = #UP 
             d' 2  
             \once \override Stem #'direction = #UP 
             f' 4  
             \bar "|"  %{ end measure 13 %} 
             \once \override Stem #'direction = #UP 
             e' 4  
             \once \override Stem #'direction = #UP 
             f' 4  
             \once \override Stem #'direction = #UP 
             g' 4  ~  
             \bar "|"  %{ end measure 14 %} 
             \once \override Stem #'direction = #UP 
             g' 4  
             \once \override Stem #'direction = #UP 
             fis' 4  
             \once \override Stem #'direction = #UP 
             e' 4  
             \bar "|"  %{ end measure 15 %} 
             \once \override Stem #'direction = #UP 
             e' 2  \fermata  
             \bar "|."  %{ end measure 16 %} 
              } 
            
 
       \new Staff  = Tenor { \partial 32*8 
             \break
             \key c \major 
             \time 3/4
             \once \override Stem #'direction = #DOWN 
             c' 4  
             \bar "|"  %{ end measure 0 %} 
             \once \override Stem #'direction = #DOWN 
             c' 2  
             \once \override Stem #'direction = #DOWN 
             d' 4  
             \bar "|"  %{ end measure 1 %} 
             \once \override Stem #'direction = #DOWN 
             d' 2  
             \once \override Stem #'direction = #DOWN 
             d' 4  
             \bar "|"  %{ end measure 2 %} 
             \once \override Stem #'direction = #DOWN 
             c' 4  
             \once \override Stem #'direction = #DOWN 
             e' 4  
             \once \override Stem #'direction = #DOWN 
             c' 4  
             \bar "|"  %{ end measure 3 %} 
             \once \override Stem #'direction = #DOWN 
             c' 2.  \fermata  
             \bar "|"  %{ end measure 4 %} 
             \once \override Stem #'direction = #DOWN 
             e' 2.  ~  
             \bar "|"  %{ end measure 5 %} 
             \once \override Stem #'direction = #DOWN 
             e' 4  
             \once \override Stem #'direction = #DOWN 
             d' 4  
             \once \override Stem #'direction = #DOWN 
             d' 4  
             \bar "|"  %{ end measure 6 %} 
             \once \override Stem #'direction = #DOWN 
             e' 2  \fermata  
             \once \override Stem #'direction = #DOWN 
             e' 4  
             \bar "|"  %{ end measure 7 %} 
             \once \override Stem #'direction = #DOWN 
             e' 4  
             \once \override Stem #'direction = #DOWN 
             d' 4  
             \once \override Stem #'direction = #DOWN 
             d' 4  
             \bar "|"  %{ end measure 8 %} 
             \break
             \once \override Stem #'direction = #DOWN 
             d' 4  
             \once \override Stem #'direction = #DOWN 
             e' 4  
             \once \override Stem #'direction = #DOWN 
             e' 4  
             \bar "|"  %{ end measure 9 %} 
             \once \override Stem #'direction = #DOWN 
             d' 4  
             \once \override Stem #'direction = #DOWN 
             b 4  
             \once \override Stem #'direction = #DOWN 
             b 4  
             \bar "|"  %{ end measure 10 %} 
             \once \override Stem #'direction = #DOWN 
             c' 2  \fermata  
             \once \override Stem #'direction = #DOWN 
             a 4  
             \bar "|"  %{ end measure 11 %} 
             \once \override Stem #'direction = #DOWN 
             b 4  
             \once \override Stem #'direction = #DOWN 
             c' 4  
             \once \override Stem #'direction = #DOWN 
             a 4  
             \bar "|"  %{ end measure 12 %} 
             \once \override Stem #'direction = #DOWN 
             g 4  
             \once \override Stem #'direction = #DOWN 
             b 4  
             \once \override Stem #'direction = #DOWN 
             d' 4  
             \bar "|"  %{ end measure 13 %} 
             \once \override Stem #'direction = #DOWN 
             c' 4  
             \once \override Stem #'direction = #DOWN 
             d' 2  
             \bar "|"  %{ end measure 14 %} 
             \once \override Stem #'direction = #DOWN 
             c' 2  
             \once \override Stem #'direction = #DOWN 
             b 4  
             \bar "|"  %{ end measure 15 %} 
             \once \override Stem #'direction = #DOWN 
             cis' 2  \fermata  
             \bar "|."  %{ end measure 16 %} 
              } 
            
 
       \new Staff  = Bass { \partial 32*8 
             \break
             \key c \major 
             \time 3/4
             \once \override Stem #'direction = #UP 
             a, 4  
             \bar "|"  %{ end measure 0 %} 
             \once \override Stem #'direction = #DOWN 
             a 4  
             \once \override Stem #'direction = #DOWN 
             g 4  
             \once \override Stem #'direction = #DOWN 
             fis 4  
             \bar "|"  %{ end measure 1 %} 
             \once \override Stem #'direction = #DOWN 
             g 4  
             \once \override Stem #'direction = #DOWN 
             d 4  
             \once \override Stem #'direction = #DOWN 
             f 4  
             \bar "|"  %{ end measure 2 %} 
             \once \override Stem #'direction = #DOWN 
             e 4  
             \once \override Stem #'direction = #UP 
             c 4  
             \once \override Stem #'direction = #DOWN 
             f 4  
             \bar "|"  %{ end measure 3 %} 
             \once \override Stem #'direction = #UP 
             c 2.  \fermata  
             \bar "|"  %{ end measure 4 %} 
             \once \override Stem #'direction = #UP 
             c 4  
             \once \override Stem #'direction = #DOWN 
             c' 4  
             \once \override Stem #'direction = #DOWN 
             b 4  
             \bar "|"  %{ end measure 5 %} 
             \once \override Stem #'direction = #DOWN 
             a 4  
             \once \override Stem #'direction = #DOWN 
             fis 4  
             \once \override Stem #'direction = #DOWN 
             g 4  
             \bar "|"  %{ end measure 6 %} 
             \once \override Stem #'direction = #UP 
             c 2  \fermata  
             \once \override Stem #'direction = #DOWN 
             c' 4  
             \bar "|"  %{ end measure 7 %} 
             \once \override Stem #'direction = #DOWN 
             a 4  
             \once \override Stem #'direction = #DOWN 
             fis 4  
             \once \override Stem #'direction = #DOWN 
             d 4  
             \bar "|"  %{ end measure 8 %} 
             \break
             \once \override Stem #'direction = #DOWN 
             g 4  
             \once \override Stem #'direction = #DOWN 
             e 4  
             \once \override Stem #'direction = #UP 
             cis 4  
             \bar "|"  %{ end measure 9 %} 
             \once \override Stem #'direction = #DOWN 
             d 4  
             \once \override Stem #'direction = #DOWN 
             dis 4  
             \once \override Stem #'direction = #DOWN 
             e 4  
             \bar "|"  %{ end measure 10 %} 
             \once \override Stem #'direction = #UP 
             a, 2  \fermata  
             \once \override Stem #'direction = #DOWN 
             f 4  ~  
             \bar "|"  %{ end measure 11 %} 
             \once \override Stem #'direction = #DOWN 
             f 4  
             \once \override Stem #'direction = #DOWN 
             e 4  
             \once \override Stem #'direction = #DOWN 
             fis 4  
             \bar "|"  %{ end measure 12 %} 
             \once \override Stem #'direction = #DOWN 
             g 4  
             \once \override Stem #'direction = #DOWN 
             fis 4  
             \once \override Stem #'direction = #DOWN 
             gis 4  
             \bar "|"  %{ end measure 13 %} 
             \once \override Stem #'direction = #DOWN 
             a 4  
             \once \override Stem #'direction = #DOWN 
             d 4  
             \once \override Stem #'direction = #DOWN 
             e 4  
             \bar "|"  %{ end measure 14 %} 
             \once \override Stem #'direction = #DOWN 
             f 4  
             \once \override Stem #'direction = #DOWN 
             dis 4  
             \once \override Stem #'direction = #DOWN 
             e 4  
             \bar "|"  %{ end measure 15 %} 
             \once \override Stem #'direction = #UP 
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
 
