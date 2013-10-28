#lang planet neil/sicp

;;  ex2-5


(define (count-power x b)
    (define (iter count newx)
        (if (not (= (remainder newx b) 0))
            count
            (iter (+ count 1) (/ newx b))))
    (iter 0 x))

(define (cons a b)
    (* (expt 2 a) (expt 3 b)))

(define (car p)
    (if (= p 1)
        0
        (count-power p 2)))

(define (cdr p)
    (if (= p 1)
        0
        (count-power p 3)))


(= (car (cons 0 0)) 0)
(= (cdr (cons 0 0)) 0)
(= (car (cons 1 0)) 1)
(= (cdr (cons 1 0)) 0)
(= (car (cons 0 1)) 0)
(= (cdr (cons 0 1)) 1)
(= (car (cons 1 2)) 1)
(= (cdr (cons 1 2)) 2)

(= (car (cons 5 3)) 5)
(= (cdr (cons 5 3)) 3)
