#lang racket
; ---------------------------------------------------------------------
; Program that mimics the "Preliminary Code" that consists of three functions:
; (1) a function to compute the square of a number,
; (2) a function to compute the cube of a number, and
; (3) a higher order function to compute the first n elements in a number sequence,
;     assuming that functions exist to compute the nth element of the sequence.
;

; ---------------------------------------------------------------------
; Preliminary Code
;
( define ( square n )
   ( * n n )
)

( define ( cube n )
   ( * n n n)
)

( define ( sequence name n )
   ( cond
      ( ( = n 1 )
        ( display ( name 1 ) ) ( display " " )
      )
      ( else
        ( sequence name ( - n 1 ) )
        ( display ( name n ) ) ( display " " )
      )
   )
)

; ---------------------------------------------------------------------
; Triangular Numbers
;
( define ( triangular n )
   ( cond
      ( ( = n 1 )
        1
      )
      ( else
        ( + n ( triangular ( - n 1 ) ) )
      )
   )
)

; ---------------------------------------------------------------------
; Sigma Numbers
;
( define ( sigma n )
   ( sigmath n n )
)

( define ( sigmath n orig )
   ( cond
      ( ( = n 1 )
        1
      )
      ( ( = ( modulo orig n ) 0 )
        ( + n ( sigmath ( - n 1 ) orig ) )
      )
      ( else
        ( sigmath ( - n 1 ) orig )
      )
   )
)