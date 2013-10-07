#lang planet neil/sicp

;;  ex-1-15

(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
 (if not (> (abs angle) 0.1))
 angle
 (p (sine (/ angle 3.0))))

;;  a/
;;  (sine 12.15)
;;  12.15 / 3 = 4.05
;;  4.05 / 3 = 1.35
;;  1.35 / 3 = 0.45
;;  So the procedure p is applied 3 times

;;  b/
;;  Growth in number of step log (ln / ln3)
;;  Growth in space?
