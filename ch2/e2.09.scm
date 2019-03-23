; Proof that width of the sum is the function of widths

; Let X = interval [x1, x2] and Y = interval [y1 y2]
; The width of X (width-X) is (x2-x1)/2 and likewise the width of Y (width-Y) is (y2-y1)2
; The lower bound of X + Y is x1 + y1, and the upper bound is x2 + x2
; Therefore the width of X + Y is then:
; (x2+y2-x1-y2)/2
; = (x2-x1)/2 + (y2-y1)/2
; = width-X + width-Y



; Counterexample for mulitplication

; Assume the product of two intervals is a function of only the widths of the
; operands

; If a and b are intervals with the same width, then (width a c) and (width b c)
; should have the same result, where c is another interval.

(define a (make-interval 1 3))
(define b (make-interval 3 5))
(define c (make-interval 10 15))
;(mul-interval a b)
; = (3 . 15)
;(mul-interval a c)
; = (10 . 45)

; The widths of the products are different, therefore the product of two
; intervals is not a function of only the widths of the operands 

(define (make-interval a b) (cons a b))

(define (lower-bound interval)
	(car interval))

(define (upper-bound interval)
	(cdr interval))

(define (mul-interval x y)
   (let ((p1 (* (lower-bound x) (lower-bound y)))
         (p2 (* (lower-bound x) (upper-bound y)))
         (p3 (* (upper-bound x) (lower-bound y)))
         (p4 (* (upper-bound x) (upper-bound y))))
     (make-interval (min p1 p2 p3 p4)
                    (max p1 p2 p3 p4))))

