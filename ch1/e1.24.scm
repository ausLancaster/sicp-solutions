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
	(fast-prime? n 5))

(define (display-prime n)
	(newline)
	(display "found prime: ")
	(display n))

(define (search-for-primes m n)
	(let ((this-prime? (prime? m)))
		(cond ((= n 0))
			  ((or (even? m)
			  	   (not this-prime?))
			  	   (search-for-primes (+ m 1) n))
			  (else (begin (;display-prime m)
			  			   )(search-for-primes (+ m 1) (- n 1)))))))

(define (even? x)
	(= (remainder x 2) 0))

(define (timed-prime-search m n)
	(define start-time (process-time-clock))
	(prime-search-iter m n 1000)
	(display "time: ")
	(display (- (process-time-clock) start-time)))
	(newline)

(define (prime-search-iter m n times)
	(if (= times 0)
		()
		(begin (search-for-primes m n)
			   (prime-search-iter m n (- times 1)))))

; I would expect finding primes near 1,000,000 to be log(1000) = 3 times as long as finding primes near 1000
; time to find primes around 1000 = 1.10s
; time to find primes around 1000000 = 2.73s, increase by factor of 2.48