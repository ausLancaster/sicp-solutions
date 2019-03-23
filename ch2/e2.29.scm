(define (make-mobile left right)
	(list left right))

(define (make-branch length structure)
	(list length structure))

(define (left-branch mobile)
	(car mobile))

(define (right-branch mobile)
	(car (cdr mobile)))

(define (branch-length branch)
	(car branch))

(define (branch-structure branch)
	(car (cdr branch)))

(define my-mobile (make-mobile (make-branch 1 10) (make-branch 1 (make-mobile (make-branch 1 5) (make-branch 1 5)))))

(define (total-weight x)
	(if (not (pair? x))
		x
		(+ (total-weight (branch-structure (left-branch x)))
		  	(total-weight (branch-structure (right-branch x))))))

(total-weight my-mobile)

(define (balanced? x)
	(if (not (pair? x))
		#t
		(and (= (total-weight (branch-structure (left-branch x)))
				(total-weight (branch-structure (right-branch x))))
		 	 (balanced? (branch-structure (left-branch x)))
		 	 (balanced? (branch-structure (right-branch x))))))

(balanced? my-mobile)

; d) only need to change right-branch and branch-strcutre (remove the car call)