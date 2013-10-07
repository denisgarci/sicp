#lang planet neil/sicp

;;  ex1-17

(define (iseven? x)
 (= (remainder x 2) 0))

(define (double x)
 (* 2 x))

(define (halve x)
 (/ x 2))

(define (fast-mult a b)
 (cond ((= b 0) 0)
        ((iseven? b) (fast-mult (double a) (halve b)))
        (else (+ a (fast-mult a (- b 1))))
 )
)

(fast-mult 4 7)
