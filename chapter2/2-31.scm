#lang planet neil/sicp

;;  ex2-31

(define (tree-map proc tree)
    (cond ((null? tree) nil)
          ((not (pair? tree)) (proc tree))
          (else (cons (tree-map proc (car tree)) (tree-map proc (cdr tree))))))

(define (tree-map2 proc tree)
    (map (lambda (sub-tree)
            (if (pair? sub-tree)
                (tree-map2 proc sub-tree)
                (proc sub-tree)))
        tree))


(define (square x) (* x x))

(define (square-tree tree) (tree-map square tree))
(define (square-tree2 tree) (tree-map2 square tree))

(define x (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(square-tree x)
(square-tree2 x)
; (1 (4 (9 16) 25) (36 49))