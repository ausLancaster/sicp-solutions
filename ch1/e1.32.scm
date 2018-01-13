(define (accumulate-rec combiner null-value term a next b)
	(if (> a b)
	null-value
	(combiner (term a)
		(accumulate-rec combiner null-value term (next a) next b))))

(define (sum term a next b)
	(accumulate-iter + 0 term a next b))

(define (product term a next b)
	(accumulate-iter * 1 term a next b))

(define (accumulate-iter combiner null-value term a next b)
	(define (iter a result)
		(if (> a b)
			result
			(iter (next a) (combiner result (term a)))))
	(iter a null-value))

(define (product-iter term a next b)
	(define (iter a result)
		(if (> a b)
			result
			(iter (next a) (* result (term a)))))
	(iter a 1))

(define (factorial n)
	(define (identity x) x)
	(define (inc x) (+ x 1))
	(product identity 1 inc n))