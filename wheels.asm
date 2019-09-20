;
; wheels
;

    * = $0801
    !byte $0c,$08,$b5,$07,$9e,$20,$32,$30,$36,$32,$00,$00,$00
start:
        ldx #0
.loop_logo:
        lda logo_charmap,x
        sta $0400,x
        lda #$08 ; black mc
        sta $D800,x
        inx
        cpx #200
        bne .loop_logo
        ldx #0
.loop_fill:
        lda #7
        sta $0400+200,x
        sta $0500+200,x
        sta $0600+200,x
        lda #$08 ; black mc
        sta $D800+200,x
        sta $D900+200,x
        sta $DA00+200,x
        inx
        bne .loop_fill

        ; select charset at $2000
        lda $D018
        and #$F0
        ora #$08 ; $2000
        sta $D018

        ; select multicolor and set colors
        lda $D016
        ora #$10
        sta $D016

        lda #$00
        sta $D020
        lda #$0B
        sta $D021
        lda #$09
        sta $D022
        lda #$08
        sta $D023
        rts

logo_charmap:
    !source "generated/wheels-charmap.inc"

    * = $2000
    !source "generated/wheels-charset.inc"

    !align 63, 0
sprites:
SPRITE_OFFSET = (sprites and $3FFF) >> 6
    !source "generated/sprites.inc"
