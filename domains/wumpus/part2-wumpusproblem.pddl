(define (problem wumpus-world-problem)
  (:domain wumpus-world)

  (:objects
    agent1 - agent
    loc1-1 loc1-2 loc1-3 loc1-4
    loc2-1 loc2-2 loc2-3 loc2-4
    loc3-1 loc3-2 loc3-3 loc3-4
    loc4-1 loc4-2 loc4-3 loc4-4 - location
  )

  (:init
    (at agent1 loc1-1)
    (have-arrow agent1)
    
    ; Initial adjacency setup
    (adjacent loc1-1 loc1-2)
    (adjacent loc1-2 loc1-1)

    ; Other adjacencies that will allow the agent to explore naturally after backtracking
    (adjacent loc1-1 loc2-1) ; Ensure loc2-1 is reachable from loc1-1 after the initial backtracking


    (adjacent loc1-2 loc1-3) (adjacent loc1-3 loc1-2)
    (adjacent loc1-3 loc1-4) (adjacent loc1-4 loc1-3)
    
    ; Other adjacencies for remaining movements
    (adjacent loc1-2 loc2-2) (adjacent loc2-2 loc1-2)
    (adjacent loc1-3 loc2-3) (adjacent loc2-3 loc1-3)
    (adjacent loc1-4 loc2-4) (adjacent loc2-4 loc1-4)

    (adjacent loc2-1 loc2-2) (adjacent loc2-2 loc2-1)
    (adjacent loc2-2 loc2-3) (adjacent loc2-3 loc2-2)
    (adjacent loc2-3 loc2-4) (adjacent loc2-4 loc2-3)

    (adjacent loc2-1 loc3-1) (adjacent loc3-1 loc2-1)
    (adjacent loc2-2 loc3-2) (adjacent loc3-2 loc2-2)
    (adjacent loc2-3 loc3-3) (adjacent loc3-3 loc2-3)
    (adjacent loc2-4 loc3-4) (adjacent loc3-4 loc2-4)

    (adjacent loc3-1 loc3-2) (adjacent loc3-2 loc3-1)
    (adjacent loc3-2 loc3-3) (adjacent loc3-3 loc3-2)
    (adjacent loc3-3 loc3-4) (adjacent loc3-4 loc3-3)

    (adjacent loc3-1 loc4-1) (adjacent loc4-1 loc3-1)
    (adjacent loc3-2 loc4-2) (adjacent loc4-2 loc3-2)
    (adjacent loc3-3 loc4-3) (adjacent loc4-3 loc3-3)
    (adjacent loc3-4 loc4-4) (adjacent loc4-4 loc3-4)

    (adjacent loc4-1 loc4-2) (adjacent loc4-2 loc4-1)
    (adjacent loc4-2 loc4-3) (adjacent loc4-3 loc4-2)
    (adjacent loc4-3 loc4-4) (adjacent loc4-4 loc4-3)

    (wumpus-alive)
    
    (bling-at loc3-2)

    (safe loc1-1)

    (breeze-at loc1-2)
    (stink-at loc2-1)
  )

  (:goal
    (and
      (have-gold agent1)
      (wumpus-dead)
      (at agent1 loc1-1)
    )
  )
)
