#lang planet neil/sicp

;;  ex2-27


(define x (list (list 1 2) (list 3 4)))

x
; ((1 2) (3 4))

(reverse x)
; ((3 4) (1 2))


(define (count-leaves x)
 (cond ((null? x) 0)
  ((not (pair? x)) 1)
  (else (+ (count-leaves (car x))
         (count-leaves (cdr x))))))


; this code doesnt work
(define (deep-reverse items)
    (cond ((pair? items) (cons (deep-reverse (car items)) (deep-reverse (cdr items))))
          (else items)))


(define (deep-reverse2 items)
    (define (iter list1 list2)
        (cond ((null? list1) list2)
              ((not (pair? list1)) list1)
              (else (iter (cdr list1) (cons (iter (car list1) nil) list2)))))
    (iter items nil))

(deep-reverse2 x)
; ((4 3) (2 1))

(define y (cons 1 (list 3 4)))

(deep-reverse2 y)

