;This is based on KingMike's Ys 3 DTE tutorial on RHDN.
;I've changed the values as appropriate for MT2.

ORG $F671

Start:
LDA $F0 ;Load RAM byte into A
CMP #$00
BNE SecondTime ;Jump if byte !=0.

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

SecondTime:
DEC $F0 ;decrease ram byte, DTE flag cleared
DEC $AB ;decrease script pointer
DEC $0707 ;because there's another pointer? messing around here
LDA $AB ;load it back in
CMP #$FF ;underflow protection
BNE NoUnderflow ;skip ahead
DEC $AC ;fix any errors
DEC $0808 ;two pointer experiment
NoUnderflow:
LDY #$00
LDA ($AB),Y
SEC
SBC #$80 ;Take away lowest DTE value
ASL A ;In layman's terms, double A
TAX ;Transfer A to X
LDA DTETblOffset+1,X ;Read byte of table
RTS ;And we're done

DTETblOffset:
HEX 0F07 0F08 0F09 0F0A ;every pair of bytes are the two DTE characters
HEX 0F0B 0F0C 0F0D 0F0E ;see table file when actually making the table
HEX 0F0F 0F10 0F11 0F12 ;hex values are used as placeholder
HEX 0F13 0F14 0F15 0F16 
HEX 1007 1008 1009 100A 
HEX 100B 100C 100D 100E 
HEX 100F 1010 1011 1012 
HEX 1013 1014 1015 1016 
HEX 1107 1108 1109 110A 
HEX 110B 110C 110D 110E 
HEX 110F 1110 1111 1112 
HEX 1113 1114 1115 1116 
HEX 1207 1208 1209 120A 
HEX 120B 120C 120D 120E 
HEX 120F 1210 1211 1212 
HEX 1213 1214 1215 1216