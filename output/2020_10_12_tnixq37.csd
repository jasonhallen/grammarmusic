
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
    out aSig*aEnv
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
	out asigl
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

t 0 320
{ 3 CNT 
i 2 [0+0.25+$CNT*4*4] 1 3 [0.4*0/2] [8+.06] ;atonal
i 2 + 1 1 [0.9*0/2] [8+.08] ;atonal
i 2 + 1 0.5 [0.35*0/2] [8+.06] ;atonal
i 2 + 1 1.5 [0.8*1/2] [8+.09] ;atonal
 i 2 + 1 0.75 [0.1*0/2] [8+.03] ;atonal
i 2 + 1 0.5 [0.1*0/2] [8+.01] ;atonal
i 2 + 1 0.25 [0.1*0/2] [8+.10] ;atonal
i 2 + 1 1 [0.2*0/2] [8+.07] ;atonal
 i 2 + 1 1.5 [0.7*0/2] [8+.05] ;atonal
i 2 + 1 0.25 [0.95*0/2] [8+.11] ;atonal
i 2 + 1 1.5 [0.4*0/2] [8+.12] ;atonal
i 2 + 1 3 [0.45*0/2] [8+.01] ;atonal
 i 2 + 1 0.25 [0.05*0/2] [8+.04] ;atonal
i 2 + 1 0.5 [0.45*0/2] [8+.06] ;atonal
i 2 + 1 1 [0.8*0/2] [8+.04] ;atonal
i 2 + 1 0.25 [0.75*1/2] [8+.06] ;atonal

i 1 [0+0+$CNT*4*4] 1 1 [0.95*1/2] [8+.10] ;atonal
i 1 + 1 0.25 [0.4*1/2] [8+.04] ;atonal
i 1 + 1 0.5 [0.75*0/2] [8+.05] ;atonal
i 1 + 1 0.25 [0.7*0/2] [8+.05] ;atonal
 i 1 + 1 0.25 [0.5*1/2] [8+.00] ;atonal
i 1 + 1 0.5 [0.95*0/2] [8+.08] ;atonal
i 1 + 1 0.5 [0.65*0/2] [8+.06] ;atonal
i 1 + 1 0.25 [0.95*0/2] [8+.02] ;atonal
 i 1 + 1 1.25 [0.5*0/2] [8+.07] ;atonal
i 1 + 1 0.25 [0.75*1/2] [8+.03] ;atonal
i 1 + 1 0.25 [0.1*1/2] [8+.04] ;atonal
i 1 + 1 0.25 [0.45*1/2] [8+.11] ;atonal
 i 1 + 1 0.5 [0.6*1/2] [8+.01] ;atonal
i 1 + 1 1.5 [0.55*0/2] [8+.11] ;atonal
i 1 + 1 3 [0.25*0/2] [8+.03] ;atonal
i 1 + 1 0.5 [0.4*1/2] [8+.10] ;atonal


}
b  [4*4*3]
{ 4 CNT
i 10 [0+0+$CNT*8*4] 1 0.25 [0.8*1/2] [8+.00] ;ionian
i 10 + 1 1 [0.6*0/2] [8+.05] ;ionian
i 10 + 1 2.75 [0.05*0/2] [8+.11] ;ionian
i 10 + 1 0.25 [0.55*0/2] [8+.05] ;ionian
 i 10 + 1 0.25 [0.25*0/2] [8+.09] ;ionian
i 10 + 1 1 [0.1*0/2] [8+.02] ;ionian
i 10 + 1 0.5 [0.35*1/2] [8+.12] ;ionian
i 10 + 1 1 [0.95*0/2] [8+.04] ;ionian
 i 10 + 1 2.75 [0.2*0/2] [8+.11] ;ionian
i 10 + 1 0.5 [0.75*0/2] [8+.04] ;ionian
i 10 + 1 0.5 [0.55*1/2] [8+.12] ;ionian
i 10 + 1 0.75 [0.65*0/2] [8+.09] ;ionian
 i 10 + 1 0.25 [0.4*1/2] [8+.00] ;ionian
i 10 + 1 1.25 [0.1*0/2] [8+.07] ;ionian
i 10 + 1 0.25 [0.25*0/2] [8+.04] ;ionian
i 10 + 1 1 [0.25*0/2] [8+.12] ;ionian
 i 10 + 1 1.25 [0.6*0/2] [8+.11] ;ionian
i 10 + 1 0.5 [0.85*0/2] [8+.00] ;ionian
i 10 + 1 0.25 [0.3*0/2] [8+.07] ;ionian
i 10 + 1 1.25 [0.3*0/2] [8+.00] ;ionian
 i 10 + 1 1.5 [0.4*0/2] [8+.12] ;ionian
i 10 + 1 0.25 [0.75*1/2] [8+.00] ;ionian
i 10 + 1 3 [0.05*1/2] [8+.04] ;ionian
i 10 + 1 0.25 [0.8*0/2] [8+.02] ;ionian
 i 10 + 1 0.25 [0.95*1/2] [8+.11] ;ionian
i 10 + 1 2.75 [0.95*0/2] [8+.07] ;ionian
i 10 + 1 0.5 [0.8*0/2] [8+.05] ;ionian
i 10 + 1 1.5 [0.7*1/2] [8+.02] ;ionian
 i 10 + 1 1.5 [0.1*0/2] [8+.07] ;ionian
i 10 + 1 0.5 [0.7*0/2] [8+.05] ;ionian
i 10 + 1 0.25 [0.85*1/2] [8+.00] ;ionian
i 10 + 1 0.25 [0.4*0/2] [8+.12] ;ionian

i 8 [0+0.75+$CNT*8*4] 1 0.5 [0.7*0/2] [8+.07] ;ionian
i 8 + 1 0.5 [0.4*0/2] [8+.00] ;ionian
i 8 + 1 0.25 [0.55*0/2] [8+.12] ;ionian
i 8 + 1 0.5 [0.55*0/2] [8+.00] ;ionian
 i 8 + 1 0.75 [0.9*0/2] [8+.05] ;ionian
i 8 + 1 0.5 [0.15*1/2] [8+.04] ;ionian
i 8 + 1 0.5 [0.5*1/2] [8+.09] ;ionian
i 8 + 1 0.75 [0.25*1/2] [8+.12] ;ionian
 i 8 + 1 2.75 [0.2*0/2] [8+.05] ;ionian
i 8 + 1 0.25 [0.8*0/2] [8+.00] ;ionian
i 8 + 1 0.25 [0.75*1/2] [8+.00] ;ionian
i 8 + 1 1.25 [0.1*0/2] [8+.02] ;ionian
 i 8 + 1 1.25 [0.3*1/2] [8+.09] ;ionian
i 8 + 1 1.25 [0.45*1/2] [8+.04] ;ionian
i 8 + 1 0.25 [0.85*1/2] [8+.00] ;ionian
i 8 + 1 0.5 [0.65*1/2] [8+.02] ;ionian
 i 8 + 1 3 [0.1*0/2] [8+.05] ;ionian
i 8 + 1 0.5 [0.9*1/2] [8+.02] ;ionian
i 8 + 1 0.5 [0.8*0/2] [8+.11] ;ionian
i 8 + 1 1.25 [0.3*0/2] [8+.00] ;ionian
 i 8 + 1 2.75 [0.35*0/2] [8+.00] ;ionian
i 8 + 1 3 [0.8*1/2] [8+.11] ;ionian
i 8 + 1 0.5 [0.9*0/2] [8+.02] ;ionian
i 8 + 1 0.5 [0.5*0/2] [8+.09] ;ionian
 i 8 + 1 0.25 [0.1*0/2] [8+.11] ;ionian
i 8 + 1 1.5 [0.6*1/2] [8+.00] ;ionian
i 8 + 1 0.5 [0.5*1/2] [8+.05] ;ionian
i 8 + 1 0.25 [0.45*0/2] [8+.00] ;ionian
 i 8 + 1 1.25 [0.45*0/2] [8+.00] ;ionian
i 8 + 1 2.75 [0.05*0/2] [8+.02] ;ionian
i 8 + 1 1.5 [0.4*1/2] [8+.09] ;ionian
i 8 + 1 1.5 [0.25*0/2] [8+.00] ;ionian


}
b [8*4*4+4*4*3]
{ 1 CNT
i 7 [0+0+$CNT*2*4] 1 0.75 [0.3*0/2] [8+.10] ;aeolian
i 7 + 1 0.25 [0.8*1/2] [8+.02] ;aeolian
i 7 + 1 1.25 [0.35*0/2] [8+.00] ;aeolian
i 7 + 1 0.25 [0.3*0/2] [8+.05] ;aeolian
 i 7 + 1 0.5 [0.5*0/2] [8+.12] ;aeolian
i 7 + 1 0.25 [0.6*0/2] [8+.00] ;aeolian
i 7 + 1 1.25 [0.85*1/2] [8+.00] ;aeolian
i 7 + 1 1.25 [0.5*1/2] [8+.00] ;aeolian

i 7 [0+0.25+$CNT*2*4] 1 0.25 [0.95*0/2] [8+.03] ;aeolian
i 7 + 1 0.25 [0.2*0/2] [8+.03] ;aeolian
i 7 + 1 2.75 [0.95*1/2] [8+.00] ;aeolian
i 7 + 1 1.5 [0.05*0/2] [8+.00] ;aeolian
 i 7 + 1 1.25 [0.95*1/2] [8+.10] ;aeolian
i 7 + 1 0.25 [0.6*1/2] [8+.00] ;aeolian
i 7 + 1 0.25 [0.95*0/2] [8+.02] ;aeolian
i 7 + 1 0.75 [0.65*1/2] [8+.05] ;aeolian


}


</CsScore>
</CsoundSynthesizer>