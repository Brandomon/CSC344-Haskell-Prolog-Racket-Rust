#lang racket
; ---------------------------------------------------------------------
; Program that creates square arrangements of Hirst dots. The dots have
; a diameter of 30 pixels each and are spaced 20 pixels apart.
;

; ---------------------------------------------------------------------
; Import the image library from htdp, 2nd edition
;
(require 2htdp/image)

; ---------------------------------------------------------------------
; Generate a row of tiles of specified length and tile type
;
( define ( row-of-tiles n tile )
   ( cond
      ( ( = n 0 )
        empty-image
      )
      ( ( > n 0 )
        ( beside ( row-of-tiles ( - n 1 ) random-color-tile ) ( space ) ( random-color-tile ) )
      )
   )
)

; ---------------------------------------------------------------------
; Generate a rectangle of tiles of specified row count, column count,
; and tile type
;
( define ( rectangle-of-tiles r c tile )
   ( cond
      ( ( = r 0 )
        empty-image
       )
      ( ( > r 0 )
        ( above
          ( rectangle-of-tiles ( - r 1 ) c  random-color-tile ) ( space ) ( row-of-tiles c random-color-tile ) )
      )
   )
)

; ---------------------------------------------------------------------
; Generate a square grid of randomly colored circlular tiles of specified grid size
;
( define ( hirst-dots n )
   ( rectangle-of-tiles n n random-color-tile )
) 

; ---------------------------------------------------------------------
; Implement the tile generators
;
( define ( random-color-tile )
   ( overlay
     ( circle 30 "outline" "black" )
     ( circle 30 "solid" ( random-color ) )
   )
)

( define ( space )
   ( square 20 "solid" "white" )
)

; ---------------------------------------------------------------------
; Random Color Functions
;
( define ( random-color )
   ( color
     ( rgb-value ) ( rgb-value ) ( rgb-value )
   )
)

( define ( rgb-value ) ( random 256 ) )