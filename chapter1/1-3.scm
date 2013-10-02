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
