#lang planet neil/sicp

;; ex1-45


(define tolerance 0.0001)

(define (average x y) (/ (+ x y) 2.0))

(define (fixed-point f first-guess)
    (newline)
    (display first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess)
        (let ((next (f guess)))
            (if (close-enough? guess next)
                next
                (try next))))
    (try first-guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (compose f g)
    (lambda (x) (f (g x))))

(define (repeated f n)
    (if (= n 1)
        (lambda (x) (f x))
        (compose f (repeated f (- n 1)))))


(define (n-root x n damp)
    (fixed-point (repeated (average-damp (lambda (y) (/ x (expt y (- n 1))))) damp) 1.0))

(n-root 243 5 6)