.ifndef MOVE_ANT_INC
    MOVE_ANT_INC = 1

    ; ant_pos hibyte is X
    ; ant_pos lobyte is Y
    ; x++ moves right
    ; x-- moves left
    ; y++ moves up
    ; y-- moves down
    move_ant:
        LDA ant_pos_x
        STA prev_pos_x
        LDA ant_pos_y
        STA prev_pos_y

        LDA ant_dir
        CMP #ANT_DIR_UP
        BEQ @move_up

        CMP #ANT_DIR_LEFT
        BEQ @move_left

        CMP #ANT_DIR_DOWN
        BEQ @move_down

        CMP #ANT_DIR_RIGHT
        BEQ @move_right

        @move_up:
            LDA ant_pos_y
            BEQ @wrap_to_bottom

            DEC ant_pos_y
            JMP @end

            @wrap_to_bottom:
                set_ant_pos ant_pos_x,ant_pos_y,ant_pos_x,#SCREEN_MAX_Y
                JMP @end

        @move_left:
            LDA ant_pos_x
            BEQ @wrap_to_right

            DEC ant_pos_x
            JMP @end

            @wrap_to_right:
                set_ant_pos ant_pos_x,ant_pos_y,#SCREEN_MAX_X,ant_pos_y
                JMP @end

        @move_down:
            LDA ant_pos_y
            CMP #SCREEN_MAX_Y
            BEQ @wrap_to_top

            INC ant_pos_y
            JMP @end

            @wrap_to_top:
                set_ant_pos ant_pos_x,ant_pos_y,ant_pos_x,#$00
                JMP @end

        @move_right:
            LDA ant_pos_x
            CMP #SCREEN_MAX_X
            BEQ @wrap_to_left

            INC ant_pos_x
            JMP @end

            @wrap_to_left:
                set_ant_pos ant_pos_x,ant_pos_y,#$00,ant_pos_y
                JMP @end

        @end:
            RTS
.endif