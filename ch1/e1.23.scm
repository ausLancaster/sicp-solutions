(define (smallest-divisor n)
	(find-divisor n 2))

(define (find-divisor n test-divisor)
	(cond ((> (square test-divisor) n) n)
		((divides? test-divisor n) test-divisor)
		(else (find-divisor n (next test-divisor)))))

(define (divides? a b)
	(= (remainder b a) 0))

(define (prime? n)
	(= n (smallest-divisor n)))

(define (next n)
	(if (= n 2)
		3
		(+ n 2)))

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

; time to find primes around 1000 = 0.20ms compared to 0.27ms factor of 1.35
; time to find primes around 10000 = 0.64ms compared to 0.97ms factor of 1.52
; time to find primes around 100000 = 1.51ms compared to 2.40ms factor of 1.59
; time to find primes around 1000000 = 3.32ms compared to 5.47ms factor of 1.65

; Improvement is not quite a factor of 2 before we need to do an extra if in the next procedure.