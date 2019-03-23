(define (make-rect bottom-left top-right)
	(cons bottom-left top-right))

(define (bottom-left rect)
	(car rect))

(define (top-right rect)
	(cdr rect))

(define (width rect)
	(abs (- (x-point (top-right rect))
	   		(x-point (bottom-left rect)))))

(define (height rect)
	(abs (- (y-point (top-right rect))
			(y-point (bottom-left rect)))))

(define (perimeter rect)
	(* (+ (width rect)
	      (height rect))
	2))

(define (area rect)
	(* (width rect)
	   (height rect)))

(define (distance l)
	(let ((x-diff (- (x-point (end-segment l))
					 (x-point (start-segment l))))
		  (y-diff (- (y-point (end-segment l))
					 (y-point (start-segment l)))))
	(sqrt (+ (square x-diff) (square y-diff)))))

(define (square x) (* x x))


; points and segments

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