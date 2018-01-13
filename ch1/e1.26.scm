; Replacing the square procedure with explicit multiplication, Louis Reasoner
; has given the computer more work to do. The exmod function will have to be 
; evaluated twice whereas if it was passed in the square function it would have
; only been called once, as per applicative-order evaluation.