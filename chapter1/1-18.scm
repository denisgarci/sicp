#lang planet neil/sicp

;;  ex1-18

(define (iseven? x)
 (= (remainder x 2) 0))

(define (double x)
 (* 2 x))

(define (halve x)
 (/ x 2))

(define (fast-mult-iter a b)
 (iter 0 a b))

(define (iter acc a b)
 (cond ((= b 0) acc)
    ((iseven? b) (iter acc (double a) (halve b)))
    (else (iter (+ acc a) a (- b 1)))))


(fast-mult-iter 3 20)
