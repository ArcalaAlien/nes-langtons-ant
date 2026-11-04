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