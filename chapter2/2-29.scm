#lang planet neil/sicp

;;  ex2-29


(define (make-mobile left right)
 (list left right))

(define (make-branch length structure)
 (list length structure))

(define (left-branch mobile)
    (car mobile))

(define (right-branch mobile)
    (cdr (car mobile)))

(define (branch-length branch)
    (car branch))

(define (branch-structure branch)
    (car (cdr branch)))

(define (total-weight mobile)
    (cond ((not (pair? mobile)) mobile)
          (+ (total-weight (branch-structure (left-branch mobile)))
             (total-weight (branch-structure (right-branch mobile))))))

(define (balanced mobile)
    (if (not (pair? mobile))
        true
        (let ((lb (left-branch mobile)) ; here let was not working because of nested reference...
              (rb (right-branch mobile)))
              (let ((ls (branch-structure lb)) ; exactly here...
                    (rs (branch-structure rb)))
                    (and (= (* (branch-length lb) (total-weight lb)) (* (branch-length rb) (total-weight rb)))
                        (balanced lb) (balanced rb))))))



(define branch1 (make-branch 1 1))

(define branch2 (make-branch 2 2))

(define mobile1 (make-mobile branch1 branch1))

(define mobile2 (make-mobile branch1 branch2))

(total-weight mobile1)
; 2

(total-weight mobile2)
; 3

(balanced mobile1)
; true

(balanced mobile2)
; false


