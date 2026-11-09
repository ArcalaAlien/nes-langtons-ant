.ifndef GENERATE_NUMBER_INC
    GENERATE_NUMBER_INC = 1

    gen_prnd_number:
        LDY #$08
        LDA rng_seed+0
        @shift_loop:
            ASL ; Shift the register
            ROL rng_seed+1 ; Rotate the bit into the high byte
            BCC @dec_y
            ; On carry set
            ; Apply XOR
            EOR #$39

            @dec_y:
                DEY
                BNE @shift_loop
                STA rng_seed+0
                CMP #$00
        RTS
.endif