(define (domain wumpus-world)
  (:requirements :strips :typing :negative-preconditions)

  (:types agent location)

  (:predicates
    (at ?a - agent ?l - location)
    (adjacent ?l1 - location ?l2 - location)
    (wumpus-alive)
    (wumpus-dead)
    (pit-at ?l - location)
    (safe ?l - location)
    (explored ?l - location)
    (have-arrow ?a - agent)
    (have-gold ?a - agent)
    (gold-at ?l - location)
    (breeze-at ?l - location)
    (stink-at ?l - location)
    (risky-pit ?l - location)
    (risky-wumpus ?l - location)
    (confirmed-wumpus ?l - location)
    (breeze-sensed ?l - location)
    (stink-sensed ?l - location)
    (breeze-was-sensed)
    (can-shoot-now)
    (backtracking-needed)
    (bling-at ?l)
  )


  (:action move
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (and
      (at ?a ?from)
      (adjacent ?from ?to)
      (not (risky-pit ?to))
      (not (risky-wumpus ?to))
      (not (explored ?to))
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (explored ?to)
    )
  )

  

  (:action back
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (and
      (at ?a ?from)
      (adjacent ?from ?to)
      (not (risky-pit ?to))
      (not (risky-wumpus ?to))
      (backtracking-needed)
      (explored ?to)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (explored ?to)
      (not (backtracking-needed))
      
    )
  )

  (:action back-to-start
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (and
      (at ?a ?from)
      (adjacent ?from ?to)
      (not (risky-pit ?to))
      (not (risky-wumpus ?to))
      (wumpus-dead)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (explored ?to)
    )
  )

  (:action sense-breeze
    :parameters (?a - agent ?l - location ?adj - location)
    :precondition (and
      (at ?a ?l)
      (breeze-at ?l)
      (adjacent ?l ?adj)
      (not (safe ?adj))
    )
    :effect (and (risky-pit ?adj)
                  (breeze-sensed ?l)
                  (breeze-was-sensed)
                  (backtracking-needed))
  )

  (:action sense-stink
    :parameters (?a - agent ?l - location ?adj - location)
    :precondition (and
      (at ?a ?l)
      (stink-at ?l)
      (adjacent ?l ?adj)
      (not (safe ?adj))
    )
    :effect (and (risky-wumpus ?adj)
                  (stink-sensed ?l)
                  (backtracking-needed))
  )

  (:action confirm-safe
    :parameters (?l - location)
    :precondition (and
      (risky-pit ?l)
      (risky-wumpus ?l)
      (breeze-was-sensed)
    )
    :effect (and
      (safe ?l)
      (not (risky-pit ?l))
      (not (risky-wumpus ?l))
    )
  )

  (:action confirm-wumpus
    :parameters (?wumpus-loc - location)
    :precondition (and
    (risky-wumpus ?wumpus-loc)
    (breeze-was-sensed) ; Requires breeze to have been sensed before confirming Wumpus
    )
    :effect (and
      (confirmed-wumpus ?wumpus-loc)
      (not (risky-wumpus ?wumpus-loc))
    )
  )

  (:action shoot
  :parameters (?a - agent ?from - location ?to - location)
  :precondition (and
    (at ?a ?from)
    (have-arrow ?a)
    (have-gold ?a)
    (wumpus-alive)
    (confirmed-wumpus ?to)
    (adjacent ?from ?to)
    (can-shoot-now) ; Enforces shooting right after grabbing the gold
  )
  :effect (and
    (not (wumpus-alive))
    (wumpus-dead)
    (not (have-arrow ?a))
    (not (can-shoot-now)) ; Removes the flag after shooting
  )
)

(:action sense-bling
    :parameters (?a - agent ?l - location)
    :precondition (and
      (at ?a ?l)
      (bling-at ?l)
    )
    :effect (gold-at ?l)
  )

  (:action grab
    :parameters (?a - agent ?l - location)
    :precondition (and
      (at ?a ?l)
      (gold-at ?l)
    )
    :effect (and
      (have-gold ?a)
      (not (gold-at ?l))
      (can-shoot-now) ; Signals that shooting can be prioritized
    )
  )
)
