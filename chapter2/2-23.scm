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



(my-for-each (lambda (x) (newline) (display x)) (list 57 321 88))
