(define (subsets s)
	(if (null? s)
		(list ())
		(let ((rest (subsets (cdr s))))
			(append rest (map (lambda (x) (append (list (car s)) x)) rest)))))

(subsets (list 1 2 3))

; rest is the set of all subsets for numbers not including the first element.
; By mapping the appending of this number to rest, we get all the subsets of 
; numbers that do include the number. The combination of this and rest is the
; complete set that we are after. 