; filament specific config; this file will run whenever the job file calls M703

M207 S1.50 F1500 T1500 Z0.0 ; set h/w retract values for G10/G11 command
M290 S0.00                  ; babystep the head up 0.00 mm
M572 D0 S0.05               ; set pressure advance