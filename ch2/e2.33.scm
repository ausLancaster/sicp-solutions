(define (accumulate op initial sequence)
	(if (null? sequence)
		initial
		(op (car sequence)
			(accumulate op initial (cdr sequence)))))

(define (map p sequence)
	(accumulate (lambda (x y) (cons (p x) y)) () sequence))

(define list1 (list 1 2 3 4 5))
(define list2 (list 6 7 8 9 10))

(map square list1)

(define (append seq1 seq2)
	(accumulate cons seq2 seq1))

(append list1 list2)

(define (length sequence)
	(accumulate (lambda (x y) (+ y 1)) 0 sequence))

(length (append list1 list2))