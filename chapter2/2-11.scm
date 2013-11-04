#lang planet neil/sicp

;;  ex2-11


(define (make-interval a b) (cons a b))

(define (upper-bound x) (car x))

(define (lower-bound x) (cdr x))

;; (define (mul-interval x y)
;;     (let ((lox (lower-bound x))
;;           (upx (upper-bound x))
;;           (loy (lower-bound y))
;;           (upy (upper-bound y)))
;;         (let ((lo (cond
;;     (make-interval lo up)))