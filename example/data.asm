#import "../.ra/deps/ggramlich/kickass-run-length-encoding/lib/rle-global.asm"

*= $2000 "Characters" // Add character data at the $2000 memory location
.import binary "binary/commodore-chars.bin"

*=$3080 "ScreenMap"
screenmap:
// Use rle_import function instead of .import binary
//.import binary "binary/commodore-screen.bin"
rle_import("binary/commodore-screen.bin")

.segment Default "ColorMap"

colormap:
.import binary "binary/commodore-colors.bin"
