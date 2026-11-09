; PPU
PPUCTRL             = $2000
PPUMASK             = $2001
PPUSTATUS           = $2002
OAMADDR             = $2003
OAMDATA             = $2004
PPUSCROLL           = $2005
PPUADDR             = $2006
PPUDATA             = $2007
OAMDMA              = $4014
DEFAULT_PPUCTRL     = $80
DEFAULT_PPUMASK     = $1C

; Tiles 00-03 are for the display.
; $04-$0D are for numbers 0-9
NUM_SPRITE_OFFSET   = $04
; $0E-$29 are for letters A-Z
LTR_SPRITE_OFFSET   = $0E

; APU
CHANNEL_SETTINGS    = $4015

PULSE_1_SETTINGS    = $4000
PULSE_1_SWEEP       = $4001
PULSE_1_NOTE_LO     = $4002
PULSE_1_NOTE_HI     = $4003

PULSE_2_SETTINGS    = $4004
PULSE_2_SWEEP       = $4005
PULSE_2_NOTE_LO     = $4006
PULSE_2_NOTE_HI     = $4007

TRIANGLE_COUNTER    = $4008
TRIANGLE_NOTE_LO    = $400A
TRIANGLE_NOTE_HI    = $400B
TRIANGLE_UNMUTE     = $4017

NOISE_ENVELOPE      = $400C
NOISE_MODE          = $400E
NOISE_LENGTH        = $400F

MOVE_SOUND_AUDIBLE  = %10110011
MOVE_SOUND_SILENT   = %10110000

PERIOD_TABLE_SIZE   = $34

; ANT
; Directions:
ANT_DIR_UP          = $01
ANT_DIR_LEFT        = $02
ANT_DIR_DOWN        = $03
ANT_DIR_RIGHT       = $04
ANT_SPEED           = $04

; Spawn:
ANT_SPAWN_X         = $10
ANT_SPAWN_Y         = $0F

; Screen Constants
SCREEN_MAX_X        = $1F
SCREEN_MAX_Y        = $1D

PATTERN_CELL_EMPTY  = $00
PATTERN_CELL_FILLED = $01
PATTERN_CELL_ANT    = $02

PALETTE_CELL_EMPTY  = $0F
PALETTE_CELL_FILLED = $2A 
PALETTE_CELL_ANT    = $27

; Movement Queue
MAX_QUEUE_SIZE      = $04  ; realistically we only need 2 but its better to have 4 just in case
