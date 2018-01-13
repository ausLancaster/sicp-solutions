(define (a-plus-abs-b a b)
	((if (> b 0) + -) a b))

; This procedure calculates a + |b|. The operand is chosen conditionally: if b
; is greater than zero, the operand is +, if it is less than or equal to zero
; the operand is -. The operand is then applied to a and b