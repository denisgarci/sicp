#lang planet neil/sicp

;;  ex1-32

(define (identity x) x)

(define (cube x)
    (* x x x))

(define (inc x) (+ x 1))


(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum term (next a) next b))))

(define (accumulate combiner null-value term a next b)
    (if (> a b)
        null-value
        (combiner (term a) (accumulate combiner null-value term (next a) next b))))


(define (acc-sum term a next b)
    (accumulate + 0 term a next b))

(define (accumulate-iter combiner null-value term a0 next b0)
    (define (iter a result)
        (if (> a b0)
            result
            (iter (next a) (combiner (term a) result))))
    (iter a0 null-value))


(define (acc-sum-iter term a next b)
    (accumulate-iter + 0 term a next b))

(acc-sum identity 0 inc 5)

(acc-sum-iter identity 0 inc 5)