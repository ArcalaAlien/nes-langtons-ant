; ANT MOVEMENT RULES:
; Ant only moves one space forward at a time
; Ant only moves after X frames
;
; If the square below the ant is EMPTY:
;   The ant turns 90deg clockwise,
;   fills the square and moves forward
;
; If the square below the ant is FILLED:
;   The ant turns 90deg counterclockwise 
;   empties the square and moves forward
.ifndef TURN_ANT_INC
    TURN_ANT_INC = 1
    turn_ant:
        ; Grab cell state
        get_cell_state ant_pos_x,ant_pos_y
        LDA cell_state

        ; check if we're empty
        CMP #PATTERN_CELL_EMPTY
        BEQ @turn_clockwise
        
        ; Check if we're full.
        CMP #PATTERN_CELL_FILLED
        BEQ @turn_counterclockwise

        JMP @end

        @turn_clockwise: ; ant_dir-- 
            LDA ant_dir
            CMP #ANT_DIR_UP
            BEQ @set_right

            DEC ant_dir
            JMP @end

            @set_right:
                LDA #ANT_DIR_RIGHT
                STA ant_dir
                JMP @end

        @turn_counterclockwise: ; ant_dir++
            LDA ant_dir
            CMP #ANT_DIR_RIGHT
            BEQ @set_up

            INC ant_dir
            JMP @end

            @set_up:
                LDA #ANT_DIR_UP
                STA ant_dir

        @end:
            RTS
.endif