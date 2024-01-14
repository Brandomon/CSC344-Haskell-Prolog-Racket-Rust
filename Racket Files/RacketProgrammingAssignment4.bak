#lang racket

; ---------------------------------------------------------------------
; ---------------------------------------------------------------------
; Generate Uniform List Function
; EXAMPLE COMMANDS
;
; ( generate-uniform-list 5 'kitty )
; ( generate-uniform-list 0 'kitty )
; ( generate-uniform-list 2 '(racket prolog haskell rust) )

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

; ---------------------------------------------------------------------
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

; ---------------------------------------------------------------------
; ---------------------------------------------------------------------
; Assoc Function
; EXAMPLE COMMANDS
;
; ( define al1 ( a-list '(one two three four) '(un duex trois quatre) ) )
; ( define al2 ( a-list '(one two three) '( (1) (2 2) (3 3 3) ) ) )
; al1
; ( assoc 'two al1 )
; ( assoc 'five al1 )
; al2
; ( assoc 'three al2 )
; ( assoc 'four al2 )
; 

( define ( assoc obj assoc-list )
   ( cond
      ( ( empty? assoc-list )
        ( list )
      )
      ( ( equal? ( caar assoc-list ) obj )
        ( car assoc-list )
      )
      ( else
        ( assoc obj ( cdr assoc-list ) )
      )
   )
)

; ---------------------------------------------------------------------
; ---------------------------------------------------------------------
; Rassoc Function
; EXAMPLE COMMANDS
;
; ( define al1 ( a-list '(one two three four) '(un duex trois quatre) ) )
; ( define al2 ( a-list '(one two three) '( (1) (2 2) (3 3 3) ) ) )
; al1
; ( rassoc 'three al1 )
; ( rassoc 'trois al1 )
; al2
; ( rassoc '(1) al2 )
; ( rassoc '(3 3 3) al2 )
; ( rassoc 1 al2 )
; 

( define ( rassoc obj rassoc-list )
   ( cond
      ( ( empty? rassoc-list )
        ( list )
      )
      ( ( equal? ( cdr ( car rassoc-list ) ) obj )
        ( car rassoc-list )
      )
      ( else
        ( rassoc obj ( cdr rassoc-list ) )
      )
   )
)

; ---------------------------------------------------------------------
; ---------------------------------------------------------------------
; Los->s Function
; EXAMPLE COMMANDS
;
; ( los->s '( "red" "yellow" "blue" "purple" ) )
; ( los->s ( generate-uniform-list 20 "-" ) )
; ( los->s '() )
; ( los->s '( "whatever" ) )

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

; ---------------------------------------------------------------------
; ---------------------------------------------------------------------
; Generate List Functions
; EXAMPLE COMMANDS
;
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
; Preliminary Auxilary Code
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

; ---------------------------------------------------------------------
; ---------------------------------------------------------------------
; The Diamond Functions ( diamond, sort-diamonds, diamond-design )
; EXAMPLE COMMANDS
;
; ( diamond-design 5 )
; ( diamond-design 20 )

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

; ---------------------------------------------------------------------
; ---------------------------------------------------------------------
; Chromesthetic Renderings Functions ( Auxilary Code, play )
; EXAMPLE COMMANDS
;
; ( play '( c d e f g a b c c b a g f e d c ) )
; ( play '( c c g g a a g g f f e e d d c c ) )
; ( play '( c d e c c d e c e f g g e f g g ) )
;

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

