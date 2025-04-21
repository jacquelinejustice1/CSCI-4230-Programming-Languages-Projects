#lang racket
(define (slope a b)
  (let
      (
       (numerator (- (second b)(second a)))
       (denominator (- (first b)(first a)))
    )
    (/ numerator denominator)
   )
)

(define (max list)
  (if
   (> (car list) (max (cdr list)))
   (car list)
   (max (cdr list))
   )
)