(load "e2.36.scm")

(define (dot-product v w)
	(accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
	(map (lambda (x) (dot-product x v)) m))

(define m (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define v (list 1 2 3 4))

(matrix-*-vector m v)

(define (transpose mat)
	(accumulate-n cons () mat))

(transpose m)

(define (matrix-*-matrix m n)
	(let ((cols (transpose n)))
			(map (lambda (m-row) (accumulate (lambda (x y) (cons (dot-product m-row x) y)) () cols)) m)))

(define (matrix-*-matrix m n)
	(let ((cols (transpose n)))
			(map (lambda (m-row) (matrix-*-vector cols m-row)) m)))

(define n (list (list 1 2 3) (list 2 3 4) (list 3 4 5) (list 4 5 6)))

(matrix-*-matrix m n)