#lang planet neil/sicp

;;  ex2-37

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
    (if (null? (car seqs))
        nil
        (cons (accumulate op init (map car seqs))
              (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
    (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
    (map (lambda (x) (dot-product v x)) m))

(define (transpose mat)
    (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
    (let ((cols (transpose n)))
            (map (lambda (x) (matrix-*-vector cols x))  m)))


(define a-matrix (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))

(define vec1 (list 1 1 1 1))

(define 1-matrix (list vec1 vec1 vec1 vec1))

(define vec2 (list 1 2 3 4))

(dot-product vec1 vec2)
; 10

(matrix-*-vector a-matrix vec1)
; (10 21 30)

(transpose a-matrix)
;((1 4 6) (2 5 7) (3 6 8) (4 6 9))

(matrix-*-matrix 1-matrix 1-matrix)
; 4 * 1-matrix

