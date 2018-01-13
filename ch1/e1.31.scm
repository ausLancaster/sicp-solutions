(define (product-rec term a next b)
	(if (> a b)
	1
	(* (term a)
	   (product-rec term (next a) next b))))

(define (product-iter term a next b)
	(define (iter a result)
		(if (> a b)
			result
			(iter (next a) (* result (term a)))))
	(iter a 1))

(define (factorial n)
	(define (identity x) x)
	(define (inc x) (+ x 1))
	(product-iter identity 1 inc n))

(define (pi-approx n)
	(define (inc x) (+ x 1))
	(define (term x)
		(define num
			(if (= (remainder x 2) 0)
			x
			(+ x 1)))
		(define den
			(if (= (remainder x 2) 0)
			(+ x 1)
			x))
		(/ num den))
	(product-iter term 2.0 inc n))