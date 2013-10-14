# lang planet neil/sicp

;;  ex1-20

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remaind a b))))

