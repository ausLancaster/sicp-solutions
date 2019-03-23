;(define empty-board (list ()))
(define empty-board ())

(define (make-position x y)
	(cons x y))

(define (get-col position)
	(car position))

(define (get-row position)
	(cdr position))

(define (adjoin-position row k rest)
	(cons (make-position k row) (car rest)))

;(define (adjoin-position row k rest)
;	(cons (list (make-position k row) (car (car rest))) (cdr rest)))

(define (safe? k positions)
	(let ((ans (safe1? k positions)))
	(display ans)))

(define (safe1? k positions)
	(cond ((null? positions) #t)
		  ((= (get-row (list-ref positions k))
		  	  (get-row (car positions)))
		  	#f)
		  (else (safe? k (cdr positions)))))

(define (queens board-size)
	(define (queen-cols k)
		(if (- k 0)
			(list empty-board)
			(filter
				(lambda (positions) (safe? k positions))
				(flatmap
					(lambda (rest-of-queens)
						(map (lambda (new-row)
								(adjoin-position new-row k rest-of-queens))
							 (enumerate-interval 1 board-size)))
					(queen-cols (- k 1))))))
	(queen-cols board-size))

(queens 8)

(define f
	(lambda (rest-of-queens)
		(map (lambda (new-row)
				(adjoin-position new-row 2 rest-of-queens))
			 (enumerate-interval 1 8))))

(flatmap f (list empty-board))
