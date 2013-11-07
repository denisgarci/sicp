#lang planet neil/sicp

;;  ex2-30


(define (scale-tree tree factor)
    (cond ((null? tree) nil)
          ((not (pair? tree)) (* tree factor))
          (else (cons (scale-tree (car tree) factor) (scale-tree (cdr tree) factor)))))

(define (scale-tree2 tree factor)
    (map (lambda (sub-tree)
            (if (pair? sub-tree)
                (scale-tree2 sub-tree factor)
                (* sub-tree factor)))
        tree))


(define (square x) (* x x))

(define (square-tree tree)
    (cond ((null? tree) nil)
          ((not (pair? tree)) (square tree))
          (else (cons (square-tree (car tree)) (square-tree (cdr tree))))))

(define (square-tree2 tree)
    (map (lambda (sub-tree)
            (if (pair? sub-tree)
                (square-tree2 sub-tree)
                (square sub-tree)))
          tree))

(define x (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(square-tree x)
(square-tree2 x)
; (1 (4 (9 16) 25) (36 49))

