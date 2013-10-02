;; ex1-7

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough?2 previous-guess guess x)
  (< (abs (/ (- guess previous-guess) guess)) 0.001))

(define (sqrt-iter2 previous-guess guess x)
  (if (good-enough?2 previous-guess guess x)
          guess
          (sqrt-iter2 guess (improve guess x) x)))

(sqrt-iter2 1.1 1 4)
