; bed.g
; Perform automatic bed compensation via G32

M290 R0 S0      ; Clear baby stepping
M561            ; Clear any bed transform
M400            ; Finish all moves, clear the buffer

G28             ; Home all

; Calibrate bed
while true
  if iterations = 5
    abort "Auto calibration repeated attempts ended, final deviation", move.calibration.final.deviation ^ "mm"
  G30 P0 X20 Y20 Z-99999 ; Probe near a leadscrew
  if result != 0
    continue
  G30 P1 X150 Y280 Z-99999 ; Probe near a leadscrew
  if result != 0
    continue
  G30 P2 X280 Y20 Z-99999 S3 ; Probe near a leadscrew and calibrate 3 motors
  if result != 0
    continue
  if move.calibration.initial.deviation <= 0.01
    break
  echo "Repeating calibration because deviation is too high (" ^ move.calibration.initial.deviation ^ "mm)"
; End loop

echo "Auto calibration successful, deviation", move.calibration.final.deviation ^ "mm"
G0 X150 Y150 F18000

G28 Z                     ; Rehome Z as the absolute height of the Z plane may have shifted
G29 S1                    ; Load saved mesh
