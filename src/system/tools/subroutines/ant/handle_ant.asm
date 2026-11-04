.ifndef ANT_HANDLER_INC
    ANT_HANDLER_INC = 1
    handle_ant:
        JSR turn_ant
        flip_cell ant_pos_x,ant_pos_y,cell_state
        JSR move_ant
        
        ; Get the PPU address from the previous cell
        JSR reset_ppu_addr_bytes
        get_ppu_addr prev_pos_x,prev_pos_y
        LDA ccell_ppuaddr_hi
        STA pcell_ppuaddr_hi
        LDA ccell_ppuaddr_lo
        STA pcell_ppuaddr_lo
        
        ; Now get the updates from the current cell
        JSR reset_ppu_addr_bytes
        get_ppu_addr ant_pos_x,ant_pos_y

        push_to_queue pcell_ppuaddr_hi,pcell_ppuaddr_lo,cell_state
        push_to_queue ccell_ppuaddr_hi,ccell_ppuaddr_lo,#PATTERN_CELL_ANT

        RTS

        reset_ppu_addr_bytes:
            LDA #$00
            STA ccell_ppuaddr_hi
            STA ccell_ppuaddr_lo
            RTS
.endif