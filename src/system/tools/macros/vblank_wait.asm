.ifndef VBLANK_WAIT_INC
    VBLANK_WAIT_INC = 1
    .macro vblank_wait
        .local wait_for_vblank
        
        wait_for_vblank:
            LDA PPUSTATUS
            BPL wait_for_vblank
    .endmacro
.endif
