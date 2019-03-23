(define (which-method? x)
	(if (odd? x)
		(lambda (x) (= (remainder x 2) 1))
		(lambda (x) (= (remainder x 2) 0))))

(define (same-parity x . i)
	(define (same-parity-rec method i)
		(if (null? i)
			i
			(if (method (car i))
				(cons (car i) (same-parity-rec method (cdr i)))
				(same-parity-rec method (cdr i)))))
	(cons x (same-parity-rec (which-method? x) i)))

(same-parity 1 2 3 4 5 6 7)