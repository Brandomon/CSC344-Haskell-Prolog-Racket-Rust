#lang racket

; ---------------------------------------------------------------------
; Generate Uniform List Function
; EXAMPLE COMMANDS
;
; ( generate-uniform-list 5 'kitty )
; ( generate-uniform-list 0 'kitty )
; ( generate-uniform-list 2 '(racket prolog haskell rust) )

( define ( generate-uniform-list num obj )
   ( cond
      ( ( zero? num )
        ( list )
      )
      ( ( = num 1 )
        ( list obj )
      )
      ( else
        ( append ( list obj ) ( generate-uniform-list ( - num 1 ) obj ) ) 
      )
   )
)