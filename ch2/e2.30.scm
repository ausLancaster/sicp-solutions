(define (square-tree x)
	(cond ((null? x) ())
		((not (pair? x)) (* x x))
		(else (cons (square-tree (car x))
					(square-tree (cdr x))))))

(define (square-tree x)
	(map (lambda (sub-tree)
			(if (pair? sub-tree)
				(square-tree sub-tree)
				(* sub-tree sub-tree)))
		x))

(square-tree
	(list 1
		(list 2 (list 3 4) 5)
		(list 6 7)))