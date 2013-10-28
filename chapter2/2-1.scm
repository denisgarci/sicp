#lang planet neil/sicp

;;  ex2-01


(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))

(define (better-make-rat n d)
 (let ((mult
        (if (< (* n d) 0)
            (- 1)
            1)))
    (make-rat (* mult (abs n)) (abs d))))


(better-make-rat -1 3)