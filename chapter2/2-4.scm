#lang planet neil/sicp

;;  ex2-4


(define (cons x y)
    (lambda (m) (m x y)))

(define (car z)
        (z (lambda (p q) p)))

(define (cdr z)
        (z (lambda (p q) q)))


(car (cons 1 2))
(cdr (cons 1 2))

(car (cons 5 3))
(cdr (cons 5 3))