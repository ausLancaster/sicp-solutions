(define (for-each function list)
	(if (null? list)
		#t
		(begin
			(function (car list))
			(for-each function (cdr list)))))

(for-each (lambda (x) (newline) (display x))
	(list 57 321 88))