(load "e2.12.scm")

(define a (make-center-percent 100 1))
(define b (make-center-percent 200 2))

(define aa (div-interval a a))
(define ab (div-interval a b))

(center aa)
; 1.0002000200020003
(percent aa)
; 1.9998000199980077

(center ab)
; .5003001200480192
(percent ab)
; 2.9994001199760016