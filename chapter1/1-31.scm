#lang planet neil/sicp

;;  ex1-31


(define (product term a next b)
    (if (> a b)
        1
        (* (term a) (product term (next a) next b))))

(define (inc x) (+ x 1))

(define (identity x) x)

(define (factorial n)
    (product identity 1 inc n))

(factorial 5)

(define (product-iterative term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (* (term a) result))))
    (iter a 1))

(define (factorial-iter n)
    (product-iterative identity 1 inc n))

(factorial-iter 5)