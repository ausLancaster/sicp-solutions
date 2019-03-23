(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
	(lambda (f) (lambda (x) (f ((n f) x)))))

(define one
	(lambda (f) (lambda (x) (f x))))

(define two
	(lambda (f) (lambda (x) (f (f x)))))

(define (plus a b)
	(lambda (f) (lambda (x) ((b f) ((a f) x)))))

(define (multiply a b)
	(compose a b))

(define (compose f g)
	(lambda (x) (f (g x))))

(define (inc x) (+ x 1))