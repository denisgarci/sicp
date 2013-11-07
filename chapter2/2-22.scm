#lang planet neil/sicp

;;  ex2-22


(define (square x) (* x x))


(define (square-list items)
    (define (iter things answer)
        (if (null? things)
            answer
            (iter (cdr things)
                  (cons (square (car things))
                        answer))))
    (iter items nil))

(define (square-list2 items)
    (define (iter things answer)
        (if (null? things)
            answer
            (iter (cdr things)
                  (cons answer (square (car things))))))
    (iter items nil))



(square-list (list 1 2 3 4))
; cons "appends" to the beginning of the list thus unpacking a list and then
; then cons the result to another list reverse the order
; (1 4 9 16)

(square-list2 (list 1 2 3 4))
; again cons at the beginning thus cannot be used in this way
; cf empty case (cons nil last) and it should be (cons last nil)
; cons answer (is a lit!) (a value)
; (1 4 9 16)
