#lang racket

; ---------------------------------------------------------------------
; Program that displays a graphical image with the combined use
; of functions, both recursive and non-recursive, and features within
; the 2htdp/image library.
;
; Commands
; ( my-creation )
; ( my-obnoxious-creation )
;

; ---------------------------------------------------------------------
; Import the image library from htdp, 2nd edition
;
( require 2htdp/image )

; ---------------------------------------------------------------------
; My Creation
;
( define ( my-creation )
   ( overlay
     (add-solid-curve (ellipse 100 100 "solid" "black")
                   20 20 0 1
                   80 80 0 1
                   "white")
      ( rotate 310 ( swoosh ( circle 220 "outline" "black" ) 99 ) )
      ( circle 100 "solid" "white" )
      ( rotate 45 ( stella 600 ( + ( random 3 ) 1 ) ( random-color ) ) )
      ( rotate 45 ( stella-two 700 19 ( random-color ) ( random-color ) ) )
   )      
)

; ---------------------------------------------------------------------
; My Obnoxious Creation
;
( define ( my-obnoxious-creation )
   ( overlay
     (add-solid-curve (ellipse 100 100 "solid" "black")
                   20 20 0 1
                   80 80 0 1
                   "white")
      ( rotate 180 ( swoosh ( circle 220 "outline" "black" ) 99 ) )
      ( circle 100 "solid" "white" )
      ( rotate 45 ( stella 600 ( + ( random 3 ) 1 ) ( random-color ) ) )
      ( stella-two 700 19 ( random-color ) ( random-color ) )
      ( stella 1000 ( + ( random 3 ) 1 ) ( random-color ) )
      ( koch-snowflake )
      ( rotate 45 ( stella 900 ( + ( random 3 ) 1 ) ( random-color ) ) )
      ( rotate 45 ( stella 1200 ( + ( random 3 ) 1 ) ( random-color ) ) )
      ( rotate 23 ( stella 1200 ( + ( random 3 ) 1 ) ( random-color ) ) )
      ( rotate 68 ( stella 1200 ( + ( random 3 ) 1 ) ( random-color ) ) )
      ( stella 1400 ( + ( random 3 ) 1 ) ( random-color ) )
   )      
)

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
       ( spin-alot ( triangle side-length "outline" "black" ) )
       ( spin-alot ( triangle side-length "solid" color ) )
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
             ( spin-alot ( triangle side-length "solid" color1 ) )
             ( spin-alot ( triangle side-length "solid" color2 ) )
        )
      )
      ( ( < from to )
        ( if ( even? from )
             ( overlay
               ( spin-alot ( triangle side-length "solid" color1 ) )
               ( paint-stella-two ( + from 1 ) to delta color1 color2 )
             )
             ( overlay
               ( spin-alot ( triangle side-length "solid" color2 ) )
               ( paint-stella-two ( + from 1 ) to delta color1 color2 )
             )
          
         )
      )
   )
)

; ---------------------------------------------------------------------
; Koch Curve Function
;
(define (koch-curve n)
    (cond
      [ ( zero? n ) ( overlay ( square 3 "outline" "black" ) ( square 3 "solid" "green") ) ]
      [ else
       ( local [ ( define smaller ( koch-curve ( - n 1 ) ) ) ]
         ( beside/align "bottom"
                       smaller
                       ( rotate 60 smaller )
                       ( rotate -60 smaller )
                       smaller )
         )
      ]
   )
)

; ---------------------------------------------------------------------
; Koch Snowflake Function
;
( define ( koch-snowflake )
   ( above
      ( beside
         ( rotate 60 ( koch-curve 5 ) )
         ( rotate -60 ( koch-curve 5 ) )
      )
      ( flip-vertical ( koch-curve 5 ) )
   )
)

; ---------------------------------------------------------------------
; Swoosh Function
;
( define ( swoosh image s )
    ( cond
      [ ( zero? s ) image ]
      [ else ( swoosh
               ( overlay/align "center" "top"
                  ( circle ( * s 1/2 ) "solid" "white" )
                  ( rotate 4 image ) )
               ( - s 1 )
         )
      ]
   )
)

; ---------------------------------------------------------------------
; Random Color Functions
;
( define ( random-color ) ( color ( rgb-value ) ( rgb-value ) ( rgb-value ) ) )

( define ( rgb-value ) ( random 256 ) )

; ---------------------------------------------------------------------
; Spin Alot Function
;
(define (spin-alot t)
    (local [ ( define ( spin-more i θ )
                ( cond
                   [ ( = θ 360 ) i ]
                   [ else
                     ( spin-more ( overlay i ( rotate θ t ) )
                                 ( + θ 1 ) )
                   ]
                 )
              )
           ]
           (spin-more t 0)
    )
)