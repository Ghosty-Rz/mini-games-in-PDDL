(define (problem wumpus-world-problem)
  (:domain wumpus-world)

  (:objects
    agent1 - agent
    loc1-1 loc1-2 loc2-1 loc2-2 loc3-1 loc3-2 - location
  )

  (:init
  
  (at agent1 loc1-1)
  (have-arrow agent1)

 
  (adjacent loc1-1 loc1-2)
  (adjacent loc1-1 loc2-1)
  (adjacent loc2-1 loc2-2)
  (adjacent loc1-2 loc1-1)
  (adjacent loc2-2 loc1-2)
  (adjacent loc2-2 loc2-1)
  (adjacent loc2-2 loc3-2)
  (adjacent loc3-2 loc2-2)
  (adjacent loc3-2 loc3-1)
  (adjacent loc3-1 loc3-2)


  (possible-wumpus loc3-1)

 
  (at-gold loc3-2)
)
(:goal
  (and
    (have-gold agent1)    
    (wumpus-dead)         
    (at agent1 loc1-1)  
  )
)
)
