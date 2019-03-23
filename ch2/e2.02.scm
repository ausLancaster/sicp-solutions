(define (make-segment p1 p2)
	(cons p1 p2))

(define (start-segment p)
	(car p))

(define (end-segment p)
	(cdr p))

(define (make-point x y)
	(cons x y))

(define (x-point p)
	(car p))

(define (y-point p)
	(cdr p))

(define (midpoint-segment l)
	(make-point (/ (+ (x-point (start-segment l))
					  (x-point (end-segment l)))
				   2)
				(/ (+ (y-point (start-segment l))
					  (y-point (end-segment l)))
				   2)))

(define (print-point p)
	(newline)
	(display "(")
	(display (x-point p))
	(display ",")
	(display (y-point p))
	(display ")"))