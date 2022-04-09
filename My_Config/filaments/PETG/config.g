; filament specific config; this file will run whenever the job file calls M703

M302 S220 R220         ; do not allow extrusion(s) below 220 or retraction(r) below 220
M207 S1.20 F2400 T2400 ; set h/w retract values for G10/G11 command
M290 S0.05             ; babystep the head up 0.05 mm
M572 D0 S0.08          ; set pressure advance
