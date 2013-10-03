;; ex1-5

(define (p) (p)) ; interesting try (define (p) p)

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))
;; applicative order / by value you evalute each arguments first so evaluate 0 and (p) and loop
;; todo! read about appicative vs normal order evalutation


;; normative

;(test 0 (p))
;(if (= 0 0) 0 (p))
;0

;; applicative
;(test 0 (p)) ;; evalutae (p)
;(test 0 (p)) ;; infinite loop! because of p definition
