; setspeeds.g
; Called to set speed and acceleration parameters

M566 X300.00 Y300.00 Z24.00 E300.00 P1 ; Set allowable instantaneous speed change (mm/min) and jerk policy
M203 X24000.00 Y24000.00 Z900.00 E7200 ; Set maximum speeds (mm/min)
M201 X5000.00 Y5000.00 Z100.00 E10000  ; Set accelerations (mm/s^2)
M204 P4000 T5000                       ; Set printing and travel acceleration (mm/s^2)
