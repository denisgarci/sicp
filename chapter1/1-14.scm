#lang planet neil/sicp

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount (- kinds-of-coins 1))
                 (cc (- amount (first-denomination kinds-of-coins)) kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(count-change 100)
;;  292

(count-change 11)
;;  4

;; 11, 5 -> 10, 5 -> ... -> 0, 5 (1)
;; 10, 4 -> 5, 4 -> 0, 4 (1)
;; 5, 5 -> 5, 4 -> 0, 4 (1)
;; 10, 3 -> 0, 3 (1)

;; linear space penny (tree)
;; time? add one to eleven what happen? double the size of the tree
;; so exp! 2^n
;;
