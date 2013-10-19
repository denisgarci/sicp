#lang planet neil/sicp

;;  ex1-36

; a

(define (cont-frac n d k)
	(if (= k 1)
		(/ (n 1) (d 1))
		(/ (n k) (+ (d k) (cont-frac n d (- k 1)))))) ; problem with the derm order, can change with the def of n and d

(define (golden-r k)
	(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k))

(golden-r 10)

(define (cont-frac-iter n d k)
	(define (iter acc count)
		(if (= count 0)
			acc
			(iter (/ (n k) (+ (d k) acc)) (- count 1))))
	(iter 0.0 k))

(define (golden-r-iter k)
	(cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) k))

(golden-r-iter 10)