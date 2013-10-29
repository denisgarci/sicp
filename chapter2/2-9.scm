#lang planet neil/sicp

;;  ex2-9

;; width([a, b]) = (b - a) / 2

;; width(x + y) = width(x) + width(y)
;; width(x - y) = width(x) - width(y)

;; case [a, b] * [c, d] = [ac, bd]
;; width([ac, bd]) = (ac - bd) / 2

;; case [a, b] / [c, d] = [a/c, b/d]
;; width([a/c, b/d]) = 1/2 * (a/c - b/d)
