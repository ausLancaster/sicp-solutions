(define (multiply x y)
	(multiply-iter x y 1))

(define (multiply-iter x y a)
	(cond ((= y 1) a)
		  ((even? y) (multiply-iter (double x) (halve y) a))
		  (else (multiply-iter x (- n 1) (+ a x)))))

(define (even? n)
	(= (remainder n 2) 0))

(define (double x) (* x 2))

(define (halve x) (/ x 2))