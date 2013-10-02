;; ex1-5

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))
;; todo! read about appicative vs normal order evalutation

