#lang planet neil/sicp

;;  ex1-25

(define (square x)
 (* x x))

;; (define (expmod base exp m)
;;  (cond ((= exp 0) 1)
;;   ((even? exp)
;;     (remainder (square (expmod base (/ exp 2) m)) m))
;;    (else
;;     (remainder (* base (expmod base (- exp 1) m)) m))))

;; Problem we are going to compute number like 2^100001 [100001] etc... too big!
(define (expmod base exp m)
 (remainder (fast-exp base exp) m))

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
 
 
