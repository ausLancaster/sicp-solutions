(define (compose f g)
	(lambda (x) (f (g x))))

(define (repeated-rec f n)
	(if (= n 1)
		f
		(compose f (repeated-rec f (- n 1)))))

(define (repeated-iter f n)
	(define (iter n result)
		(if (= n 1)
			result
			(iter (- n 1) (compose f result))))
	(iter n f))