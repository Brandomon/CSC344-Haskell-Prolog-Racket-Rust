#lang racket

; ---------------------------------------------------------------------
; Program that displays graphical images in the spirit of Frank Stella.
;
; Commands
; ( stella side count color )
; ( stella-two side count color1 color2 )
;
; Examples
; ( stella 100 5 "cyan" )
; ( stella 450 3 ( random-color ) )
; ( stella-two 200 9 "cyan" "green" )
; ( stella-two 300 14 ( random-color ) ( random-color ) )
;

; ---------------------------------------------------------------------
; Import the image library from htdp, 2nd edition
;
( require 2htdp/image )

; ---------------------------------------------------------------------
; Monochromatic Stella
;
( define ( stella side count color )
   ( define unit ( / side count ) )
   ( paint-stella 1 count unit color )
)

( define ( paint-stella from to unit color)
   ( define side-length ( * from unit ) )
   ( cond
      ( ( = from to )
        ( framed-shape side-length color )
      )
      ( ( < from to )
        ( overlay
          ( framed-shape side-length color )
          ( paint-stella ( + from 1 ) to unit color )
        )
      )
   )
)

( define ( framed-shape side-length color )
   ( overlay
       ( circle side-length "outline" "black" ) 
       ( circle side-length "solid" color ) 
   )
)

; ---------------------------------------------------------------------
; Two-Tone Stella
;
( define ( stella-two side count color1 color2 )
   ( define delta ( / side count ) )
   ( paint-stella-two 1 count delta color1 color2 )
)

( define ( paint-stella-two from to delta color1 color2 )
   ( define side-length ( * from delta ) )
   ( cond
      ( ( = from to )
        ( if ( even? from )
             ( circle side-length "solid" color1 )
             ( circle side-length "solid" color2 )
        )
      )
      ( ( < from to )
        ( if ( even? from )
             ( overlay
               ( circle side-length "solid" color1 )
               ( paint-stella-two ( + from 1 ) to delta color1 color2 )
             )
             ( overlay
               ( circle side-length "solid" color2 )
               ( paint-stella-two ( + from 1 ) to delta color1 color2 )
             )          
         )
      )
   )
)

; ---------------------------------------------------------------------
; Random Color Functions
;
( define ( random-color ) ( color ( rgb-value ) ( rgb-value ) ( rgb-value ) ) )

( define ( rgb-value ) ( random 256 ) )