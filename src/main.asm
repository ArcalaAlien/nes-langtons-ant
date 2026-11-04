.include "INCLUDES.inc"

.segment "CODE"
    main:
        LDA frame_count
        CMP #ANT_SPEED
        BCC waiting

        LDA #$00
        STA frame_count
        JSR handle_ant

        LDA #$01
        STA flush_nmi

    waiting:
        LDA flush_nmi
        BEQ main
        JMP waiting