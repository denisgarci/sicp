#lang planet neil/sicp

;;  ex1-33

(define (filtered-accumulate filter combiner null-value term a next b)
    (define filtered-term-a
        (if (filter (term a))
            (term a)
            null-value))
    (if (> a b)
        null-value
        (combiner filtered-term-a (filtered-accumulate filter combiner null-value term (next a) next b))))