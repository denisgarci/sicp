#lang planet neil/sicp

;;  ex1-38


(define (cont-frac-iter n d k)
	(define (iter acc count)
		(if (= count 0)
			acc
			(iter (/ (n count) (+ (d count) acc)) (- count 1))))
	(iter 0.0 k))

(define (euler-n i) 1.0)

(define (euler-d i)
	(if (= (remainder i 3) 2)
		(* 2.0 (+ (quotient i 3) 1.0))
		 1.0))

(define (e-approx k) (cont-frac-iter euler-n euler-d k))

(+ 2.0 (e-approx 1000))