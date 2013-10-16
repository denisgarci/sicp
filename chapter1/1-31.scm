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


(define (pi-frac-term k)
    (define pi-num
        (if (= (remainder k 2) 0)
            (+ k 2)
            (+ k 3)))
    (define pi-den
        (if (= (remainder k 2) 0)
            (+ k 3)
            (+ k 2)))
    (/ pi-num pi-den))

(define (pi-approximation n)
    (product pi-frac-term 0 inc n))

; test and result
(= (pi-approximation 0) (/ 2 3))
(= (pi-approximation 2) (/ (* 2 4 4) (* 3 3 5)))
(* 4.0 (pi-approximation 1e2))
(* 4.0 (pi-approximation 1e3))


(define (product-iterative term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (* (term a) result))))
    (iter a 1))

(define (factorial-iter n)
    (product-iterative identity 1 inc n))

(factorial-iter 5)