#lang planet neil/sicp

;;  ex1-16


(define (even? n)
 (= (remainder n 2) 0))


(define (fast-exp-iter b n)
 (iter 1 b n))

(define (iter acc b n)
 (cond ((= n 0) acc)
  ((even? n) (iter acc (* b b) (/ n 2)))
  (else (iter (* acc b) b (- n 1)))))


(fast-exp-iter 5 3)

