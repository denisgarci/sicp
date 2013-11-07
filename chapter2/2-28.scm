#lang planet neil/sicp

;;  ex2-28


(define (fringe items)
    (define (iter list1 list2)
        (cond ((null? list1) list2)
              ((not (pair? list1)) list1)
              ((not (pair? (car list1))) (iter (cdr list1) (cons (car list1) list2)))
              (else (iter (cons (iter (car list1) nil) (cdr list1)) list2))))
    (iter items nil))



(define (fringe2 items)
    (cond ((null? items) nil)
          ((not (pair? (car items))) (car items))
          (else (cons (fringe2 (car items)) (fringe2 (cdr items))))))

(define x (list (list 1 2) (list 3 4)))

(fringe x)
; (1 2 3 4)

(fringe2 x)
; (1 2 3 4)


(fringe2 (list x x))
; (1 2 3 4 1 2 3 4)

(fringe2 (list (list 1)))

(cons (list 1) nil)
