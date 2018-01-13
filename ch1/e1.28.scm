(define (square-root-check a n)
	(if (and (not (or (= a 1) (= a (- n 1))))
			 (= (remainder (square a) n) 1))
	0
	(remainder (square n) n)))

(define (expmod base exp m)
	(cond ((= exp 0) 1)
		((even? exp)
			(square-root-check (expmod base (/ exp 2) m)m))
		(else
			(remainder (* base (expmod base (- exp 1) m))
				m))))

(define (square n) (* n n))

(define (even? x)
	(= (remainder x 2) 0))

(define (miller-rabin-test n)
	(define (try-it a)
		(= (expmod a (- n 1) n) 1))
	(try-it (+ 1 (random (- n 1))))) 