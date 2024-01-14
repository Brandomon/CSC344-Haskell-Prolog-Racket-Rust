#lang racket

; ---------------------------------------------------------------------
; Association List Generator Function
; EXAMPLE COMMANDS
;
; ( a-list '(one two three four five) '(un duex trois quatre cinq) )
; ( a-list '() '() )
; ( a-list '( this ) '( that ) )
; ( a-list '(one two three) '( (1) (2 2) ( 3 3 3 ) ) )
;

( define ( a-list eq-list1 eq-list2 )
   ( cond
      ( ( empty? eq-list1 )
        ( list )
      )
      ( else
        ( append ( list ( cons ( car eq-list1 ) ( car eq-list2 ) ) ) ( a-list ( cdr eq-list1 ) ( cdr eq-list2 ) ) )
      )
   )
)