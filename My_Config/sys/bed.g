; bed.g
; called to perform automatic bed compensation via G32

M290 R0 S0                ; clear baby stepping
M561                      ; clear any bed transform
M400                      ; finish all moves, clear the buffer

if !move.axes[0].homed or !move.axes[1].homed or !move.axes[2].homed
  echo "not all axes homed, homing axes first"
  G28

; BLTouch
M280 P0 S160              ; precautionary alarm release
M280 P0 S90               ; ensure the pin is raised

; calibrate bed
while true
  if iterations = 5
    abort "Auto calibration repeated attempts ended, final deviation", move.calibration.final.deviation ^ "mm"
  G30 P0 X5 Y5 Z-99999 ; probe near a leadscrew
  if result != 0
    continue
  G30 P1 X150 Y285 Z-99999 ; probe near a leadscrew
  if result != 0
    continue
  G30 P2 X270 Y5 Z-99999 S3 ; probe near a leadscrew and calibrate 3 motors
  if result != 0
    continue
  if move.calibration.initial.deviation <= 0.01
    break
  echo "Repeating calibration because deviation is too high (" ^ move.calibration.initial.deviation ^ "mm)"
; end loop
echo "Auto calibration successful, deviation", move.calibration.final.deviation ^ "mm"
G0 X150 Y150 Z10 F3600

G28 Z                      ; rehome Z as the absolute height of the z plane may have shifted
G29 S1                     ; load saved mesh
