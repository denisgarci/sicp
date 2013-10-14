#lang planet neil/sicp

;;  ex1-23


(define (square x)
 (* x x))

(define (smallest-divisor n)
 (find-divisor n 2))

(define (find-divisor n test-divisor)
 (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define  (divides? a b)
 (= (remainder b a) 0))

(define (prime? n)
 (= n (smallest-divisor n)))


(define (next n)
    (if (= n 2) 
        3
        (+ n 2)))
        
        (define (start-prime-test n start-time)
 (if (prime? n)
     (report-prime (- (runtime) start-time))))



(define (timed-prime-test n)
 (newline)
 (display n)
 (start-prime-test n (runtime)))

 
(define (report-prime elapsed-time)
 (display "***")
 (display elapsed-time))


(define (search-for-primes a b)
    (define (iter count)
        (cond ((or (< count a) (> count b)) (display "\nEnd\n"))
            (else (timed-prime-test count)
                  (iter (+ count 2)))))
    (iter (next-odd a)))

(define (next-odd a)
 (if (= (remainder a 2) 0)
     (+ a 1)
     a))


;; do it!

;; we're checking for equality (cf next) instead of doing a step for even numbers so it's a tradeoff and depending on implementation
;; it might not be a good one.

(search-for-primes 100 130)