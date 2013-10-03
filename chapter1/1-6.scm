;; ex1-6

(define  (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

;; (sqrt-iter 1.5 4)
;; memory overflow / stack overflow
;; why doesn't evaluate? and put in on the stack
;; applicative order
;; if is a SPECIAL FORM!!!!
;; evaluate a if: evaluate the predicate first and then...
;; but new-if is a function so you evaluate every parameter first!
;; thus we evaluate the last sqrt-iter again and again loop!
;; the function wrapper is the pbme it takes 3 arguments and loop on third!

