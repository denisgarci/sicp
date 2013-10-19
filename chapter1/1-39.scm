#lang planet neil/sicp

;; ex1-39

(define (cont-frac-iter n d k)
	(define (iter acc count)
		(if (= count 0)
			acc
			(iter (/ (n count) (+ (d count) acc)) (- count 1))))
	(iter 0.0 k))

(define (square x) (* x x))

(define (tan-cf x k)
	(define (tan-n i)
		(if (= i 1)
			x
			(- (square x))))
	(define (tan-d i)
		(- (* 2.0 i) 1.0))
	(cont-frac-iter tan-n tan-d k))

(tan-cf 1.0 1000)