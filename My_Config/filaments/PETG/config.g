; filament specific config; this file will run whenever the job file calls M703

M207 S1.20 F2400 T2400 ; set h/w retract values for G10/G11 command
M290 S0.05             ; babystep the head up 0.05 mm
M572 D0 S0.05          ; set pressure advance