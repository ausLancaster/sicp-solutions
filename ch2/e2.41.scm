(define (flatmap proc seq)
	(fold-left append () (map proc seq)))

(define (enumerate-interval low high)
	(if (> low high)
		()
		(cons low (enumerate-interval (+ low 1) high))))

(define (add-to-s? s)
	(lambda (list)
		(= (fold-left + 0 list) s)))

(define (unique-triples n)
	(flatmap
		(lambda (i)
			(map (lambda (j) (list i j))
				(enumerate-interval 1 (- i 1))))
		(enumerate-interval 1 n)))

(define (unique-triples n)
	(flatmap
		(lambda (i)
			(flatmap (lambda (j)
				(map (lambda (k) (list i j k))
					(enumerate-interval 1 (- j 1))))
			(enumerate-interval 1 (- i 1))))
		(enumerate-interval 1 n)))

(define (triple-sum n s)
	(filter (add-to-s? s)
		(unique-triples n)))

(triple-sum 10 12)