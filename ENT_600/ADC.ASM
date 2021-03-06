; Generated by holtek-gcc v3.19, Sun Apr 03 15:17:44 2022
; 
; Configuration:
;       without long instruction
;       Single ROM, Single RAM
;       bits_per_rom_unit:14
;       without mp1
;       with tbhp, address(0x9)
;          Use ret-const
;       
;       
;       
; use 'tabrdc' instead of 'tabrd'
;       

#pragma translator "holtek-gcc 4.6.4" "3.19" "build 20130711"
; Rebuild 718

ir equ [0]
mp equ [1]
sbp equ [7]
acc equ [5]
bp equ [7]
status equ [10]
c equ [10].0
ac equ [10].1
z equ [10].2
ov equ [10].3
intc equ [11]

extern ra:byte
extern rb:byte
extern rc:byte
extern rd:byte
extern re:byte
extern rf:byte
extern rg:byte
extern rh:byte
extern _Crom2Prom:near
extern _Crom2PromNext:near

RAMBANK 0 @HCCINIT, @HCCINIT0

RAMBANK 0 @BITDATASEC, @BITDATASEC1
@HCCINIT	.section 'data'
@HCCINIT0	.section 'data'
@BITDATASEC	 .section 'data'
@BITDATASEC1	 .section 'data'

#pragma debug scope 1 1
	extern __DELAY3:near
	extern __DELAYX3:near
	extern __DELAYX6:near
	extern __DELAYY5:near
	extern __DELAYY3:near
	extern _builtin_holtek_delay_2:byte
___sadc0 equ [39]
public _startConversion
#pragma debug scope 2 1
#line 6 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
_startConversion .section 'code'
_startConversion proc
#line 9 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
	set [39].7
#line 10 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
	clr [39].7
	ret
_startConversion endp
#line 10 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
#pragma debug scope 1 1
public _disableADC
#pragma debug scope 3 1
#line 14 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
_disableADC .section 'code'
_disableADC proc
#line 15 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
	clr [39].5
	ret
_disableADC endp
#line 15 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
#pragma debug scope 1 1
public _enableADC
#pragma debug scope 4 1
#line 19 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
_enableADC .section 'code'
_enableADC proc
#line 20 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
	set [39].5
	ret
_enableADC endp
#line 20 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
#pragma debug scope 1 1
public _setADCChannel
#pragma debug scope 5 1
#line 24 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
_setADCChannel .section 'code'
_setADCChannel proc
    local _setADCChannel_2 db 1 dup(?)	; 0,1
	mov _setADCChannel_2[0],a
#pragma debug variable 8 5 _setADCChannel_2+0 "pin"
#line 25 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
	mov a,[39]
	and a,1
	mov ra,a
	mov a,_setADCChannel_2[0]
	orm a,ra
	mov a,1
	andm a,ra
	clr [39].0
	mov a,ra
	orm a,[39]
	ret
_setADCChannel endp
#line 25 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
#pragma debug scope 1 1
___sadc1 equ [40]
public _initADC
#pragma debug scope 6 1
#line 29 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
_initADC .section 'code'
_initADC proc
#line 31 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
	clr [40].5
#line 32 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
	clr [40].6
#line 33 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
	clr [40].7
#line 36 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
	clr [40].4
#line 37 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
	set [40].3
#line 40 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
	clr [40].2
#line 41 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
	set [40].1
#line 42 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
	set [40].0
#line 44 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
	call _disableADC
	ret
_initADC endp
#line 44 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
#pragma debug scope 1 1
___sadoh equ [38]
public _readADC
#pragma debug scope 7 1
#line 48 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
_readADC .section 'code'
_readADC proc
    local _readADC_2 db 3 dup(?)	; 0,3
	mov ra,a
	mov _readADC_2[0],a
#pragma debug variable 8 7 _readADC_2+0 "pin"
#line 50 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
	mov a,3
	sub a,ra
	snz c
	jmp _L8
#pragma debug scope 8 7
;begin block, line: 50.-1
#pragma debug scope 9 8
;begin block, line: 50.-1
#line 20 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
	set [39].5
#pragma debug scope 8 7
#pragma debug scope 7 1
#line 54 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
	mov a,ra
	call _setADCChannel
#line 56 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
	call _startConversion
#line 58 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
	mov a,[38]
	mov rb,a
	clr rc
#line 60 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
	clr c
	rlc rb
	rlc rc
	clr c
	rlc rb
	rlc rc
#line 61 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
	mov a,[38]
	mov ra,a
	mov a,0
	sub a,ra
	mov rd,a
	mov a,ra
	orm a,rd
	rlc rd
	clr rd
	rlc rd
	clr re
	sz rd.7
	set re
	mov a,re
	or a,rc
	mov _readADC_2[2],a
	mov a,rd
	or a,rb
	mov _readADC_2[1],a
#line 62 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
	call _disableADC
	jmp _L7
_L8:
#line 49 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
	clr _readADC_2[1]
	clr _readADC_2[2]
_L7:
#line 65 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
	mov a,_readADC_2[1]
	mov ra,a
	mov a,_readADC_2[2]
	mov rb,a
	ret
_readADC endp
#line 65 "C:\Users\Balaji\Documents\HTK_Project\ENT_600\ADC.c"
#pragma debug scope 1 1
#pragma debug variable 8 1 ___sadoh "__sadoh" 1
#pragma debug struct_begin 42 "__sadc0_bits"
#pragma debug field 21 8 0 1 "__sacs0" ;0,1
#pragma debug field 21 8 0 1 "__sacs1" ;1,1
#pragma debug field 21 8 0 1 "__sacs2" ;2,1
#pragma debug field 21 8 0 1 "__sacs3" ;3,1
#pragma debug field 21 8 0 1 "__adrfs" ;4,1
#pragma debug field 21 8 0 1 "__adcen" ;5,1
#pragma debug field 21 8 0 1 "__adbz" ;6,1
#pragma debug field 21 8 0 1 "__start" ;7,1
#pragma debug struct_end
#pragma debug union_begin 43 ""
#pragma debug field 2 42 "bits"
#pragma debug field 0 8 "byte"
#pragma debug union_end
#pragma debug variable 43 1 ___sadc0 "__sadc0" 1
#pragma debug struct_begin 44 "__sadc1_bits"
#pragma debug field 21 8 0 1 "__sacks0" ;0,1
#pragma debug field 21 8 0 1 "__sacks1" ;1,1
#pragma debug field 21 8 0 1 "__sacks2" ;2,1
#pragma debug field 21 8 0 1 "__savrs0" ;3,1
#pragma debug field 21 8 0 1 "__savrs1" ;4,1
#pragma debug field 21 8 0 1 "__sains0" ;5,1
#pragma debug field 21 8 0 1 "__sains1" ;6,1
#pragma debug field 21 8 0 1 "__sains2" ;7,1
#pragma debug struct_end
#pragma debug union_begin 45 ""
#pragma debug field 2 44 "bits"
#pragma debug field 0 8 "byte"
#pragma debug union_end
#pragma debug variable 45 1 ___sadc1 "__sadc1" 1

; 
; Generated by holtek-gcc v3.19, Sun Apr 03 15:17:44 2022
; Rebuild 718
; end of file
