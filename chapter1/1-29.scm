#lang planet neil/sicp

;;  ex1-29

(define (identity x) x)

(define (inc x) (+ x 1))

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


;; new version using the sum function... thanks Brian and Nancy

;; works so much better!

(define (new-simpsons-integral f a b n)
    (define (simpsons-term k)
        (define coef
            (cond ((or (= k 0) (= k n)) 1)
                  ((= (remainder k 2) 0) 2)
                  (else 4)))
        (define y-k (f (+ a (* k h))))
    (* coef y-k))
    (define h (/ (- b a) n))
    (* (/ h 3.0) (sum simpsons-term 0 inc n)))


(integral identity 0 1 0.01)
(integral cube 0 1 0.01)

(simpsons-integral identity 0 1 100)
(simpsons-integral cube 0 1 100)

(new-simpsons-integral identity 0 1 100)
(new-simpsons-integral cube 0 1 100)

