#lang planet neil/sicp

;;  ex2-01


(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))

(define (better-make-rat n d)
    (if (< (* n d) 0)
        (define mul (- 1))
        (define mul 1))
    (make-rat (* mult (abs n)) (abs d)))