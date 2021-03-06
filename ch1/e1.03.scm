(define (square x) (* x x))

(define (sum-of-squares x y) (+ (square x) (square y)))

(define (sumlargersquares x y z)
	(cond ((and (< z x) (< z y)) (sum-of-squares x y))
	      ((and (< y x) (< y z)) (sum-of-squares x z))
	      ((and (< x y) (< x z)) (sum-of-squares y z))
	      ))