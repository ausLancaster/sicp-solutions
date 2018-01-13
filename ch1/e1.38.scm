(define (cont-frac n d k)
	(define (cont-frac-rec x)
		(if (> x k)
			0
			(/ (n x)
			   (+ (d x)
			   	  (cont-frac-rec (+ x 1))))))
	(cont-frac-rec 1))

(define (approx-e n)
	(define (d x)
		(if (= (remainder x 3) 2)
			(* (+ (quotient x 3) 1) 2)
			1))
	(+ (cont-frac (lambda (i) 1.0)
			   d
			   n)
		2))
