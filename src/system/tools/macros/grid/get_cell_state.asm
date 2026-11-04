.ifndef GET_CELL_STATE_INC
    GET_CELL_STATE_INC = 1

    .macro get_cell_state coord_x,coord_y
    .local shift_loop, store_state
        ; First we should get the byte_idx
        get_byte_idx coord_x,coord_y

        ; now we can get the slot for the byte
        get_byte_slot coord_x

        LDX byte_idx
        LDY byte_slot
        LDA ram_grid,X

        CPY #$00
        BEQ store_state
        shift_loop:
            ; shift twice each time since each tile
            ; is 2 bits
            LSR
            LSR
            DEY
            BNE shift_loop

        store_state:
            AND #%00000011
            STA cell_state
    .endmacro
.endif