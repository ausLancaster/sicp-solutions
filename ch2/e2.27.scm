(define (deep-reverse list)
	(define (reverse-iter list result)
		(if (null? list)
			result
			(reverse-iter (cdr list) (cons (deep-reverse (car list)) result))))
	(if (not (pair? list))
		list
		(reverse-iter list '())))

(define x (list (list 1 2) (list 3 4)))

(deep-reverse x)