#lang racket
; ---------------------------------------------------------------------
; Program that renders houses and tracts of houses
;

; ---------------------------------------------------------------------
; Import the image library from htdp, 2nd edition
;
(require 2htdp/image)

; ---------------------------------------------------------------------
; Generate a house of 3 random colored rectangle floors and a grey triangle roof
;
( define ( house w h floor1 floor2 floor3 )
   ( above
     ( overlay
       ( triangle w "outline" "black" )
       ( triangle w "solid" "grey" )
     )
     ( overlay
       ( rectangle w h "outline" "black" )
       ( rectangle w h "solid" floor3 )
     )
     ( overlay
       ( rectangle w h "outline" "black")
       ( rectangle w h "solid" floor2 )
     )
     ( overlay
       ( rectangle w h "outline" "black" )
       ( rectangle w h "solid" floor1 )
     )
  )
)

; ---------------------------------------------------------------------
; Generate a tract of 6 houses side by side, seperated by a space of 10 pixels using the same random color scheme
;
( define ( tract w h )
   ( define width-of-house ( / ( - w 50 ) 6 ) )
   ( define height-of-floor ( / h 3 ) )
   ( define color1 ( random-color ) )
   ( define color2 ( random-color ) )
   ( define color3 ( random-color ) )
   ( define space ( square 10 "solid" "white" ) )
   ( beside
     ( house width-of-house height-of-floor color3 color2 color1 ) 
     space
     ( house width-of-house height-of-floor color2 color3 color1 ) 
     space
     ( house width-of-house height-of-floor color3 color1 color2 ) 
     space
     ( house width-of-house height-of-floor color1 color3 color2 ) 
     space
     ( house width-of-house height-of-floor color2 color1 color3 ) 
     space
     ( house width-of-house height-of-floor color1 color2 color3 ) 
   )
)

; ---------------------------------------------------------------------
; Helper functions for rendering the floors
;
( define ( random-color )
   ( color
     ( rgb-value ) ( rgb-value ) ( rgb-value )
   )
)

( define ( rgb-value ) ( random 256 ) )
