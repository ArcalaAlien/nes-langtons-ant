.ifndef BSS_INC
    BSS_INC = 1
    .segment "BSS"
    .export ram_grid
        ; This is our grid.
        ; 2 bits per tile.
        ; 00 - Empty Cell
        ; 01 - Filled Cell
        ; 10 - Ant
        ram_grid:
            .res 240

        ; This is the update queue
        queue_hibyte:
            .res MAX_QUEUE_SIZE

        queue_lobyte:
            .res MAX_QUEUE_SIZE

        queue_pattern:
            .res MAX_QUEUE_SIZE
.endif