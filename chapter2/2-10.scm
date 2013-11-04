#lang planet neil/sicp

;;  ex2-10

(define (make-interval a b) (cons a b))

(define (upper-bound x) (car x))

(define (lower-bound x) (cdr x))

(define (mul-interval x y)
    (let ((p1 (* (lower-bound x) (lower-bound y)))
          (p2 (* (upper-bound x) (lower-bound y)))
          (p3 (* (lower-bound x) (upper-bound y)))
          (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))

(define (div-interval x y)
    (if (not (> (* (lower-bound y) (upper-bound y)) 0))
        (display "ZeroDivsionError")
        (mul-interval x
            (make-interval (/ 1.0 (upper-bound y))
                (/ 1.0 (lower-bound y))))))

(define x (make-interval 1 2))
(define y (make-interval -1 1))

(div-interval x y)