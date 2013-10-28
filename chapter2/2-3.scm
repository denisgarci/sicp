 #lang planet neil/sicp

;; ex2-3


(define (make-point x y)
    (cons x y))

(define (x-point point)
    (car point))

(define (y-point point)
    (cdr point))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-rectangle p1 p2)
    (cons p1 p2))

(define (width rect)
)

(define (heigh rect)
)

(define (area rect)
    (* (width rect) (height rect)))

(define (peri rect)
    (+ (2 * (width rect)) (2 * (height rect))))
