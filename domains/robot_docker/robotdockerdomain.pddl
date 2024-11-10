(define (domain task3)
  (:requirements :strips :typing :adl)

  (:types
    crane
    truck
    container
    location
    position
  )

  (:predicates
    (holding ?agent - crane ?container - container)
    (empty ?agent - (either crane truck))
    (at ?agent - (either crane truck) ?lo - location)
    (at_crane ?crane - crane ?location - location)
    (at_position ?position - position ?location - location)
    (on ?container - container ?support - (either position container truck))
    (clear ?support - (either position container truck))
    (loaded ?truck - truck ?container - container)
  )

  (:action load_truck
    :parameters (?crane - crane ?container - container ?truck - truck ?location - location)
    :precondition (and
      (holding ?crane ?container)
      (at_crane ?crane ?location)
      (at ?truck ?location)
      (empty ?truck)
    )
    :effect (and
      (loaded ?truck ?container)
      (empty ?crane)
      (not(holding ?crane ?container))
      (not(empty ?truck))
    )
  )
  (:action unload_truck
    :parameters (?crane - crane ?container - container ?truck - truck ?location - location)
    :precondition (and
      (empty ?crane)
      (at_crane ?crane ?location)
      (at ?truck ?location)
      (loaded ?truck ?container) 
    )
    :effect (and 
      (holding ?crane ?container)
      (empty ?truck)
      (not(empty ?crane))
      (not(loaded ?truck ?container))
    )
  )
  (:action pick_up
    :parameters (?crane - crane ?container - container ?position - position ?location - location ?truck - truck)
    :precondition (and
      (empty ?crane)
      (at_crane ?crane ?location)
      (at_position ?position ?location)
      (on ?container ?position) 
      (clear ?container)
      (at ?truck ?location)
    )
    :effect (and 
      (holding ?crane ?container)
      (not (on ?container ?position))
      (clear ?position )
      (not(empty ?crane))
      (not(clear ?container))
    )
  )
  (:action put_down
    :parameters (?crane - crane ?container - container ?position - position ?location - location )
    :precondition (and
      (holding ?crane ?container)
      (at_crane ?crane ?location)
      (at_position ?position ?location)
      (clear ?position)
    )
    :effect (and 
      (on ?container ?position)
      (empty ?crane)
      (clear ?container )
      (not(holding ?crane ?container))
      (not(clear ?position))
    )
  )
  (:action stack
    :parameters (?crane - crane ?container - container ?onto - container  ?position - position ?location - location )
    :precondition (and
      (holding ?crane ?container)
      (at_crane ?crane ?location)
      (at_position ?position ?location)
      (on ?onto ?position)
      (clear ?onto)
    )
    :effect (and 
      (on ?container ?onto)
      (empty ?crane)
      (clear ?container )
      (not(holding ?crane ?container))
      (not(clear ?onto))
    )
  )
   (:action truck_move
    :parameters (?truck - truck ?from - location ?to - location )
    :precondition (at ?truck ?from)
    :effect (and 
      (at ?truck ?to)
      (not(at ?truck ?from))
    )
  )








)
