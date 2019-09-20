@echo off

@rem logo
@rem TODO export with correct 2:1 ratio, now not possible!
@rem call aseprite -b assets\wheels.ase --save-as generated\wheels-bgb-mc98.png
@rem TODO java Sprite2asm generated\wheels-bgb-mc98.png saves wheels-charmap.inc and wheels-charset.inc

@rem sprites
call aseprite -b --split-layers assets\sprites.ase --data NUL --sheet generated\sprites.png
@rem TODO java Sprite2asm
