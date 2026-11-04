.ifndef FLIP_CELL_INC
    FLIP_CELL_INC = 1
    .macro flip_cell cell_x,cell_y,cur_cell_state
    .local fill_cell, end
        LDA cur_cell_state
        BEQ fill_cell

        set_cell_state cell_x,cell_y,#PATTERN_CELL_EMPTY
        JMP end

        fill_cell:
            set_cell_state cell_x,cell_y,#PATTERN_CELL_FILLED
        
        end:
    .endmacro
.endif