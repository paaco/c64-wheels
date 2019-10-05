;
; wheels
;

    * = $0801
    !byte $0c,$08,$b5,$07,$9e,$20,$32,$30,$36,$32,$00,$00,$00
start:
        ldx #0
        clc
.loop_logo:
        lda logo_charmap,x
        adc #64 ; font eerst
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

        ; sprites
        I_PILOT = 0
        I_WHEEL = 2
        lda #100 ; x
        sta $D000 + 2*(I_PILOT)
        sta $D000 + 2*(I_PILOT+1)
        sta $D000 + 2*(I_WHEEL)
        sta $D000 + 2*(I_WHEEL+1)
        lda #100 ; y pilot
        sta $D001 + 2*(I_PILOT)
        sta $D001 + 2*(I_PILOT+1)
        clc
        adc #17 ; y wheel
        sta $D001 + 2*(I_WHEEL)
        sta $D001 + 2*(I_WHEEL+1)
        lda #1 ; detail color
        sta $D027 + I_PILOT
        lda #2 ; pilot color
        sta $D027 + I_PILOT+1
        lda #11 ; detail color
        sta $D027 + I_WHEEL
        lda #15 ; wheel color
        sta $D027 + I_WHEEL+1
        lda #SPRITE_OFFSET+7 ; pilot detail image
        sta $07F8 + I_PILOT
        lda #SPRITE_OFFSET ; pilot image
        sta $07F8 + I_PILOT+1
        lda #SPRITE_OFFSET+8 ; wheel detail image
        sta $07F8 + I_WHEEL
        lda #SPRITE_OFFSET+1 ; wheel image
        sta $07F8 + I_WHEEL+1
        ; enable sprites
        lda #%00001111
        sta $D015
        rts

logo_charmap:
    !source "generated/wheels-charmap.inc"

    * = $2000
    !binary "assets/chargen-a500topaz8V2.rom", 64*8
    !source "generated/wheels-charset.inc"

    !align 63, 0
sprites:
SPRITE_OFFSET = (sprites and $3FFF) >> 6
    !source "generated/sprites.inc"
sprites_glimmer:
SPRITE_OFFSET_GLIMMER = (sprites_glimmer and $3FFF) >> 6
    !source "generated/glimmer.inc"
