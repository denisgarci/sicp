#lang planet neil/sicp

;;  ex2-18


(define (last-pair items)
    (if (null? (cdr items))
        (car items)
        (last-pair (cdr items))))


(define (reverse items)
    (define (reverse-iter list1 list2)
        (if (null? list1)
            list2
            (reverse-iter (cdr list1) (cons (car list1) list2))))
    (reverse-iter items nil))

;; recursive version using append!
(define (append list1 list2)
    (if (null? list1)
        list2
        (cons (car list1) (append (cdr list1) list2))))

(reverse (list 1 4 9 16 25))
;;  (25 16 9 4 1)

