(load "../ch1/e1.22.scm")

(define (prime-sum? pair)
	(prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
	(list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (flatmap proc seq)
	(accumulate append () (map proc seq)))

(define (enumerate-interval low high)
	(if (> low high)
		()
		(cons low (enumerate-interval (+ low 1) high))))

(define (unique-pairs n)
	(flatmap
		(lambda (i)
			(map (lambda (j) (list i j))
				(enumerate-interval 1 (- i 1))))
		(enumerate-interval 1 n)))

(define (prime-sum-pairs n)
	(map make-pair-sum
		(filter prime-sum?
			(unique-pairs n))))

(prime-sum-pairs 10)