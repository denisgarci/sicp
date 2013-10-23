#lang planet neil/sicp

;; ex1-45


(define tolerance 0.0001)

(define (average x y) (/ (+ x y) 2.0))

(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess)
;;         (display guess)
;;         (newline)
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
    (fixed-point
        ((repeated average-damp damp)
            (lambda (y) (/ x (expt y (- n 1)))))
    1.0))

(n-root 9 2 1)

(n-root 27 3 1)

(n-root 81 4 2)

(n-root 243 5 2)

(n-root 729 6 2)

(n-root 2187 7 2)

(n-root 6561 8 3)

(n-root (expt 3 9) 9 3)

;; damp = floor(log_2(n))