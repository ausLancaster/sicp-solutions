; iterative-improve

(define (iterative-improve good-enough? improve)
	(define (try guess)
		(if (good-enough? guess)
			guess
			(try (improve guess))))
	(lambda (x) (try x)))

(define (sqrt x)
	((iterative-improve (lambda (guess)
							(< (abs (- (square guess)x)) 0.001))
						(lambda (guess)
							(average guess (/ x guess))))
						1.0))

(define (average x y)
	(/ (+ x y) 2))

(define (fixed-point f first-guess)
	((iterative-improve (lambda (guess)
							(< (abs (- guess (f guess))) 0.00001))
						(lambda (guess)
							(f guess)))
						first-guess))

; testing fixed-point

(define (sqrt2 x)
	(fixed-point (average-damp (lambda (y) (/ x y)))
		1.0))

(define (average-damp f)
	(lambda (x) (average x (f x))))