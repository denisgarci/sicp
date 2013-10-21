#lang planet neil/sicp


;;  ex1-44

(define (square x) (* x x))

(define (compose f g)
    (lambda (x) (f (g x))))

(define (repeated f n)
    (if (= n 1)
        (lambda (x) (f x))
        (compose f (repeated f (- n 1)))))


(define (average x y z) (/ (+ x y z) 3.0))

(define dx 0.00001)

(define (smooth f)
    (lambda (x) (average (f x) (f (+ x dx)) (f (- x dx)))))

((smooth square) 2)

(define (n-fold f n)
    (lambda (x) (((repeated smooth n) f) x)))

((n-fold square 3) 2)
