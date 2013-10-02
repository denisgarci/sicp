;;ex1.1

10
;;10

(+ 5 3 4)
;; 12

(- 9 1)
;; 8

(/ 6 2)
;; 3

(+ (* 2 4) (- 4 6))
;; 6

(define a 3)
;; prints nothing

(define b (+ a 1))
;; print nothing

(+ a b (* a b))
;; 19

(= a b)
;; #f

(if (and (> b a) (< b (* a b)))
         b
         a)
;; 4 (i.e. b)

(cond ((= a 4) 6)
     ((= b 4) (+ 6 7 a))
     (else 25))
;; 16

(+ 2 (if (> b a) b a))
;; 6

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
;; 16


;; ex1-2

(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))
;; -37 / 150


;; ex1-3

(define (max a b)
  (if (> a b)
      a
      b))

(define (square x)
  (* x x))

(define (sum-of-square x y)
  (+ (square x) (square y)))

(define (sum-of-max-square a b c)
  (if (= a (max a b))
      (sum-of-square a (max b c))
      (sum-of-square b (max a c))))

(sum-of-max-square 2 3 4)
;; 25

;; ex1-4

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
;; if b > 0 "return" the + operator! a + b
;; if b < 0 "return" the - operator! a - b = a + |b|
;; pretty cool :)

;; ex1-5

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

;; (test 0 (p))
;; todo! read about appicative vs normal order evalutation

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
;; memory overflow
;; why doesn't evaluate? and put in on the stack

;; ex1-7

(define (good-enough?2 previous-guess guess x)
  (< (abs (/ (- guess previous-guess) guess)) 0.001))
  
(define (sqrt-iter2 previous-guess guess x)
  (if (good-enough?2 previous-guess guess x)
          guess
          (sqrt-iter2 guess (improve guess x) x)))
  
(sqrt-iter2 1.1 1 4)