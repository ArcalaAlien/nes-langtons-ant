.segment "ZEROPAGE"
.exportzp ant_pos_x, ant_pos_y, ant_dir
.exportzp prev_pos_x, prev_pos_y
.exportzp temp_byte, byte_idx, byte_slot, cell_id_hi, cell_id_lo
.exportzp ccell_ppuaddr_hi, ccell_ppuaddr_lo, pcell_ppuaddr_hi, pcell_ppuaddr_lo
.exportzp cell_state, prev_cell_state
.exportzp sizeof_queue
.exportzp frame_count, flush_nmi
    ; ant stuff
    ant_pos_x:
        .res 1
    
    ant_pos_y:
        .res 1

    prev_pos_x:
        .res 1

    prev_pos_y:
        .res 1

    ant_dir: 
        .res 1

    ; used for accessing cells in the ram grid.
    byte_idx:
        .res 1

    byte_slot:
        .res 1

    temp_byte:
        .res 1
    
    cell_id_hi:
        .res 1

    cell_id_lo:
        .res 1

    ccell_ppuaddr_lo:
        .res 1

    ccell_ppuaddr_hi:
        .res 1

    pcell_ppuaddr_lo:
        .res 1

    pcell_ppuaddr_hi:
        .res 1

    ; keeping track of cell states
    cell_state: 
        .res 1

    prev_cell_state: 
        .res 1

    ; current items in update queue
    sizeof_queue:
        .res 1

    ; counting frames
    frame_count: 
        .res 1

    flush_nmi:
        .res 1