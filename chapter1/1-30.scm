#lang planet neil/sicp

;;  ex1-30

(define (identity x) x)

(define (cube x)
    (* x x x))

(define (inc x) (+ x 1))

(define (sum term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (+ (term a) result))))
    (iter a 0))


(define (integral f a b dx)
    (define (add-dx x) (+ x dx))
    (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

(integral identity 0 1 0.01)
(integral cube 0 1 0.01)
