*= $0801 "Basic Loader"
BasicUpstart2(mainInit)

#import "../.ra/deps/ggramlich/kickass-run-length-encoding/lib/rle-global.asm"

.label SCROLY       = $D011
.label SCROLX       = $D016
.label VMCSB        = $D018
.label EXTCOL       = $D020
.label BGCOL0       = $D021
.label BGCOL1       = $D022
.label BGCOL2       = $D023

.label CharacterSlot2000 = $08 // $2000 hex,  8192 decimal

mainInit:
    lda VMCSB 
    and #%11110001          // Clear bits 1-3
    ora #CharacterSlot2000  // Set bits 1-3 with the requested slot
    sta VMCSB

    // Enable Multicolor
    lda SCROLX
    ora #%00010000  // Set bit 4
    sta SCROLX

    /* sample image uses only 3 colors in multicolor mode */
    /* multicolor RED ($0a) is encoded in commodore-colors.bin per character */
    lda #WHITE
    sta EXTCOL  // border color
    sta BGCOL0  // background color

    lda #BLUE
    sta BGCOL1  // Color 1
    // lda #GRAY
    // sta BGCOL2  // Color 2 not needed for sample image

rle_decode_charpad(screenmap, colormap)

loop:
    jmp loop

#import "../example/data.asm"
