#lang racket

; ---------------------------------------------------------------------
; Generate List Functions ( Auxiliary Code, big-dot, generate-list )
;
; EXAMPLE COMMANDS
; DEMO 1
; ( generate-list 10 roll-die )
; ( generate-list 20 roll-die )
; ( generate-list 12 ( lambda () ( list-ref '( red yellow blue ) ( random 3 ) ) ) )
; DEMO 2
; ( define dots ( generate-list 3 dot ) )
; dots
; ( foldr overlay empty-image dots )
; ( sort-dots dots )
; ( foldr overlay empty-image ( sort-dots dots ) )
; DEMO 3
; ( define a ( generate-list 5 big-dot ) )
; ( foldr overlay empty-image ( sort-dots a ) )
; ( define b ( generate-list 10 big-dot ) )
; ( foldr overlay emptry-image ( sort-dots b ) )

; ---------------------------------------------------------------------
; Import the image library from Version 2 of "How to Design Programs"
;
(require 2htdp/image)

; ---------------------------------------------------------------------
; Auxillary Code
;

( define ( roll-die ) ( + ( random 6 ) 1 ) )

( define ( dot )
   ( circle ( + 10 ( random 41 ) ) "solid" ( random-color ) )
)

( define ( random-color )
   ( color ( rgb-value ) ( rgb-value ) ( rgb-value ) )
)

( define ( rgb-value )
   ( random 256 )
)

( define ( sort-dots loc )
   ( sort loc #:key image-width < )
)

; ---------------------------------------------------------------------
; Big-dot Function
;

( define ( big-dot )
   ( circle ( + 100 ( random 60 ) ) "solid" ( random-color ) )
)

; ---------------------------------------------------------------------
; Generate-list Function
;

( define ( generate-list num funct )
   ( cond
      ( ( zero? num )
        ( list )
      )
      ( else
        ( append ( list ( funct ) ) ( generate-list ( - num 1 ) funct ) )
      )
   )
)