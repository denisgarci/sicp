#lang planet neil/sicp

;;  ex1-12


;; list of memory growin 1 then 2 then 3 etc
;; how to pass them withou a list (growing!)
;; pascal is an array!!!! use it as it is!
(define (pascal x y)
 (cond ((and (= x 0) (= y 0)) 1)
  ((or (> y x) (< y 0)) 0)
  (else (+ (pascal (- x 1) (- y 1)) (pascal (- x 1) y)))))


(pascal 3 0)
(pascal 3 1)
(pascal 3 2)
(pascal 3 3)

(define (print-pascal n)
  (define (print-pascal-iter row col)
    (cond ((> row n) )
          ((> col row) (display "\n")
           (print-pascal-iter (+ row 1) 0))
          (else (display (pascal row col))
                (print-pascal-iter row (+ col 1)))))
  (print-pascal-iter 0 0))

(print-pascal 3)
