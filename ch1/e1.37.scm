(define (cont-frac1 n d k)
	(define (cont-frac-rec x)
		(if (> x k)
			0
			(/ (n x)
			   (+ (d x)
			   	  (cont-frac-rec (+ x 1))))))
	(cont-frac-rec 1))


(define (check1 k)
	(cont-frac1 (lambda (i) 1.0)
			   (lambda (i) 1.0)
			   k))

; Must be called 11 times to get approximation accurate to 4 decimal places

(define (cont-frac2 n d k)
	(define (cont-frac-iter x result)
		(if (= x 0)
		result
		(cont-frac-iter (- x 1) (/ (n x) (+ (d x) result)))))
	(cont-frac-iter k 0))

(define (check2 k)
	(cont-frac2 (lambda (i) 1.0)
			   (lambda (i) 1.0)
			   k))