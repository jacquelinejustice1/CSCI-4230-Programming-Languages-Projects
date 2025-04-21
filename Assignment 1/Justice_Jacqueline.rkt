#lang racket
;Jacqueline Justice
;CSCI 4230
;Assignment 2
;October 6th, 2023
(require 2htdp/image)

(define gov (bitmap "gov.png"))

;1 - Function Distance 
;d=square root((x2 – x1)² + (y2 – y1)²)
(define (distance coor1-list coor2-list)
  (sqrt
  (+
   (expt (- (first coor2-list)(first coor1-list)) 2)
   (expt (- (second coor2-list)(second coor1-list)) 2))
 )
)

;2 - Function Divisible By Three
(define (divisible-by-three? x)
  (if
   (< 0 (remainder x 3))
   false
   true
  )
)

;3 - Function Sum
(define (sum list)
  (if
   (= 0 (length list))
   0
  (if
   (= 2 (length list))
   (+ (car list)(car (cdr list)))
   (+ (car list)(sum (cdr list)))
   )
  )
 )

;4 - Nth Function
(define (nth list n)
  (if
   (= 0 (length list))
   '()
   (if (= 0 n)
       (car list)
       (nth (cdr list)(- n 1))
   )
  )
 )
  
  
;5 - All? and False? Function
(define (false? n)
  (if
   (eq? n #f)
   true
   false
   )
 )
  
(define (all? list)
  (if
   (= 0 (length list))
   true
   (if (= 1 (length list))
       (car list)
   (if (false?(car list))
      false
     (all? (cdr list))
    )
  )
 )
)

;6 - Function Horizontal-Repeat
 (define (horizontal-repeat image n)
   (if
    (= n 1)
    image
   (if
    (= n 2)
    (beside image image)
    (beside image (horizontal-repeat image (- n 1)))
   )
  )
 )

;7 - Function Vertical-Repeat
(define (vertical-repeat image n)
  (if
   (= n 1)
   image
   (if
    (= n 2)
    (above image image)
    (above image (vertical-repeat image (- n 1)))
   )
  )
 )

;8 - Function Image-Grid
(define (image-grid image ver hor)
  (above (horizontal-repeat image hor)
         (vertical-repeat (horizontal-repeat image hor) (- ver 1)))
  )
 
;9 - Functions Image-Art-Builder/Image-Art
(define (image-art-builder image colindex totalcol)
     (if (= totalcol 1)  
         (scale (/ (expt 2 (- 1 totalcol))1) image)
             (beside  (image-art-builder (scale (/ totalcol (expt 2 (- totalcol 1))) image)
                                         (+ 1 colindex)(- totalcol 1))
             
                (vertical-repeat (scale (/ (expt 2 (- 1 totalcol)) 1) image)
                              (expt 2 (- totalcol 1)))
          
              )
           
      )
 )
(define (image-art image totalcol)
  (image-art-builder image 1 totalcol)
  )
