(define (problem pb2)
   (:domain blocksworld)
   (:objects b1 b2 b3)
   (:init (on-table b3) (on b2 b3) (on b1 b2) (clear b1) (arm-empty))
   (:goal (and (on b3 b2) (on b2 b1) (on-table b1) (clear b3)))
)
