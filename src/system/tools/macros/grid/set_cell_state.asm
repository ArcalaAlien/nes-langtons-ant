.ifndef SET_CELL_STATE_INC
    SET_CELL_STATE_INC = 1
    .macro set_cell_state coord_x,coord_y,new_state
    .local clear_tile_state, shift_new_state, push_update
        get_byte_idx coord_x,coord_y
        get_byte_slot coord_x

        LDX byte_idx    ; What byte in ram is this cell?
        LDY byte_slot   ; What quadrant are we looking for?
        LDA ram_grid,X  ; Loading the byte from ram

        clear_tile_state:
            AND tile_masks,Y ; AND the byte we got from ram
            STA temp_byte 
        
        LDA new_state
        STA cell_state
        AND #%00000011
        CPY #$00
        BEQ push_update
        shift_new_state:    ; Move the state over
            ASL             ; depending on what slot
            ASL             ; we need to store it in
            DEY
            BNE shift_new_state
        
        push_update:
            ORA temp_byte   ; Now we combine it back with  
                            ; the byte we got from ram
            STA ram_grid,X  ; and store it again
    .endmacro
.endif