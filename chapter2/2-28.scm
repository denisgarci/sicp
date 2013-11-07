#lang planet neil/sicp

;;  ex2-28


; this version is not working
(define (fringe items)
    (define (iter list1 list2)
        (cond ((null? list1) (reverse list2))
              ((not (pair? list1)) (cons list1 list2))
              (else (iter (cons (car (car list1)) (cons (cdr (car (car list1))) (cdr list1))) list2))))
    (iter items nil))



(define (fringe2 items)
    (cond ((null? items) nil)
          ((not (pair? items)) (list items))
          (else (append (fringe2 (car items)) (fringe2 (cdr items))))))


(define x (list (list 1 2) (list 3 4)))


(fringe2 x)
; (1 2 3 4)

(fringe2 (list x x))
; (1 2 3 4 1 2 3 4)

(fringe2 (list (list 1)))

