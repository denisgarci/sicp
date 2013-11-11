#lang planet neil/sicp

;;  2-33


(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))


(define (map p sequence)
    (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(define (append seq1 seq2)
    (accumulate cons seq2 seq1))


(define (length sequence)
    (accumulate (lambda (x y) (+ 1 y)) 0 sequence))


(define (square x) (* x x))

(map square (list 1 2))
; (1 4)

(append (list 1 2) (list 3 4))
; (1 2 3 4)

(length (list 1 2 3))
; 3

(length (list 1))
; 1
