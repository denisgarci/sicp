#lang planet neil/sicp

;;  ex1-27

(define (square x)
 (* x x))

(define (smallest-divisor n)
 (find-divisor n 2))

(define (find-divisor n test-divisor)
 (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define  (divides? a b)
 (= (remainder b a) 0))

(define (prime? n)
 (= n (smallest-divisor n)))

(define (expmod base exp m)
 (cond ((= exp 0) 1)
  ((even? exp)
    (remainder (square (expmod base (/ exp 2) m)) m))
   (else
    (remainder (* base (expmod base (- exp 1) m)) m))))


(define (fermat-test n)
 (define (try-it a)
 (= (expmod a n n ) a))
(try-it (+ 1 (random (- n 1)))))

;; charmichael = 561, 1105, 1729, 2465, 2821 6601

(define (charmichael? n)
 (define (try-it a)
  (= (expmod a n n) a))
 (define (iter count)
 (cond
 ((and (= count n) (not (prime? n)))(display "It's a Carmichael baby!\n"))
 ((try-it count) (iter (+ count 1)))
 (else (display "It's not a Carmichael baby :(\n"))))
 (iter 1))
 
(charmichael? 561)

(charmichael? 1105)

(charmichael? 1729)

(charmichael? 2465)

(charmichael? 2821)

(charmichael? 6601)
