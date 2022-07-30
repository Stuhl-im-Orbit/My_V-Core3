; setspeeds.g
; called to set speed and acceleration

M566 X600.00 Y600.00 Z6.00 E120.00 P1      ; set maximum instantaneous speed changes (mm/min) and jerk policy
M203 X30000.00 Y30000.00 Z1200.00 E2400.00 ; set maximum speeds (mm/min)
M201 X5000.00 Y5000.00 Z100.00 E3600.00    ; set accelerations (mm/s^2)