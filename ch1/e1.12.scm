(define (pascal depth row)
	(if (or (= row 0) (= row depth))
		1
		(+ (pascal (- depth 1) (- row 1))
		   (pascal (- depth 1) row))))