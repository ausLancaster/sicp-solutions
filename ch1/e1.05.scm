(define (p) (p))

(define (test x y)
	(if (= x 0)
		0
		y))

(test 0 (p))

; For applicative-order evaluation: test will try determine the value of p.
; The definition of p is circular so it will loop for infinity. For
; normal-order evalution: test will expand first and return 0 because x is 0
; and p is never needed.