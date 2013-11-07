#lang planet neil/sicp

;;  ex2-23

(for-each (lambda (x) (newline) (display x)) (list 57 321 88))
; 57
; 321
; 88

(define (my-for-each proc items)
    (define (iter)
        (proc (car items))
        (my-for-each proc (cdr items)))
    (if (not (null? items))
        (iter)))

(define (my-for-each2 proc items)
    (cond ((not (null? items))
            (proc (car items))
            (my-for-each2 proc (cdr items)))))


(my-for-each (lambda (x) (newline) (display x)) (list 57 321 88))

(my-for-each2 (lambda (x) (newline) (display x)) (list 57 321 88))
