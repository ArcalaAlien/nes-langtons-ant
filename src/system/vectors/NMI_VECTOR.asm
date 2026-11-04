.ifndef NMI_VECTOR_INC
    NMI_VECTOR_INC = 1
    
    NMI_VECTOR:
        PHA
        TXA
        PHA
        TYA
        PHA

        LDA flush_nmi
        BEQ @end

        JSR render_grid

        LDA #$00
        STA flush_nmi
    @end:
        INC frame_count

        LDA #$00
        STA PPUSCROLL
        STA PPUSCROLL

        LDA #DEFAULT_PPUCTRL
        STA PPUCTRL

        PLA
        TAY
        PLA
        TAX
        PLA
        RTI
.endif