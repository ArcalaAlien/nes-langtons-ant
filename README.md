# nes-langtons-ant
An implementation of a Langton's Ant turing machine made in 6502 ASM for ca65.
 This was a pretty neat learning experience for me!
 
 I learned:
  * Grid-based math like row and column-major order.
  * How the NES PPU handles background tile rendering.
  * How to create an NMI handshake to send PPU updates during VBlank
  * How to create a queue from scratch in assembly
  * How to use macros to create easily reusable "functions"
  * How to create a reusable cell-based grid system

To build this project you will need cc65 and developers tools installed.
