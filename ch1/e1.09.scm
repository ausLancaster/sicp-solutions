(define (+ a b)
	(if (= a 0)
		b
		(inc (+ (dec a) b))))

; process is recursive:

; (+ 3 -2)
; (inc (+ 2 -2))
; (inc (inc (+ 1 -2)))
; (inc (inc (inc (+ 0 -2))))
; (inc (inc (inc -2)))
; (inc (inc -1))
; (inc 0)
; 1

(define (+ a b)
	(if (= a 0)
		b
		(+ (dec a) (inc b))))

; process is iterative:

; (+ 3 -2)
; (+ 2 -1)
; (+ 1 0)
; (+ 0 1)
; 1