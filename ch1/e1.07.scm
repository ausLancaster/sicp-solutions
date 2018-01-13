(define (improve guess x)
	(average guess (/ x guess)))

(define (average x y)
	(/ (+ x y) 2))

(define (good-enough? guess x)
	(< (abs (- (improve guess x) guess)) (* guess 0.001)))

(define (sqrt x)
	(sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
	(if (good-enough? guess x)
		guess
		(sqrt-iter (improve guess x)
			x)))

; The smaller the number we are given as input, the more inaccurate the result.
; This is because for small numbers 0.001 is very close or larger than the size
; of the result, so the inaccuracy becomes larger. By using a fraction of the
; input as our benchmark for accuracy we have a test that scales with the size
; of the input.