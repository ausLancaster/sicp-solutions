(define (A x y)
	(cond ((= y 0) 0)
		((= x 0) (* 2 y))
		((= y 1) 2)
		(else (A (- x 1)
			(A x (- y 1))))))

; (A 1 10) => 128
; (A 2 4) => 65536
; (A 3 3) => 134217728

; (f n) computes n
; (g n) computes n^2
; (h n) computes n^4
; (A x y) computes y^(2^x)