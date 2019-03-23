(define (cons x y)
	(*  (expt 2 x)
		(expt 3 y)))

(define (car z)
	(define (iter x)
		(if (not (= (remainder x 2) 0))
			0
			(+ 1 (iter (/ x 2)))))
	(iter z))

(define (cdr z)
	(define (iter x)
		(if (not (= (remainder x 3) 0))
			0
			(+ 1 (iter (/ x 3)))))
	(iter z))

(define logB 
    (lambda (x B) 
      (/ (log x) (log B))))