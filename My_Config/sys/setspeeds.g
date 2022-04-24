; setspeeds.g
; called to set speed and acceleration

M566 X400.00 Y400.00 Z6.00 E120.00 P1      ; set maximum instantaneous speed changes (mm/min) and jerk policy
M203 X15000.00 Y15000.00 Z1000.00 E3600.00 ; set maximum speeds (mm/min)
M201 X3000.00 Y3000.00 Z100.00 E3600.00    ; set accelerations (mm/s^2)