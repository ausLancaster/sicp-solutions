(define (reverse list)
	(define (reverse-iter list result)
		(if (null? list)
			result
			(reverse-iter (cdr list) (cons (car list) result))))
	(reverse-iter list '()))

(reverse (list 1 4 6 16 25))