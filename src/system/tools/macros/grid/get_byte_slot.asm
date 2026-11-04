.ifndef GET_BYTE_SLOT_INC
    GET_BYTE_SLOT_INC = 1
    .macro get_byte_slot coord_x
        LDA coord_x
        AND #%00000011 ; Mask of 3 to get the quadrant
        STA byte_slot
    .endmacro
.endif