#lang planet neil/sicp

;;  ex-1-11

(define (f-rec n)
    (if (< n 3)
        n
        (+ (f-rec (- n 1)) (* 2 (f-rec (- n 2))) (* 3 (f-rec (- n 3))))
    )
)

(f-rec 7)
;; 25


(define (f-iter n)
    (define (iter a b c n)
        (if (= n 0)
            c
            (iter (+ a (* 2 b) (* 3 c)) a b (- n 1))
         ))
    (iter 2 1 0 n)
)


(f-iter 7)
;; 25

