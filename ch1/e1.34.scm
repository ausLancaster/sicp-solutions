(define (f g)
	(g 2))

; The interpreter gives error: "The object 2 is not applicable".
; (f f) -> (f 2) -> (2 2)