.ifndef GET_PPU_ADDRESS_INC
    GET_PPU_ADDRESS_INC = 1

    ; PPUADDR = Cell ID formula
    ; (y*32) + x

    ; $2000
    ;
    ; 
    .macro get_ppu_addr coord_x,coord_y
        ; Set up the hibyte of our ppu address
        ; $20 + (y/8)
        ; divide coord_y by 8
        ; to finish the hibyte
        ; and rotate out bits
        ; to build the lobyte
        LDA coord_y
        LSR
        ROR ccell_ppuaddr_lo
        LSR
        ROR ccell_ppuaddr_lo
        LSR
        ROR ccell_ppuaddr_lo
        ORA #$20
        STA ccell_ppuaddr_hi

        LDA ccell_ppuaddr_lo
        ORA coord_x
        STA ccell_ppuaddr_lo
    .endmacro
.endif