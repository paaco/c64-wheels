# c64-wheels

Wheels will be game where you drive a man sitting on a single wheel across a racing parcour. Kinda like Kikstart.

### Assets

Assets are drawn in Aseprite and saved as .png file. Custom converter Sprite2asm converts the png file based on instructions in the filename:

    -bgX specifies background color (defaults to transparent color index) and forces hires
    -mcXX specifies multicolor 1 and 2 and forces multi color

Note that multicolors bits are different for sprites and character sets, so mapping goes slightly different:

        bits    00        01         10         11
    sprites     BG:$D021  MC1:$D025  $D027+     MC2:$D026
    chars       BG:$D021  MC1:$D022  MC2:$D023  $D800+

Sprites will always cover character/bitmap bits 00 and 01 (bit 0 for hires). However, bits 10 and 11 (bit 1 for hires) will cover sprites with 'lower' priority, i.e. their bit is set to 1 in $D01B.

### TODO

* specify -chXX to generate characters instead of sprites (XX=offset)
* script exporting assets with asesprite to .png files
* script converting all .png files to .asm
* exomizer .prg (first showing the logo, decrunching a few seconds and moving logo to top would be cool)