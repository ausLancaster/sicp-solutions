(define (display-prime n)
	(newline)
	(display "found prime: ")
	(display n))

(define (smallest-divisor n)
	(find-divisor n 2))

(define (find-divisor n test-divisor)
	(cond ((> (square test-divisor) n) n)
		((divides? test-divisor n) test-divisor)
		(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
	(= (remainder b a) 0))

(define (prime? n)
	(= n (smallest-divisor n)))

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

; each step should icrease by sqrt(10) = 3.16
; time to find primes around 1000 = 0.27ms
; time to find primes around 10000 = 0.97ms, increase by factor of 3.59
; time to find primes around 100000 = 2.40ms, increase by factor of 2.47
; time to find primes around 1000000 = 5.47ms, increase by factor of 2.28