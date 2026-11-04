.ifndef SET_ANT_POSITION_INC
    SET_ANT_POSITION_INC = 1
    .macro set_ant_pos ant_x_ptr,ant_y_ptr,value_x,value_y
        LDA value_x
        STA ant_x_ptr

        LDA value_y
        STA ant_y_ptr
    .endmacro
.endif