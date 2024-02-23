; stop.g
; Called when M0 (Stop) is run (e.g. when a print from SD card is cancelled)

M98 P"cancel.g"  ; Execute cancel.g macro - stopping a print is essentially canceling it.