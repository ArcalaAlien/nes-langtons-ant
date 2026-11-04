.ifndef GET_BYTE_IDX_INC
    GET_BYTE_IDX_INC = 1
    .macro get_byte_idx coord_x,coord_y
        ; Load y, multiply by 8
        LDA coord_y
        ASL
        ASL
        ASL

        ; Store it in the index variable
        STA byte_idx
        
        ; Load x, divide by 4
        LDA coord_x
        LSR
        LSR
        
        ; Add y*8 to x/4
        CLC
        ADC byte_idx

        ; Store index
        STA byte_idx
    .endmacro
.endif