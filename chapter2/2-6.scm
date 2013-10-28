#lang planet neil/sicp

;;  ex2-6



(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define (+ a b)
    (lambda (f) (lambda (x) (a (b x)))))

(+ one two)
