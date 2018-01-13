; combiners

(define (filtered-accumulate combiner null-value filter term a next b)
	(if (> a b)
		null-value
		(if (filter a)
			(combiner (term a)
				(filtered-accumulate combiner null-value filter term (next a) next b))
			(filtered-accumulate combiner null-value filter term (next a) next b))))

(define (filtered-sum filter term a next b)
	(filtered-accumulate + 0 filter term a next b))

(define (filtered-product filter term a next b)
	(filtered-accumulate * 1 filter term a next b))

(define (sum-of-primes a b)
	(define (identity x) x)
	(define (inc x) (+ x 1))
	(filtered-sum prime? identity a inc b))

(define (product-of-relative-primes n)
	(define (identity x) x)
	(define (inc x) (+ x 1))
	(define (coprime? i)
		(= (gcd i n) 1))
	(filtered-product coprime? identity 2 inc n))


; prime test

(define (expmod base exp m)
	(cond ((= exp 0) 1)
		((even? exp)
			(remainder (square (expmod base (/ exp 2) m))
						m))
		(else
			(remainder (* base (expmod base (- exp 1) m))
				m))))

(define (fermat-test n)
	(define (try-it a)
		(= (expmod a n n) a))
	(try-it (+ 1 (random (- n 1))))) 

(define (fast-prime? n times)
	(cond ((= times 0) true)
		  ((fermat-test n) (fast-prime? n (- times 1)))
		  (else false)))

(define (prime? n)
	(fast-prime? n 10))


; gcd

(define (gcd a b)
	(if (= b 0)
		a(gcd b (remainder a b))))