#lang racket

; ---------------------------------------------------------------------
; Import the image library from Version 2 of "How to Design Programs"
;

(require 2htdp/image)

; ---------------------------------------------------------------------
; Random-color Function
;

( define ( rgb-value )
   ( random 256 )
)

( define ( random-color )
   ( color ( rgb-value ) ( rgb-value ) ( rgb-value ) )
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

; ---------------------------------------------------------------------
; Diamond Function
;

( define ( diamond )
   ( rotate 45 ( square ( + 20 ( random 380 ) ) "solid" ( random-color ) ) )
)

; ---------------------------------------------------------------------
; Sort-diamonds Function
;

( define ( sort-diamonds loc )
   ( sort loc #:key image-width < )
)

; ---------------------------------------------------------------------
; Diamond-design Function
;

( define ( diamond-design num )
   ( define group ( generate-list num diamond ) )
   ( foldr overlay empty-image ( sort-diamonds group ) )
)
