#lang planet neil/sicp

;;  ex2-20

(define (reverse items)
    (define (reverse-iter list1 list2)
        (if (null? list1)
            list2
            (reverse-iter (cdr list1) (cons (car list1) list2))))
    (reverse-iter items nil))


(define (same-parity x . y)
    (define (same-parity-iter list1 list2)
        (let ((xmod2 (remainder x 2)))
            (cond ((null? list1)
                    (reverse list2))
                ((= (remainder (car list1) 2) xmod2)
                    (same-parity-iter (cdr list1) (cons (car list1) list2)))
                (else
                    (same-parity-iter (cdr list1) list2)))))
        (same-parity-iter y (list x)))

(define (same-parity2 x . y)
    (define (iter items)
        (let ((xmod2 (remainder x 2)))
            (cond ((null? items) nil)
                ((= (remainder (car items) 2) xmod2)
                    (cons (car items) (iter (cdr items))))
                (else
                    (iter (cdr y))))))
    (iter (cons x y)))

(same-parity 1 2 3 4 5 6 7)
;; (1 3 5 7)

(same-parity 2 3 4 5 6 7)
;; (2 4 6)

(same-parity2 1 2 3 4 5 6 7)
;; (1 3 5 7)

(same-parity2 2 3 4 5 6 7)
;; (2 4 6)