#lang planet neil/sicp

;;  ex1-36

; a

(define (cont-frac n d k)
	;; we need a counter to start bottom ((n k)/ (d k)) to top
	(define (iter count)
		(if (= count k)
			(/ (n k) (d k))
			(/ (n count) (+ (d count) (iter (+ count 1))))))
	(iter 1))

(define (golden-r k)
	(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k))

(golden-r 10)

(define (cont-frac-iter n d k)
	(define (iter acc count)
		(if (= count 0)
			acc
			(iter (/ (n count) (+ (d count) acc)) (- count 1))))
	(iter 0.0 k))

(define (golden-r-iter k)
	(cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) k))

(golden-r-iter 10)