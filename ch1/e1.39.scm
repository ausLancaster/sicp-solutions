(define (cont-frac n d k)
	(define (cont-frac-rec x)
		(if (> x k)
			0
			(/ (n x)
			   (- (d x)
			   	  (cont-frac-rec (+ x 1))))))
	(cont-frac-rec 1))

(define (tan-cf x k)
	(define (n y)
		(if (= y 1)
			x
			(* x x)))
	(define (d y)
		(- (* y 2) 1))
	(cont-frac n d k))