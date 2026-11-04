.ifndef PUSH_TO_QUEUE_INC
    PUSH_TO_QUEUE_INC = 1
    .macro push_to_queue addrhi,addrlo,value
    .local check_if_full, push_value, end
        check_if_full:
            LDX sizeof_queue
            CPX #MAX_QUEUE_SIZE
            BEQ end

        push_value:
            ; Store values in queue.
            LDA addrhi
            STA queue_hibyte,X
            LDA addrlo
            STA queue_lobyte,X
            LDA value
            STA queue_pattern,X
            ; Bump the amount of items in queue
            INC sizeof_queue
        end:
    .endmacro
.endif