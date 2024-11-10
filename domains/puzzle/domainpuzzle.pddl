(define (domain fifteen-puzzle)
  (:requirements :strips :typing)
  (:types tile position)
  
  ;; Define predicates
  (:predicates
    (at ?tile - tile ?pos - position)    ;
    (adjacent ?p1 - position ?p2 - position) 
    (empty ?pos - position)            
  )

  ;; Define actions
  (:action move-tile
    :parameters (?tile - tile ?from - position ?to - position)
    :precondition (and (at ?tile ?from) (empty ?to) (adjacent ?from ?to))
    :effect (and (not (at ?tile ?from)) (at ?tile ?to)
                 (empty ?from) (not (empty ?to)))
  )
)

