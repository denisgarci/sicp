#lang planet neil/sicp

;;  ex1-33

(define (identity x) x)

(define (square x)
 (* x x))

(define (smallest-divisor n)
 (find-divisor n 2))

(define (find-divisor n test-divisor)
 (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define  (divides? a b)
 (= (remainder b a) 0))

(define (prime? n)
 (if (< n 2)
    #f
    (= n (smallest-divisor n))))

(define (inc x) (+ x 1))

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

(define (filtered-accumulate filter combiner null-value term a next b)
    (define filtered-a
        (if (filter a)
            a
            null-value))
    (if (> a b)
        null-value
        (combiner (term filtered-a) (filtered-accumulate filter combiner null-value term (next a) next b))))

(define (sum-square-prime a b) (filtered-accumulate prime? + 0 square a inc b))

(sum-square-prime 0 10)

(define (coprime-prod n)
    (define (coprime a)
        (= (gcd a n) 1))
    (filtered-accumulate coprime * 1 identity 1 inc n))

(coprime-prod 10)