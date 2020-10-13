
<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 10
0dbfs = 1
instr 1
    p3=p4
    seed 0
    irefl	random 0.001, 0.999
    aEnv	linsegr	0, 0.005, 1, p3-0.105, 1, 0.1, 0		; amplitude envelope
    iPlk	random	0.1, 0.3					; point at which to pluck the string
    iDtn	random    -0.05, 0.05					; random detune
    ;irefl	table	inum, giScal1					; read reflection value from giScal table according to note number
    aSig	wgpluck2  0.58, p5, cpspch(p6), iPlk, irefl	; generate Karplus-Strong plucked string audio
    kcf	expon	cpsoct(rnd(6)+6),p3,50				; filter cutoff frequency envelope
    aSig	clfilt	aSig, kcf, 0, 2					; butterworth lowpass filter
    out aSig*aEnv*1.5
endin
instr 2
    p3=4
	if ftchnls(1) == 1 then
		asigl loscil p5, 1, 1, 1, 0
		asigr = asigl
	elseif ftchnls(1) == 2 then
	    asigl, asigr loscil p5, 1, 1, 1, 0
	endif
	out asigl
endin
instr 3
    p3=4
	if ftchnls(2) == 1 then
		asigl loscil p5, 1, 2, 1, 0
		asigr = asigl
	elseif ftchnls(2) == 2 then
	    asigl, asigr loscil p5, 1, 2, 1, 0
	endif
	out asigl
endin
instr 4
    p3=4
	if ftchnls(3) == 1 then
		asigl loscil p5, 1, 3, 1, 0
		asigr = asigl
	elseif ftchnls(3) == 2 then
	    asigl, asigr loscil p5, 1, 3, 1, 0
	endif
	out asigl
endin
instr 5
    p3=4
	if ftchnls(4) == 1 then
		asigl loscil p5, 1, 4, 1, 0
		asigr = asigl
	elseif ftchnls(4) == 2 then
	    asigl, asigr loscil p5, 1, 4, 1, 0
	endif
	out asigl
endin
instr 6
    p3=4
	if ftchnls(5) == 1 then
		asigl loscil p5, 1, 5, 1, 0
		asigr = asigl
	elseif ftchnls(5) == 2 then
	    asigl, asigr loscil p5, 1, 5, 1, 0
	endif
	out asigl
endin
instr 7
    p3=4
	if ftchnls(6) == 1 then
		asigl loscil p5, 1, 6, 1, 0
		asigr = asigl
	elseif ftchnls(6) == 2 then
	    asigl, asigr loscil p5, 1, 6, 1, 0
	endif
	out asigl
endin
instr 8
    p3=4
	if ftchnls(7) == 1 then
		asigl loscil p5, 1, 7, 1, 0
		asigr = asigl
	elseif ftchnls(7) == 2 then
	    asigl, asigr loscil p5, 1, 7, 1, 0
	endif
	out asigl*.7
endin
instr 9
    p3=4
	if ftchnls(8) == 1 then
		asigl loscil p5, 1, 8, 1, 0
		asigr = asigl
	elseif ftchnls(8) == 2 then
	    asigl, asigr loscil p5, 1, 8, 1, 0
	endif
	out asigl
endin
instr 10
    p3=4
	if ftchnls(9) == 1 then
		asigl loscil p5, 1, 9, 1, 0
		asigr = asigl
	elseif ftchnls(9) == 2 then
	    asigl, asigr loscil p5, 1, 9, 1, 0
	endif
	out asigl
endin
instr 11
    p3=4
	if ftchnls(10) == 1 then
		asigl loscil p5, 1, 10, 1, 0
		asigr = asigl
	elseif ftchnls(10) == 2 then
	    asigl, asigr loscil p5, 1, 10, 1, 0
	endif
	out asigl
endin
instr 12
    p3=4
	if ftchnls(11) == 1 then
		asigl loscil p5, 1, 11, 1, 0
		asigr = asigl
	elseif ftchnls(11) == 2 then
	    asigl, asigr loscil p5, 1, 11, 1, 0
	endif
	out asigl
endin
instr 13
    p3=4
	if ftchnls(12) == 1 then
		asigl loscil p5, 1, 12, 1, 0
		asigr = asigl
	elseif ftchnls(12) == 2 then
	    asigl, asigr loscil p5, 1, 12, 1, 0
	endif
	out asigl
endin
</CsInstruments>
<CsScore>
f 1 0 0 1 "drums/LinnDrumKick.wav" 0 0 0
f 2 0 0 1 "drums/BD2510.WAV" 0 0 0
f 3 0 0 1 "drums/SD0010.WAV" 0 0 0
f 4 0 0 1 "drums/CP.WAV" 0 0 0
f 5 0 0 1 "drums/OH00.WAV" 0 0 0
f 6 0 0 1 "drums/MT00.WAV" 0 0 0
f 7 0 0 1 "drums/CY0050.WAV" 0 0 0
f 8 0 0 1 "drums/RS.WAV" 0 0 0
f 9 0 0 1 "drums/LT50.WAV" 0 0 0
f 10 0 0 1 "drums/CL.WAV" 0 0 0
f 11 0 0 1 "drums/MA.WAV" 0 0 0
f 12 0 0 1 "drums/CH.WAV" 0 0 0
f 13 0 0 1 "drums/emu/emu_CHH.wav" 0 0 0
f 14 0 0 1 "drums/emu/emu_Clap.wav" 0 0 0
f 15 0 0 1 "drums/emu/emu_Cowbell.wav" 0 0 0
f 16 0 0 1 "drums/emu/emu_Kick.wav" 0 0 0
f 17 0 0 1 "drums/emu/emu_OHH.wav" 0 0 0
f 18 0 0 1 "drums/emu/emu_Ride.wav" 0 0 0
f 19 0 0 1 "drums/emu/emu_Rim.wav" 0 0 0
f 20 0 0 1 "drums/emu/emu_Snare.wav" 0 0 0
f 21 0 0 1 "drums/emu/emu_Tom1.wav" 0 0 0
f 22 0 0 1 "drums/emu/emu_Tom2.wav" 0 0 0
f 23 0 0 1 "drums/emu/emu_Tom3.wav" 0 0 0
f 24 0 0 1 "drums/emu/emu_Wood_Block.wav" 0 0 0
t 0 320
b [(6*4*7*2)-(4*4*4+5*4*4)]

{ 4 CNT
i 8 [0+0+$CNT*4*4] 1 0.5 [0.8*1/6] [8+.06] ;lydian
i 8 + 1 2.75 [0.25*0/6] [8+.12] ;lydian
i 8 + 1 3 [0.5*1/6] [8+.12] ;lydian
i 8 + 1 1.25 [0.1*0/6] [8+.04] ;lydian
 i 8 + 1 0.25 [0.9*0/6] [8+.00] ;lydian
i 8 + 1 0.5 [0.15*0/6] [8+.00] ;lydian
i 8 + 1 1.5 [0.4*0/6] [8+.09] ;lydian
i 8 + 1 0.25 [0.6*1/6] [8+.04] ;lydian
 i 8 + 1 0.5 [0.5*0/6] [8+.00] ;lydian
i 8 + 1 1 [0.65*0/6] [8+.00] ;lydian
i 8 + 1 1 [0.55*0/6] [8+.09] ;lydian
i 8 + 1 1.25 [0.45*0/6] [8+.12] ;lydian
 i 8 + 1 0.75 [0.1*0/6] [8+.04] ;lydian
i 8 + 1 0.25 [0.3*0/6] [8+.04] ;lydian
i 8 + 1 0.75 [0.8*0/6] [8+.06] ;lydian
i 8 + 1 3 [0.05*0/6] [8+.02] ;lydian
}

b [(6*4*7*2)-(4*4*4+5*4*4)+4*4*4]

{ 4 CNT
i 2 [0+0.25+$CNT*5*4] 1 0.5 [0.7*0/6] [8+.02] ;lydian
i 2 + 1 0.5 [0.15*1/6] [8+.02] ;lydian
i 2 + 1 1.25 [0.5*1/6] [8+.02] ;lydian
i 2 + 1 0.25 [0.8*0/6] [8+.12] ;lydian
 i 2 + 1 0.5 [0.2*0/6] [8+.06] ;lydian
i 2 + 1 0.75 [0.75*0/6] [8+.00] ;lydian
i 2 + 1 0.25 [0.45*0/6] [8+.02] ;lydian
i 2 + 1 0.25 [0.75*0/6] [8+.07] ;lydian
 i 2 + 1 0.5 [0.35*1/6] [8+.11] ;lydian
i 2 + 1 2.75 [0.4*0/6] [8+.00] ;lydian
i 2 + 1 3 [0.5*0/6] [8+.11] ;lydian
i 2 + 1 1.5 [0.85*0/6] [8+.00] ;lydian
 i 2 + 1 0.75 [0.5*1/6] [8+.09] ;lydian
i 2 + 1 0.5 [0.65*0/6] [8+.00] ;lydian
i 2 + 1 0.25 [0.8*1/6] [8+.00] ;lydian
i 2 + 1 1.5 [0.85*1/6] [8+.02] ;lydian
 i 2 + 1 0.75 [0.85*0/6] [8+.09] ;lydian
i 2 + 1 2.75 [0.95*1/6] [8+.07] ;lydian
i 2 + 1 2.75 [0.65*1/6] [8+.00] ;lydian
i 2 + 1 3 [0.9*1/6] [8+.00] ;lydian
}

b [(6*4*7*2)-(4*4*6+6*4*5)]

{ 6 CNT
i 11 [0+0+$CNT*4*4] 1 0.25 [0.4*0/6] [10+.00] ;lydian
i 11 + 1 1 [0.25*1/6] [10+.04] ;lydian
i 11 + 1 0.25 [0.1*1/6] [10+.04] ;lydian
i 11 + 1 0.25 [0.9*0/6] [10+.00] ;lydian
 i 11 + 1 0.5 [0.7*1/6] [10+.00] ;lydian
i 11 + 1 0.5 [0.95*0/6] [10+.09] ;lydian
i 11 + 1 0.5 [0.65*0/6] [10+.09] ;lydian
i 11 + 1 3 [0.55*0/6] [10+.04] ;lydian
 i 11 + 1 3 [0.05*0/6] [10+.12] ;lydian
i 11 + 1 1.5 [0.1*0/6] [10+.00] ;lydian
i 11 + 1 0.25 [0.4*1/6] [10+.06] ;lydian
i 11 + 1 0.5 [0.4*0/6] [10+.12] ;lydian
 i 11 + 1 1 [0.75*0/6] [10+.06] ;lydian
i 11 + 1 0.5 [0.6*0/6] [10+.04] ;lydian
i 11 + 1 0.25 [0.95*1/6] [10+.02] ;lydian
i 11 + 1 3 [0.65*1/6] [10+.06] ;lydian
}

b [(6*4*7*2)-(4*4*6+6*4*5)+4*4*6]

{ 5 CNT
i 4 [0+0.75+$CNT*6*4] 1 1.5 [0.55*0/6] [10+.06] ;lydian
i 4 + 1 0.5 [0.5*0/6] [10+.12] ;lydian
i 4 + 1 3 [0.05*0/6] [10+.07] ;lydian
i 4 + 1 0.75 [0.9*0/6] [10+.04] ;lydian
 i 4 + 1 0.25 [0.65*0/6] [10+.09] ;lydian
i 4 + 1 0.5 [0.9*1/6] [10+.04] ;lydian
i 4 + 1 1.25 [0.9*0/6] [10+.00] ;lydian
i 4 + 1 0.5 [0.1*0/6] [10+.11] ;lydian
 i 4 + 1 1.25 [0.8*1/6] [10+.00] ;lydian
i 4 + 1 1 [0.5*0/6] [10+.09] ;lydian
i 4 + 1 3 [0.3*0/6] [10+.09] ;lydian
i 4 + 1 0.25 [0.65*0/6] [10+.04] ;lydian
 i 4 + 1 0.5 [0.5*1/6] [10+.06] ;lydian
i 4 + 1 0.25 [0.9*0/6] [10+.06] ;lydian
i 4 + 1 0.25 [0.65*0/6] [10+.02] ;lydian
i 4 + 1 0.25 [0.8*1/6] [10+.00] ;lydian
 i 4 + 1 1.25 [0.05*0/6] [10+.02] ;lydian
i 4 + 1 0.75 [0.05*1/6] [10+.00] ;lydian
i 4 + 1 0.25 [0.95*0/6] [10+.02] ;lydian
i 4 + 1 1.25 [0.65*0/6] [10+.00] ;lydian
 i 4 + 1 0.5 [0.65*0/6] [10+.09] ;lydian
i 4 + 1 2.75 [0.6*1/6] [10+.00] ;lydian
i 4 + 1 0.5 [0.3*0/6] [10+.09] ;lydian
i 4 + 1 1.25 [0.8*0/6] [10+.12] ;lydian
}

b [(6*4*7*2)-(3*4*6+5*4*6)]

{ 6 CNT
i 8 [0+0+$CNT*3*4] 1 0.25 [0.9*0/6] [7+.00] ;lydian
i 8 + 1 3 [0.55*1/6] [7+.11] ;lydian
i 8 + 1 0.5 [0.35*1/6] [7+.11] ;lydian
i 8 + 1 0.75 [0.4*0/6] [7+.00] ;lydian
 i 8 + 1 0.75 [0.85*0/6] [7+.09] ;lydian
i 8 + 1 1.25 [0.75*0/6] [7+.02] ;lydian
i 8 + 1 0.25 [0.6*0/6] [7+.00] ;lydian
i 8 + 1 0.5 [0.2*1/6] [7+.06] ;lydian
 i 8 + 1 0.75 [0.85*0/6] [7+.00] ;lydian
i 8 + 1 0.5 [0.35*0/6] [7+.06] ;lydian
i 8 + 1 0.5 [0.65*0/6] [7+.06] ;lydian
i 8 + 1 0.25 [0.45*0/6] [7+.00] ;lydian
}

b [(6*4*7*2)-(3*4*6+5*4*6)+3*4*6]

{ 6 CNT
i 9 [0+0.75+$CNT*5*4] 1 0.25 [0.8*0/6] [10+.00] ;lydian
i 9 + 1 0.25 [0.35*0/6] [10+.02] ;lydian
i 9 + 1 0.25 [0.9*0/6] [10+.00] ;lydian
i 9 + 1 0.5 [0.85*1/6] [10+.09] ;lydian
 i 9 + 1 0.5 [0.25*1/6] [10+.07] ;lydian
i 9 + 1 0.25 [0.9*1/6] [10+.06] ;lydian
i 9 + 1 1.5 [0.8*0/6] [10+.00] ;lydian
i 9 + 1 1.25 [0.75*0/6] [10+.12] ;lydian
 i 9 + 1 2.75 [0.85*0/6] [10+.04] ;lydian
i 9 + 1 0.25 [0.85*1/6] [10+.02] ;lydian
i 9 + 1 0.5 [0.75*0/6] [10+.00] ;lydian
i 9 + 1 2.75 [0.8*0/6] [10+.02] ;lydian
 i 9 + 1 0.5 [0.65*0/6] [10+.06] ;lydian
i 9 + 1 0.5 [0.35*0/6] [10+.00] ;lydian
i 9 + 1 0.5 [0.85*0/6] [10+.12] ;lydian
i 9 + 1 1 [0.8*0/6] [10+.09] ;lydian
 i 9 + 1 2.75 [0.9*0/6] [10+.12] ;lydian
i 9 + 1 0.5 [0.9*0/6] [10+.00] ;lydian
i 9 + 1 0.5 [0.2*0/6] [10+.07] ;lydian
i 9 + 1 0.5 [0.5*0/6] [10+.04] ;lydian
}

b [(6*4*7*2)-(5*4*6+3*4*7)]

{ 6 CNT
i 10 [0+0+$CNT*5*4] 1 0.5 [0.25*0/6] [8+.00] ;lydian
i 10 + 1 2.75 [0.45*0/6] [8+.07] ;lydian
i 10 + 1 0.5 [0.5*1/6] [8+.00] ;lydian
i 10 + 1 1.25 [0.9*0/6] [8+.12] ;lydian
 i 10 + 1 1 [0.3*1/6] [8+.00] ;lydian
i 10 + 1 0.75 [0.1*0/6] [8+.00] ;lydian
i 10 + 1 0.75 [0.2*0/6] [8+.07] ;lydian
i 10 + 1 0.5 [0.6*0/6] [8+.02] ;lydian
 i 10 + 1 0.5 [0.85*1/6] [8+.12] ;lydian
i 10 + 1 0.25 [0.75*0/6] [8+.07] ;lydian
i 10 + 1 0.25 [0.95*0/6] [8+.00] ;lydian
i 10 + 1 0.25 [0.85*1/6] [8+.02] ;lydian
 i 10 + 1 0.25 [0.8*1/6] [8+.09] ;lydian
i 10 + 1 0.5 [0.55*0/6] [8+.00] ;lydian
i 10 + 1 0.75 [0.2*0/6] [8+.00] ;lydian
i 10 + 1 0.75 [0.1*0/6] [8+.12] ;lydian
 i 10 + 1 0.25 [0.1*0/6] [8+.02] ;lydian
i 10 + 1 0.25 [0.9*0/6] [8+.06] ;lydian
i 10 + 1 0.5 [0.45*0/6] [8+.06] ;lydian
i 10 + 1 1.25 [0.05*0/6] [8+.07] ;lydian
}

b [(6*4*7*2)-(5*4*6+3*4*7)+5*4*6]

{ 7 CNT
i 11 [0+0+$CNT*3*4] 1 1 [0.25*0/6] [9+.06] ;lydian
i 11 + 1 0.25 [0.5*0/6] [9+.11] ;lydian
i 11 + 1 0.25 [0.55*0/6] [9+.07] ;lydian
i 11 + 1 1.25 [0.1*1/6] [9+.00] ;lydian
 i 11 + 1 0.5 [0.1*0/6] [9+.07] ;lydian
i 11 + 1 0.25 [0.6*0/6] [9+.00] ;lydian
i 11 + 1 0.75 [0.6*1/6] [9+.09] ;lydian
i 11 + 1 0.25 [0.5*0/6] [9+.09] ;lydian
 i 11 + 1 1.25 [0.3*1/6] [9+.06] ;lydian
i 11 + 1 3 [0.95*1/6] [9+.06] ;lydian
i 11 + 1 0.25 [0.65*0/6] [9+.09] ;lydian
i 11 + 1 0.25 [0.7*0/6] [9+.00] ;lydian
}

b [(6*4*7*2)-(6*4*5+5*4*7)]

{ 5 CNT
i 1 [0+0.75+$CNT*6*4] 1 0.25 [0.7*0/6] [7+.09] ;lydian
i 1 + 1 0.25 [0.8*0/6] [7+.06] ;lydian
i 1 + 1 0.5 [0.75*0/6] [7+.00] ;lydian
i 1 + 1 0.25 [0.65*0/6] [7+.07] ;lydian
 i 1 + 1 0.25 [0.5*1/6] [7+.00] ;lydian
i 1 + 1 1.5 [0.85*1/6] [7+.11] ;lydian
i 1 + 1 0.5 [0.1*1/6] [7+.00] ;lydian
i 1 + 1 0.25 [0.45*0/6] [7+.06] ;lydian
 i 1 + 1 1.5 [0.95*0/6] [7+.00] ;lydian
i 1 + 1 0.25 [0.65*0/6] [7+.07] ;lydian
i 1 + 1 1.5 [0.6*0/6] [7+.00] ;lydian
i 1 + 1 1.5 [0.4*0/6] [7+.09] ;lydian
 i 1 + 1 1.25 [0.5*1/6] [7+.12] ;lydian
i 1 + 1 3 [0.8*1/6] [7+.11] ;lydian
i 1 + 1 0.5 [0.75*0/6] [7+.00] ;lydian
i 1 + 1 0.25 [0.2*0/6] [7+.12] ;lydian
 i 1 + 1 0.5 [0.9*1/6] [7+.04] ;lydian
i 1 + 1 0.5 [0.05*0/6] [7+.02] ;lydian
i 1 + 1 1.25 [0.4*0/6] [7+.12] ;lydian
i 1 + 1 0.5 [0.3*0/6] [7+.06] ;lydian
 i 1 + 1 0.5 [0.8*0/6] [7+.00] ;lydian
i 1 + 1 1.5 [0.15*0/6] [7+.00] ;lydian
i 1 + 1 0.5 [0.35*0/6] [7+.00] ;lydian
i 1 + 1 1.5 [0.3*1/6] [7+.07] ;lydian
}

b [(6*4*7*2)-(6*4*5+5*4*7)+6*4*5]

{ 7 CNT
i 6 [0+0.5+$CNT*5*4] 1 3 [0.5*1/6] [7+.11] ;lydian
i 6 + 1 1.5 [0.5*0/6] [7+.02] ;lydian
i 6 + 1 0.5 [0.45*0/6] [7+.02] ;lydian
i 6 + 1 0.5 [0.3*1/6] [7+.00] ;lydian
 i 6 + 1 0.75 [0.45*0/6] [7+.07] ;lydian
i 6 + 1 2.75 [0.65*1/6] [7+.04] ;lydian
i 6 + 1 0.75 [0.85*0/6] [7+.00] ;lydian
i 6 + 1 1.25 [0.6*1/6] [7+.09] ;lydian
 i 6 + 1 0.25 [0.8*0/6] [7+.06] ;lydian
i 6 + 1 1.5 [0.75*0/6] [7+.12] ;lydian
i 6 + 1 0.5 [0.3*0/6] [7+.02] ;lydian
i 6 + 1 0.25 [0.15*1/6] [7+.04] ;lydian
 i 6 + 1 0.5 [0.3*0/6] [7+.12] ;lydian
i 6 + 1 0.75 [0.15*0/6] [7+.00] ;lydian
i 6 + 1 1.5 [0.2*0/6] [7+.11] ;lydian
i 6 + 1 0.25 [0.05*1/6] [7+.00] ;lydian
 i 6 + 1 0.25 [0.85*0/6] [7+.04] ;lydian
i 6 + 1 0.5 [0.7*0/6] [7+.12] ;lydian
i 6 + 1 0.5 [0.2*1/6] [7+.07] ;lydian
i 6 + 1 0.5 [0.95*1/6] [7+.00] ;lydian
}

b [(6*4*7*2)-(3*4*5+6*4*4)]

{ 5 CNT
i 4 [0+0+$CNT*3*4] 1 0.5 [0.95*0/6] [8+.04] ;lydian
i 4 + 1 1.5 [0.9*0/6] [8+.11] ;lydian
i 4 + 1 0.5 [0.3*0/6] [8+.00] ;lydian
i 4 + 1 0.25 [0.7*1/6] [8+.12] ;lydian
 i 4 + 1 0.25 [0.2*0/6] [8+.04] ;lydian
i 4 + 1 0.5 [0.2*1/6] [8+.12] ;lydian
i 4 + 1 2.75 [0.6*0/6] [8+.09] ;lydian
i 4 + 1 0.75 [0.75*0/6] [8+.07] ;lydian
 i 4 + 1 0.5 [0.25*0/6] [8+.12] ;lydian
i 4 + 1 0.25 [0.15*0/6] [8+.09] ;lydian
i 4 + 1 1.25 [0.3*0/6] [8+.06] ;lydian
i 4 + 1 0.25 [0.3*0/6] [8+.00] ;lydian
}

b [(6*4*7*2)-(3*4*5+6*4*4)+3*4*5]

{ 4 CNT
i 5 [0+0+$CNT*6*4] 1 1 [0.7*0/6] [10+.00] ;lydian
i 5 + 1 2.75 [0.95*1/6] [10+.11] ;lydian
i 5 + 1 0.75 [0.15*0/6] [10+.04] ;lydian
i 5 + 1 0.5 [0.4*1/6] [10+.00] ;lydian
 i 5 + 1 0.25 [0.25*1/6] [10+.07] ;lydian
i 5 + 1 0.25 [0.65*0/6] [10+.12] ;lydian
i 5 + 1 3 [0.45*1/6] [10+.11] ;lydian
i 5 + 1 1.25 [0.2*0/6] [10+.12] ;lydian
 i 5 + 1 0.25 [0.05*0/6] [10+.00] ;lydian
i 5 + 1 3 [0.75*0/6] [10+.12] ;lydian
i 5 + 1 3 [0.5*1/6] [10+.00] ;lydian
i 5 + 1 0.25 [0.35*0/6] [10+.00] ;lydian
 i 5 + 1 1.5 [0.95*1/6] [10+.00] ;lydian
i 5 + 1 1.5 [0.6*0/6] [10+.06] ;lydian
i 5 + 1 0.25 [0.75*0/6] [10+.11] ;lydian
i 5 + 1 1.25 [0.95*0/6] [10+.07] ;lydian
 i 5 + 1 0.5 [0.45*0/6] [10+.00] ;lydian
i 5 + 1 2.75 [0.3*0/6] [10+.07] ;lydian
i 5 + 1 0.5 [0.1*0/6] [10+.07] ;lydian
i 5 + 1 1 [0.45*1/6] [10+.06] ;lydian
 i 5 + 1 1 [0.85*0/6] [10+.00] ;lydian
i 5 + 1 0.25 [0.5*0/6] [10+.06] ;lydian
i 5 + 1 2.75 [0.45*0/6] [10+.09] ;lydian
i 5 + 1 1 [0.45*0/6] [10+.07] ;lydian
}





</CsScore>
</CsoundSynthesizer>
