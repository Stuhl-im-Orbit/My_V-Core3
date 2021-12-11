; resume.g
; called before a print from SD card is resumed

G1 R1 X0 Y0 Z5 F1800 ; go to 5mm above position of the last print move
G1 R1 X0 Y0 Z0       ; go back to the last print move
M83                  ; relative extruder moves
M121                 ; recover the last state pushed onto the stack
