.ifndef NMI_VECTOR_INC
    NMI_VECTOR_INC = 1
    
    NMI_VECTOR:
        PHA
        TXA
        PHA
        TYA
        PHA

        LDA sound_playing
        BEQ @check_flush

        LDA #$00
        STA sound_playing
    @check_flush:
        LDA flush_nmi
        BEQ @end

        JSR render_grid
        JSR play_move_sound

        LDA #$00
        STA flush_nmi
    @end:
        INC frame_count

        LDA #$00
        STA PPUSCROLL
        STA PPUSCROLL

        LDA #DEFAULT_PPUCTRL
        STA PPUCTRL
    @restore:
        PLA
        TAY
        PLA
        TAX
        PLA
        RTI
.endif