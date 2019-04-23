;This is based on KingMike's Ys 3 DTE tutorial on RHDN.
;I've changed the values as appropriate for MT2.
ORG $3F681

Start:
LDA $F0 ;Load RAM byte into A
CMP #$00
BNE 2ndTime ;Jump if byte !=0.

LDY #$00
LDA ($AB),Y ;Read byte of script data
CMP #$7F ;Is it greater than 0x7F
BPL NextCheck

Abort: ;If equal or less than 7F
LDA ($AB),Y ;Reload original value
RTS ;Back we go

NextCheck: ;Now to define the other end
LDA ($AB),Y
CMP #$BF ;Compare with BF
BPL Abort ;If greater, back we go

INC $F0 ;increase ram byte, serves as DTE usage flag
LDA ($AB),Y
SEC
SBC #$80 ;Take away lowest DTE value
ASL A ;In layman's terms, double A
TAX ;Transfer A to X
LDA DTETblOffset,X ;Read byte of table
RTS ;Back we go

2ndTime:
DEC $F0 ;decrease ram byte, DTE flag cleared
DEC $AB ;decrease script pointer
LDA $AB ;load it back in
CMP #$FF ;underflow protection
BNE $02 ;skip ahead
DEC $AC ;fix any errors
LDY #$00
LDA ($AB),Y
SEC
SBC #$80 ;Take away lowest DTE value
ASL A ;In layman's terms, double A
TAX ;Transfer A to X
LDA DTETblOffset+1,X ;Read byte of table
RTS ;And we're done

DTETblOffset:
