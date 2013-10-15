#lang planet neil/sicp

;;  ex1-25

(define (square x)
 (* x x))

(define (expmod base exp m)
 (cond ((= exp 0) 1)
  ((even? exp)
   ;; PBME BECAUSE WE COMPUTE IT TWICE INSTEAD OF ONCE AND THUS LINEAR INSTEAD OF LOG!
    (remainder (* (expmod base (/ exp 2) m) (expmod base (/ exp 2) m)) m))
   (else
    (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
 (define (try-it a)
  (= (expmod a n n ) a))
 (try-it (+ 1 (random (- n 1)))))
 
(define (fast-prime? n times)
    (cond ((= times 0) true)
    ((fermat-test n) (fast-prime? n (- times 1)))
    (else false)))

(define (timed-prime-test n)
 (newline)
 (display n)
 (start-prime-test n (runtime)))
 
 
