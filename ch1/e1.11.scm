(define (f-rec n)
	(if (< n 3)
		n
		(+ (f (- n 1))
		   (* 2 (f (- n 2)))
		   (* 3 (f (- n 3))))))

(define (f n)
	(f-iter 2 1 0 n))

(define (f-iter a b c count)
	(if (= count 0)
	c
	(f-iter (+ a (* b 2) (* c 3)) a b (- count 1))))