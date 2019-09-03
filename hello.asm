; Hello world via vs64

* = $0801
    !word $080a
	!word 2019
	!byte $9e ; SYS
	!raw "2071:"
    !byte $8f ; REM
    !raw " VICIOUS"
	!byte 0,0,0

main:
        ldy #0
.loop:  lda hello,y
        beq .done
        jsr $ffd2
        iny
        bne .loop
.done   rts

hello:
    !pet "hello world!",0
