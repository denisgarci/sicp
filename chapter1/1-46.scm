#lang planet neil/sicp

;; ex1-46


(define (iterative-improvement good-enough? improve)
    (define  (proced first-guess)
        (define (try guess)
            (let ((next (improve guess)))
                (if good-enough? guess next)
                    next
                    (try next)))
        (try first-guess))
    proced)

(define (good-enough? x y)
    (< (abs (- x y)) 0.0001))

;; ((iterative-improvement good-enough? (lambda (y) (/ (+ (/