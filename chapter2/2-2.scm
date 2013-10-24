#lang planet neil/sicp

;; ex2-2

(define (make-point x y)
    (cons x y))

(define (x-point point)
    (car point))

(define (y-point point)
    (cdr point))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))


(define (make-segment s-point e-point)
    (cons s-point e-point))

(define (start-segment seg) (car seg))

(define (end-segment seg) (cdr seg))

(define (midpoint-segment seg)
    (let ((start (start-segment seg))
        (end (end-segment seg))
        (x-mid (/ (- (x-point end) (x-point start)) 2.0))
        (y-mid (/ (- (y-point end) (y-point start)) 2.0)))
    (make-point x-mid y-mid)))

(define start (make-point 0 0))
(define end (make-point 1 0))
(define 01-seg (make-segment start end))

(print-point (midpoint-segment 01-seg))