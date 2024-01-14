#lang racket

; ---------------------------------------------------------------------
; Diner Functions and Definitions ( menu-items, item-prices, menu, sales, item->price, total )
; EXAMPLE COMMANDS
; 
; menu
; sales
; ( total sales 'steak )
; ( total sales 'lemonade )
; ( total sales 'grilledsalmon )
; ( total sales 'draftbeer )
; ( total sales 'clubsoda )
; ( total sales 'cappuccino )
; ( total sales 'beignets )
;

; ---------------------------------------------------------------------
; Menu-items Definition
;

( define menu-items '( steak grilledsalmon draftbeer clubsoda cappuccino beignets ) )

; ---------------------------------------------------------------------
; Item-prices Definition
;

( define item-prices '( 23 19 7 3 4.5 7.5 ) )

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
; Menu Definition
;

( define menu ( a-list menu-items item-prices ) )

; ---------------------------------------------------------------------
; Sales Definition
;

( define sales '( steak clubsoda grilledsalmon draftbeer grilledsalmon clubsoda beignets cappuccino steak steak clubsoda steak draftbeer beignets cappuccino beignets cappuccino grilledsalmon draftbeer steak steak clubsoda beignets cappuccino beignets cappuccino steak draftbeer steak draftbeer ) )

; ---------------------------------------------------------------------
; Item->Price Function
;

( define ( item->price item )
   ( cdr ( assoc item menu ) )
)

; ---------------------------------------------------------------------
; Total Function
;

( define ( total sales-list menu-item )
   ( define match-list ( filter ( lambda ( search-item ) ( equal? search-item menu-item ) ) sales-list ) )
   ( cond
      ( ( empty? match-list )
        0
      )
      ( else
        ( define item-sales ( map item->price match-list ) )
        ( foldr + 0 item-sales )
      )
   )
)