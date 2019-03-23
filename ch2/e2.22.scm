(define (square-list items)
	(define (iter things answer)
		(if (null? things)
			answer
			(iter (cdr things)
				(cons (square (car things))
					answer))))
	(iter items 'nil))

; This procedure doesn't work because it considers list elements
; from left to right, but then build the list from right to left

(define (square-listy items)
	(define (iter things answer)
		(if (null? things)
			answer
			(iter (cdr things)
				(cons answer
					(square (car things))))))
	(iter items 'nil))

; This procedure produces a result in the correct order but the list
; is constructed the wrong way. Lists need to have the right most
; element created first.

(square-list (list 1 2 3 4))