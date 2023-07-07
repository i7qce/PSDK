\version "2.22" 
\include "lilypond-book-preamble.ly"
    
color = #(define-music-function (parser location color) (string?) #{
        \once \override NoteHead #'color = #(x11-color color)
        \once \override Stem #'color = #(x11-color color)
        \once \override Rest #'color = #(x11-color color)
        \once \override Beam #'color = #(x11-color color)
     #})
    
\header { } 
\score  { 
 \new Voice { \new Voice { e'' 4  
                b'' 2  
                b'' 1  
                e'' 4  
                c'' 1  
                a' 2  
                a'' \breve  
                d'' 1  
                b' \breve  
                c'' 2  
                e' 4  
                c'' 1  
                g'' 1  
                d' \breve  
                d' 1  
                e'' 4  
                 } 
               
 
           } 
         
 
  } 
 
\paper { }
\layout {
  \context {
    \RemoveEmptyStaffContext
    \override VerticalAxisGroup #'remove-first = ##t
  }
 }
 
