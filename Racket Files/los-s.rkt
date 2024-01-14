#lang racket

; ---------------------------------------------------------------------
; Los->S Functions ( generate-uniform-list, los->s )
; EXAMPLE COMMANDS
;
; ( los->s '( "red" "yellow" "blue" "purple" ) )
; ( los->s ( generate-uniform-list 20 "-" ) )
; ( los->s '() )
; ( los->s '( "whatever" ) )

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

( define ( los->s char-string-list )
   ( cond
      ( ( empty? char-string-list )
        ( string-append "" )
      )
      ( ( empty? ( cdr char-string-list ) )
        ( string-append ( car char-string-list ) )
      )
      ( else
        ( string-append ( car char-string-list ) " " ( los->s ( cdr char-string-list ) ) ) 
      )
   )
)