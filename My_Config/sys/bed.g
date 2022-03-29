; bed.g
; called to perform automatic bed compensation via G32

M290 R0 S0 ; clear baby stepping
M561       ; clear any bed transform
M400       ; finish all moves, clear the buffer

G28        ; home all

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
G0 X150 Y150 F7200

G28 Z     ; rehome Z as the absolute height of the z plane may have shifted
G29 S1    ; load saved mesh
