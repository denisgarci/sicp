#lang planet neil/sicp

;;  ex1-24

(define (square x)
 (* x x))

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
 
(define (fast-prime? n times)
    (cond ((= times 0) true)
    ((fermat-test n) (fast-prime? n (- times 1)))
    (else false)))

(define (timed-prime-test n)
 (newline)
 (display n)
 (start-prime-test n (runtime)))
 
 
 ;; TIMES ??? HOW MUCH TIME SHOULD WE CHECK EVEN IF THIS IS A CONSTANT
(define (start-prime-test n start-time)
 (if (fast-prime? n 12)
     (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
 (display "***")
 (display elapsed-time))


(define (search-for-primes n)
    (define (iter count)
        (cond ((> count n) (display "\nEnd\n"))
            (else (timed-prime-test count)
                  (iter (next count)))))
    (iter 2))

(define (next n)
    (if (= n 2)
        3
        (+ n 2)))


(search-for-primes 10000000)