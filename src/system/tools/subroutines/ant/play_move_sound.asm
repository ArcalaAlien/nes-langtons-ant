.ifndef PLAY_MOVE_SOUND_INC
    PLAY_MOVE_SOUND_INC = 1

    play_move_sound:
        @regen_number:
            JSR gen_prnd_number
            AND #$7F ; Keep it within the bounds of the period table
            CMP #PERIOD_TABLE_SIZE
            BCS @regen_number ; If for some reason we have a larger number
                              ; Than the length of the period table
                              ; We have to regenerate the number

        ; Now that we have an index into the period table
        ; we can send a note to the APU
        TAX
        LDA period_table_hi,X
        STA PULSE_1_NOTE_HI
        LDA period_table_lo,X
        STA PULSE_1_NOTE_LO

        ; Make the note audible!
        LDA MOVE_SOUND_AUDIBLE
        STA PULSE_1_SETTINGS

        LDA #$FF
        STA sound_playing

        RTS
.endif