#lang planet neil/sicp

;;  ex2-8


(define (sub-interval x y)
    (make-interval (- (lower-bound x) (lower-bound y))
                   (- (upper-bound x) (upper-bound y))))