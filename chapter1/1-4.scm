#lang planet neil/sicp

;; ex1-4

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
;; if b > 0 "return" the + operator! a + b
;; if b < 0 "return" the - operator! a - b = a + |b|
;; pretty cool :)
