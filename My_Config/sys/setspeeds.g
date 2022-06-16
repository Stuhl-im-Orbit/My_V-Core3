; setspeeds.g
; called to set speed and acceleration

M566 X400.00 Y400.00 Z6.00 E120.00 P1      ; set maximum instantaneous speed changes (mm/min) and jerk policy
M203 X30000.00 Y30000.00 Z1200.00 E3600.00 ; set maximum speeds (mm/min)
M201 X4000.00 Y4000.00 Z100.00 E3600.00    ; set accelerations (mm/s^2)