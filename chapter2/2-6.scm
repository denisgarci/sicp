#lang planet neil/sicp

;;  ex2-6


(define (square x) (* x x))

(define (inc x) (+ x 1))

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x))))) ;; n is a procedure!

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define (add a b)
    (lambda (f) (lambda (x) ((a f) ((b f) x)))))


((zero inc) 7)
;; 7

((zero square) 7)
;; 7

((one inc) 7)
;; 8

((one square) 7)
;; 49

((two inc) 7)
;; 9

((two square) 2)
;; 16

(((add one two) inc) 7)
;; 10