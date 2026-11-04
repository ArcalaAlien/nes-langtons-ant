; Fills an entire page of ram,
; clobbers A and X
.ifndef FILL_RAM_PG_INC
    FILL_RAM_PG_INC = $01
    .macro fill_ram_pg page,value
    .local loop
        LDX #$00
        LDA value
        loop:
            STA page,X
            INX
            BNE loop
    .endmacro
.endif