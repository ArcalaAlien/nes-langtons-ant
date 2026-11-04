.ifndef RENDER_GRID_INC
    RENDER_GRID_INC = 1
    render_grid:
        ; Clear the address latch
        LDA PPUSTATUS
        LDA sizeof_queue
        BEQ @end

        LDX #$00
        @update_from_queue:    
            ; Get the ppu hi address byte
            LDA queue_hibyte,X
            STA PPUADDR

            ; Get the ppu lo address byte
            LDA queue_lobyte,X
            STA PPUADDR

            ; Grab the tile we're going to store
            LDA queue_pattern,X
            STA PPUDATA

            ; We've pulled something from the queue.
            DEC sizeof_queue
            INX

            ; Move to the next index
            ; If we've already processed all updates
            ; we can stop.
            LDA sizeof_queue
            BNE @update_from_queue

        @end:
            RTS
.endif