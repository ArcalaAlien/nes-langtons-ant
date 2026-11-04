.ifndef RESET_VECTOR_INC
    RESET_VECTOR_INC = 1
    RESET_VECTOR:
        SEI         ; Disable IRQs
        CLD         ; Get rid of decimal mode
        LDX #$40    
        STX $4017   ; Set interrupt inhibitor bit in APU frame counter on
        LDX #$ff    ; Initialise stack
        TXS 
        INX 
        STX PPUCTRL ; Disable NMI
        STX PPUMASK ; Disable rendering
        STX OAMDMA  ; Disable DMC IRQs

        vblank_wait

        ; clear OAM
        fill_ram_pg $0200,#$FE
        TXA
        @clear_ram:
            STA $0000,X
            STA $0100,X
            STA $0300,X
            STA $0400,X
            STA $0500,X
            STA $0600,X
            STA $0700,X
            INX
            BNE @clear_ram

        vblank_wait

        ; Clearing the nametables.
        LDA PPUSTATUS
        LDA #$20
        STA PPUADDR
        LDA #$00
        STA PPUADDR

        LDX #$08
        LDY #$00
        LDA #PATTERN_CELL_EMPTY

        @clear_nametables:
            STA PPUDATA
            DEY
            BNE @clear_nametables
            DEX
            BNE @clear_nametables

        @load_palettes:
            ; Setting up our palette
            LDA PPUSTATUS
            LDA #$3F
            STA PPUADDR
            LDA #$00
            STA PPUADDR

            LDX #$00
            @palette_loop:
                LDA #PALETTE_CELL_EMPTY
                STA PPUDATA
                LDA #PALETTE_CELL_FILLED
                STA PPUDATA
                LDA #PALETTE_CELL_ANT
                STA PPUDATA
                LDA #PALETTE_CELL_EMPTY
                STA PPUDATA

                INX
                CPX #08
                BNE @palette_loop

        vblank_wait

        LDA PPUSTATUS
        LDA #$00
        STA PPUADDR
        STA PPUADDR

        @set_defaults:
            LDA #ANT_SPAWN_X
            STA ant_pos_x
            LDA #ANT_SPAWN_Y
            STA ant_pos_y

            LDA #ANT_DIR_UP
            STA ant_dir

            get_ppu_addr    ANT_SPAWN_X,ANT_SPAWN_Y
            push_to_queue   ccell_ppuaddr_hi,ccell_ppuaddr_lo,#PATTERN_CELL_ANT

            LDA #$00
            STA frame_count

        LDA #DEFAULT_PPUCTRL
        STA PPUCTRL
        LDA #DEFAULT_PPUMASK
        STA PPUMASK
        
        LDA #$01
        STA flush_nmi

        JMP main
    ;end of reset vector
.endif