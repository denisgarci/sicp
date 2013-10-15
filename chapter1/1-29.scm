#lang planet neil/sicp

;;  ex1-29

(define (identity x) x)

(define (cube x)
    (* x x x))

(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum term (next a) next b))))

(define (integral f a b dx)
    (define (add-dx x) (+ x dx))
    (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

(define (simpsons-sum term a next n)
    (simpsons-sum-iter term a next n 0))

(define (simpsons-sum-iter term a next n counter)
    (cond ((> counter n) 0)
        ((or (= counter 0) (= counter n))
        (+ (term a) (simpsons-sum-iter term (next a) next n (+ counter 1))))
        ((= (remainder counter 2) 1)
        (+ (* 4 (term a)) (simpsons-sum-iter term (next a) next n (+ counter 1))))
        ((= (remainder counter 2) 0)
        (+ (* 2 (term a)) (simpsons-sum-iter term (next a) next n (+ counter 1))))))

(define (simpsons-integral f a b n)
    (define (add-h x) (+ x (/ (- b a ) n)))
    (* (add-h 0.0) (/ 1.0 3.0) (simpsons-sum f a add-h n)))


(integral identity 0 1 0.01)
(integral cube 0 1 0.01)

(simpsons-integral identity 0 1 100)
(simpsons-integral cube 0 1 100)


