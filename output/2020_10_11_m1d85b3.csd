
<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 10
0dbfs = 1
instr 1
    p3 = p4
	kenv expseg 0.001, p3*0.1, p5, p3*0.8, p5, p3*0.1, 0.001
	asig oscil kenv, cpspch(p6)
	out asig
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

#define BRAC1 #[#
#define BRAC2 #]#
t 0 220

{ 4 CNT 

i 1 $BRAC1 0+0+$CNT*12 $BRAC2 1 3 $BRAC1 0.85*0/2 $BRAC2 $BRAC1 8+.07 $BRAC2 ;aeolian
i 1 + 1 1.25 $BRAC1 0.8*1/2 $BRAC2 $BRAC1 8+.12 $BRAC2 ;aeolian
i 1 + 1 2.75 $BRAC1 0.3*0/2 $BRAC2 $BRAC1 8+.03 $BRAC2 ;aeolian
i 1 $BRAC1 0+0+$CNT*12 $BRAC2 1 3 $BRAC1 0.85*0/2 $BRAC2 $BRAC1 8+.07 $BRAC2 ;aeolian
i 1 + 1 1.25 $BRAC1 0.8*1/2 $BRAC2 $BRAC1 8+.12 $BRAC2 ;aeolian
i 1 + 1 2.75 $BRAC1 0.3*0/2 $BRAC2 $BRAC1 8+.03 $BRAC2 ;aeolian


}
b [12*4]

{ 2 CNT

i 1 $BRAC1 0+0.5+$CNT*12 $BRAC2 1 2.75 $BRAC1 0.5*1/6 $BRAC2 $BRAC1 8+.09 $BRAC2 ;dorian
i 1 + 1 1.25 $BRAC1 0.6*1/6 $BRAC2 $BRAC1 8+.05 $BRAC2 ;dorian
i 1 + 1 0.75 $BRAC1 0.4*0/6 $BRAC2 $BRAC1 8+.10 $BRAC2 ;dorian
i 1 + 1 0.25 $BRAC1 0.9*0/6 $BRAC2 $BRAC1 8+.00 $BRAC2 ;dorian
i 1 + 1 0.5 $BRAC1 0.7*0/6 $BRAC2 $BRAC1 8+.03 $BRAC2 ;dorian
i 7 $BRAC1 0+0.5+$CNT*12 $BRAC2 1 0.75 $BRAC1 0.05*1/6 $BRAC2 $BRAC1 8+.10 $BRAC2 ;dorian
i 7 + 1 0.75 $BRAC1 0.5*0/6 $BRAC2 $BRAC1 8+.10 $BRAC2 ;dorian
i 7 + 1 1 $BRAC1 0.9*0/6 $BRAC2 $BRAC1 8+.02 $BRAC2 ;dorian
i 7 + 1 2.75 $BRAC1 0.9*0/6 $BRAC2 $BRAC1 8+.07 $BRAC2 ;dorian
i 7 + 1 0.25 $BRAC1 0.55*0/6 $BRAC2 $BRAC1 8+.10 $BRAC2 ;dorian
i 7 + 1 2.75 $BRAC1 0.6*0/6 $BRAC2 $BRAC1 8+.00 $BRAC2 ;dorian
i 7 + 1 3 $BRAC1 0.75*0/6 $BRAC2 $BRAC1 8+.03 $BRAC2 ;dorian
i 7 + 1 1 $BRAC1 0.1*0/6 $BRAC2 $BRAC1 8+.10 $BRAC2 ;dorian
i 7 + 1 0.5 $BRAC1 0.65*0/6 $BRAC2 $BRAC1 8+.02 $BRAC2 ;dorian
i 7 + 1 1.5 $BRAC1 0.2*1/6 $BRAC2 $BRAC1 8+.07 $BRAC2 ;dorian
i 7 + 1 1.5 $BRAC1 0.35*1/6 $BRAC2 $BRAC1 8+.09 $BRAC2 ;dorian
i 7 + 1 1.25 $BRAC1 0.05*0/6 $BRAC2 $BRAC1 8+.09 $BRAC2 ;dorian
i 10 $BRAC1 0+0+$CNT*12 $BRAC2 1 3 $BRAC1 0.55*1/6 $BRAC2 $BRAC1 8+.05 $BRAC2 ;dorian
i 10 + 1 0.25 $BRAC1 0.95*0/6 $BRAC2 $BRAC1 8+.12 $BRAC2 ;dorian
i 10 + 1 1.25 $BRAC1 0.4*0/6 $BRAC2 $BRAC1 8+.00 $BRAC2 ;dorian
i 10 + 1 0.25 $BRAC1 0.6*1/6 $BRAC2 $BRAC1 8+.12 $BRAC2 ;dorian
i 10 + 1 0.5 $BRAC1 0.5*1/6 $BRAC2 $BRAC1 8+.07 $BRAC2 ;dorian
i 10 $BRAC1 0+0.75+$CNT*12 $BRAC2 1 0.25 $BRAC1 0.35*1/6 $BRAC2 $BRAC1 8+.00 $BRAC2 ;dorian
i 10 + 1 0.75 $BRAC1 0.9*0/6 $BRAC2 $BRAC1 8+.12 $BRAC2 ;dorian
i 10 + 1 0.5 $BRAC1 0.6*0/6 $BRAC2 $BRAC1 8+.09 $BRAC2 ;dorian
i 10 + 1 0.5 $BRAC1 0.05*1/6 $BRAC2 $BRAC1 8+.02 $BRAC2 ;dorian
i 10 + 1 0.5 $BRAC1 0.9*1/6 $BRAC2 $BRAC1 8+.05 $BRAC2 ;dorian
i 1 $BRAC1 0+0+$CNT*12 $BRAC2 1 2.75 $BRAC1 0.05*1/6 $BRAC2 $BRAC1 8+.05 $BRAC2 ;dorian
i 1 + 1 3 $BRAC1 0.35*0/6 $BRAC2 $BRAC1 8+.10 $BRAC2 ;dorian
i 1 + 1 3 $BRAC1 0.35*1/6 $BRAC2 $BRAC1 8+.10 $BRAC2 ;dorian
i 1 + 1 1.5 $BRAC1 0.2*0/6 $BRAC2 $BRAC1 8+.03 $BRAC2 ;dorian
i 1 + 1 0.5 $BRAC1 0.3*0/6 $BRAC2 $BRAC1 8+.12 $BRAC2 ;dorian
i 9 $BRAC1 0+0.75+$CNT*12 $BRAC2 1 0.25 $BRAC1 0.25*0/6 $BRAC2 $BRAC1 8+.07 $BRAC2 ;dorian
i 9 + 1 1.5 $BRAC1 0.6*1/6 $BRAC2 $BRAC1 8+.02 $BRAC2 ;dorian
i 9 + 1 1 $BRAC1 0.05*0/6 $BRAC2 $BRAC1 8+.10 $BRAC2 ;dorian
i 9 + 1 0.5 $BRAC1 0.95*0/6 $BRAC2 $BRAC1 8+.00 $BRAC2 ;dorian
i 9 + 1 0.75 $BRAC1 0.9*1/6 $BRAC2 $BRAC1 8+.07 $BRAC2 ;dorian

}
</CsScore>
</CsoundSynthesizer>
