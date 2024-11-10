(define (domain wumpus-world)
  (:requirements :strips :typing)

  (:types
    agent location
  )

  (:predicates
    (at ?a - agent ?l - location)         
    (adjacent ?l1 - location ?l2 - location) 
    (have-arrow ?a - agent)               
    (have-gold ?a - agent)                
    (wumpus-dead)                         
    (at-gold ?l - location)               
    (possible-wumpus ?l - location)       
    (confirmed-wumpus ?l - location)      
  )

 
  (:action move
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (and
      (at ?a ?from)
      (adjacent ?from ?to)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )


  (:action confirm-wumpus
    :parameters (?a - agent ?w - location)
    :precondition (possible-wumpus ?w)
    :effect (confirmed-wumpus ?w)
  )

  
  (:action shoot
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (and
      (at ?a ?from)
      (have-arrow ?a)
      (adjacent ?from ?to)
      (confirmed-wumpus ?to)
    )
    :effect (and
      (wumpus-dead)
      (not (have-arrow ?a))
    )
  )


  (:action grab
    :parameters (?a - agent ?l - location)
    :precondition (and
      (at ?a ?l)
      (at-gold ?l)
    )
    :effect (have-gold ?a)
  )
)

