#lang racket
; ---------------------------------------------------------------------
; Program that generates random numbers between 1 - 6 (inclusive) to mimic
; a rolling die. The program also uses recursion to mimic rolling the die
; until a 1 is rolled, rolling the die until two 1's are rolled consecutively,
; rolling the die until an odd, even, odd combination are rolled consecutively,
; and rolling a pair of dice until a lucky pair is rolled.
; Lucky Pair = ( 7, 11, or doubles )
;
; Commands:
; ( roll-die )
; ( roll-for-1 )
; ( roll-for-11 )
; ( roll-for-odd-even-odd )
; ( roll-two-dice-for-a-lucky-pair )

; ---------------------------------------------------------------------
; Generate a random number between 1 - 6
( define ( roll-die )
   ( + ( random 6 ) 1 )
)

; ---------------------------------------------------------------------
; Rolls die until a 1 1s rolled
( define ( roll-for-1 )
   ( define result 0 )
   ( set! result ( roll-die ) )
   ( cond
      ( ( = result 1 )
        ( display result ) 
      )
      ( ( not ( = result 1 ) )
        ( display result ) ( display " " )
        ( roll-for-1 )
      )
    )
)
; ---------------------------------------------------------------------
; Rolls die until two 1s in a row are rolled
( define ( roll-for-11 )
   ( define result 0 )
   ( set! result ( roll-die ) )
   ( cond
      ( ( = result 1 )
        ( display result ) ( display " " )
        ( set! result ( roll-die ) )
        ( cond
           ( ( = result 1 )
             ( display result )
           )
           ( ( not ( = result 1 ) )
             ( display result ) ( display " " )
             ( roll-for-11 )
           )
        )
      )
      ( ( not ( = result 1 ) )
        ( display result ) ( display " " )
        ( roll-for-11 )
      )
    )
)   

; ---------------------------------------------------------------------
; Rolls die until three consecutive die produce an odd, even, odd combo
( define ( roll-for-odd-even-odd )
   ( define result 0 )
   ( set! result ( roll-die ) )
   ( cond
      ( ( or ( = result 1 ) ( = result 3 ) ( = result 5 ) )
        ( display result ) ( display " " )
        ( set! result ( roll-die ) )
        ( cond
           ( ( or ( = result 2 ) ( = result 4 ) ( = result 6 ) )
             ( display result ) ( display " " )
             ( set! result ( roll-die ) )
             ( cond
                ( ( or ( = result 1 ) ( = result 3 ) ( = result 5 ) )
                  ( display result )
                )
                ( ( or ( = result 2 ) ( = result 4 ) ( = result 6 ) )
                  ( display result ) ( display " " )
                  ( roll-for-odd-even-odd )
                )
             )
           )
           ( ( or ( = result 1 ) ( = result 3 ) ( = result 5 ) )
             ( display result ) ( display " " )
             ( roll-for-odd-even-odd )
           )
        )
      )
      ( ( or ( = result 2 ) ( = result 4 ) ( = result 6 ) )
        ( display result ) ( display " " )
        ( roll-for-odd-even-odd )
      )
   )   
)   

; ---------------------------------------------------------------------
; Rolls a pair of dice until a lucky pair is rolled ( 7 , 11 , or doubles )
( define ( roll-two-dice-for-a-lucky-pair )
   ( define die1 0 )
   ( define die2 0 )
   ( define ( roll ) ( and ( set! die1 ( roll-die ) ) ( set! die2 ( roll-die ) ) ) )
   ( roll )
   ( cond
      ( ( or ( = ( + die1 die2 ) 7 ) ( = ( + die1 die2 ) 11 ) ( eq? die1 die2 ) )
        ( display "(") ( display die1 ) ( display " " ) ( display die2 ) ( display ")" )
      )
      ( else
        ( display "(") ( display die1 ) ( display " " ) ( display die2 ) ( display ")" ) ( display " " )
        ( roll-two-dice-for-a-lucky-pair )
      )
   )  
)