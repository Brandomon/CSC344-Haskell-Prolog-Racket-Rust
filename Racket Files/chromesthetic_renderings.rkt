#lang racket

; ---------------------------------------------------------------------
; Chromesthetic Renderings Functions and Definitions ( Auxiliary Code, play )
; EXAMPLE COMMANDS
;
; ( play '( c d e f g a b c c b a g f e d c ) )
; ( play '( c c g g a a g g f f e e d d c c ) )
; ( play '( c d e c c d e c e f g g e f g g ) )
;

; ---------------------------------------------------------------------
; Import the image library from Version 2 of "How to Design Programs"
;

(require 2htdp/image)

; ---------------------------------------------------------------------
; A-list Function
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

; ---------------------------------------------------------------------
; Preliminary Auxilary Code
;

( define pitch-classes '( c d e f g a b ) )

( define color-names '( blue green brown purple red yellow orange ) )

( define ( box color )
   ( overlay
     ( square 30 "solid" color )
     ( square 35 "solid" "black" )
   )
)

( define boxes
   ( list
     ( box "blue" )
     ( box "green" )
     ( box "brown" )
     ( box "purple" )
     ( box "red" )
     ( box "gold" )
     ( box "orange" )
   )
)

( define pc-a-list ( a-list pitch-classes color-names ) )

( define cb-a-list ( a-list color-names boxes ) )

( define ( pc->color pc )
   ( cdr ( assoc pc pc-a-list ) )
)

( define ( color->box color )
   ( cdr ( assoc color cb-a-list ) )
)

; ---------------------------------------------------------------------
; Play Function
;

( define ( play pitch-list )
   ( cond
      ( ( empty? pitch-list )
        ( display empty-image )
      )
      ( else
         ( foldr beside empty-image ( map color->box ( map pc->color pitch-list ) ) )
      )
   )
)