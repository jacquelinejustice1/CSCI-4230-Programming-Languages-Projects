#lang slideshow
(require 2htdp/image)

(define gov (bitmap "gov.png"))
(define x '(1 2 3 4 5 6 7 8 9))
(define (repeat element times)
  (if
   (= times 0)
   '()
   (cons element (repeat element (- times 1)))
   )
  )
(define (fib n)
  (if
   (or (= n 0) (= n 1))
   n
   (+ (fib (- n 1)) (fib (- n 2)))
  )
 )
(define (hrepeat element n)
  (if
   (= n 2)
   (hc-append element element)
   (hc-append element (hrepeat element (- n 1)))
   )
  )
  
      