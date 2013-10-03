#lang planet neil/sicp

;; ex1-7

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough?2 previous-guess guess x)
  (< (abs (/ (- guess previous-guess) guess)) 0.001))

(define (sqrt-iter2 previous-guess guess x)
  (if (good-enough?2 previous-guess guess x)
          guess
          (sqrt-iter2 guess (improve guess x) x)))

(sqrt-iter2 1.1 1 0.25)
;; 0.5000000232305737

;; old method less precise

(define  (good-enough? guess x)
  (< (abs (- (* guess guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

(sqrt-iter 1 0.25)
;; 0.5001524390243902
