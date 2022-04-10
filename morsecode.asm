; rogue
; Dec 2020


Main:
call ActivateLED
call SendID


ActivateLED:
ldi r30, $20
ldi r31, $00
out 0x04, r30        ;Change Port B, Pin 5 to output
out 0x05, r31        ;Output 0, Port B, Pin 5
eor r17, r17         ;Clear r17 for use in loops
ret

SendID:
call Break
call Three
call Break
call Five
call Break
call Six
call Break
call Seven
call Break
rjmp SendID

Three:
call Dot
call Dot
call Dot
call Dash
call Dash
ret

Five:
call Dot
call Dot
call Dot
call Dot
call Dot
ret

Six:
call Dash
call Dot
call Dot
call Dot
call Dot

Seven:
call Dash
call Dash
call Dot
call Dot
call Dot


Break:
call Delay
call ClearDelay
call Delay
call ClearDelay
call Delay
call ClearDelay
ret

Dot:
call Delay
call ClearDelay
out 0x05, r30        ;Output 1, Port B, Pin 5
call Delay
call ClearDelay
out 0x05, r31        ;Output 0, Port B, Pin 5
call Delay
call ClearDelay
ret

Dash:
call Delay
call ClearDelay
out 0x05, r30        ;Output 1, Port B, Pin 5
call Delay
call ClearDelay
call Delay
call ClearDelay
out 0x05, r31        ;Output 0, Port B, Pin 5
call Delay
call ClearDelay
ret

ClearDelay:
eor r26, r26
eor r27, r27
ret

Delay:
call OuterLoop
eor r24, r24
eor r25, r25
ldi r27, $01
add r26, r27
cpi r26, $10
brbc 1, Delay
ret


OuterLoop:
call Loop1
call Loop2
Call Loop3
Call Loop4
eor r16, r16
eor r17, r17
eor r18, r18
eor r19, r19
eor r20, r20
eor r21, r21
eor r22, r22
eor r23, r23
ldi r25, $01
add r24, r25
cpi r24, $FF
brbc 1, OuterLoop
ret

Loop1:              ;approx 1000inst
ldi r17, $01
add r16, r17
cpi r16, $FF
brbc 1, Loop1
ret

Loop2:
ldi r19, $01
add r18, r19
cpi r18, $FF
brbc 1, Loop2
ret

Loop3:
ldi r21, $01
add r20, r21
cpi r20, $FF
brbc 1, Loop3
ret

Loop4:
ldi r23, $01
add r22, r23
cpi r22, $FF
brbc 1, Loop4
ret