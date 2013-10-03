#lang planet neil/sicp

;; ex1-8

(define (improve-cube guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (good-enough-cube? guess x)
  (< (abs (- (* guess guess guess) x)) 0.001))

(define (cube-root-iter guess x)
  (if (good-enough-cube? guess x)
  guess
  (cube-root-iter (improve-cube guess x) x)))

(cube-root-iter 1 27)
;; works!
