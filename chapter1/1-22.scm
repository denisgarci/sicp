#lang planet neil/sicp

;;  ex1-22

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


(define (timed-prime-test n)
 (newline)
 (display n)
 (start-prime-test n (runtime)))
 
(define (start-prime-test n start-time)
 (if (prime? n)
     (report-prime (- (runtime) start-time))))

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


(search-for-primes 100000 100100)


;; check with Nancy!


;;  3 primes > 100
;;  101, 103, 107

;; 3 primes > 1000
;; 1009, 1013, 1019


;;  3 primes > 100000
;; 100003, 100019, 100043

;;  3 primes > 1000000
;; 1000003, 1000033, 1000037