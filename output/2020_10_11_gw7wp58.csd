
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
t 0 290
{ 2 CNT 
i 3 [0+0+$CNT*12] 1 1.25 [0.9*1/3] 8.09
i 3 + 1 1 [0.65*0/3] 8.03
i 3 + 1 2.75 [0.3*1/3] 8.02
i 3 + 1 1 [0.35*0/3] 8.09
i 3 + 1 0.25 [0.15*1/3] 8.03
i 3 + 1 0.75 [0.2*0/3] 8.03
i 3 + 1 0.5 [0.85*0/3] 8.08
i 3 + 1 0.25 [0.05*0/3] 8.08
i 3 + 1 1 [0.7*0/3] 8.07
i 3 + 1 2.75 [0.55*1/3] 8.08
i 3 + 1 0.5 [0.5*0/3] 8.08
i 3 + 1 0.25 [0.35*0/3] 8.10
i 1 [0+0.5+$CNT*12] 1 0.5 [0.25*0/3] 8.07
i 1 + 1 1 [0.6*0/3] 8.03
i 1 + 1 0.75 [0.65*1/3] 8.08
i 1 + 1 1 [0.85*0/3] 8.09
i 1 + 1 2.75 [0.55*1/3] 8.05
i 1 + 1 0.75 [0.5*0/3] 8.02
i 1 + 1 0.75 [0.6*0/3] 8.11
i 1 + 1 1.25 [0.15*0/3] 8.05
i 1 + 1 1 [0.55*0/3] 8.01
i 1 + 1 0.75 [0.9*1/3] 8.10
i 1 + 1 1 [0.05*0/3] 8.03
i 1 + 1 0.5 [0.35*0/3] 8.08
i 8 [0+0+$CNT*12] 1 1 [0.9*0/3] 8.05
i 8 + 1 1 [0.8*1/3] 8.03
i 8 + 1 3 [0.7*0/3] 8.02
i 8 + 1 1.25 [0.35*0/3] 8.01
i 8 + 1 2.75 [0.9*0/3] 8.11
i 8 + 1 3 [0.6*0/3] 8.10
i 8 + 1 0.5 [0.8*0/3] 8.02
i 8 + 1 0.75 [0.25*0/3] 8.11
i 8 + 1 0.5 [0.4*1/3] 8.07
i 8 + 1 0.5 [0.25*1/3] 8.06
i 8 + 1 0.5 [0.35*0/3] 8.08
i 8 + 1 0.5 [0.85*0/3] 8.05

}
b [12*2]
{ 1 CNT
i 8 [0+0+$CNT*12] 1 0.75 [0.9*0/5] 8.08
i 8 + 1 0.75 [0.65*0/5] 8.10
i 8 + 1 2.75 [0.25*0/5] 8.02
i 8 + 1 1 [0.2*0/5] 8.10
i 8 + 1 0.25 [0.6*1/5] 8.08
i 8 + 1 1.5 [0.35*1/5] 8.03
i 8 + 1 1.25 [0.85*1/5] 8.03
i 8 + 1 0.75 [0.55*0/5] 8.05
i 8 + 1 3 [0.35*0/5] 8.02
i 8 + 1 3 [0.25*0/5] 8.03
i 8 + 1 0.5 [0.35*0/5] 8.10
i 8 + 1 1.5 [0.95*1/5] 8.05
i 1 [0+0+$CNT*12] 1 1.5 [0.5*1/5] 8.05
i 1 + 1 1.25 [0.8*1/5] 8.06
i 1 + 1 0.25 [0.35*0/5] 8.06
i 1 + 1 1 [0.45*0/5] 8.09
i 1 + 1 0.25 [0.2*0/5] 8.09
i 1 + 1 1 [0.65*0/5] 8.08
i 1 + 1 3 [0.6*0/5] 8.09
i 1 + 1 1.25 [0.7*1/5] 8.09
i 1 + 1 1.5 [0.05*1/5] 8.03
i 1 + 1 3 [0.15*0/5] 8.10
i 1 + 1 0.75 [0.8*1/5] 8.06
i 1 + 1 1.5 [0.8*0/5] 8.04
i 5 [0+0.75+$CNT*12] 1 1 [0.35*0/5] 8.03
i 5 + 1 1.25 [0.2*0/5] 8.11
i 5 + 1 1.25 [0.5*1/5] 8.09
i 5 + 1 1.25 [0.95*0/5] 8.07
i 5 + 1 1.25 [0.05*0/5] 8.11
i 5 + 1 0.5 [0.1*0/5] 8.04
i 5 + 1 0.75 [0.05*0/5] 8.08
i 5 + 1 2.75 [0.25*0/5] 8.09
i 5 + 1 2.75 [0.05*1/5] 8.11
i 5 + 1 0.5 [0.05*0/5] 8.07
i 5 + 1 1.5 [0.85*0/5] 8.01
i 5 + 1 3 [0.6*0/5] 8.02
i 9 [0+0+$CNT*12] 1 0.5 [0.05*1/5] 8.09
i 9 + 1 1.5 [0.05*0/5] 8.11
i 9 + 1 2.75 [0.55*0/5] 8.10
i 9 + 1 0.75 [0.15*0/5] 8.08
i 9 + 1 0.75 [0.5*0/5] 8.02
i 9 + 1 3 [0.8*0/5] 8.09
i 9 + 1 2.75 [0.45*1/5] 8.07
i 9 + 1 1.25 [0.05*1/5] 8.03
i 9 + 1 1.5 [0.2*0/5] 8.05
i 9 + 1 2.75 [0.65*1/5] 8.01
i 9 + 1 0.5 [0.7*1/5] 8.11
i 9 + 1 1 [0.4*1/5] 8.07
i 10 [0+0+$CNT*12] 1 1.25 [0.45*0/5] 8.11
i 10 + 1 3 [0.35*1/5] 8.01
i 10 + 1 3 [0.65*1/5] 8.03
i 10 + 1 2.75 [0.55*0/5] 8.03
i 10 + 1 1 [0.55*0/5] 8.07
i 10 + 1 1.25 [0.7*0/5] 8.01
i 10 + 1 1 [0.7*0/5] 8.01
i 10 + 1 1.25 [0.15*0/5] 8.02
i 10 + 1 1.25 [0.25*0/5] 8.05
i 10 + 1 1 [0.9*0/5] 8.03
i 10 + 1 1.25 [0.2*0/5] 8.01
i 10 + 1 2.75 [0.05*1/5] 8.02

}
</CsScore>
</CsoundSynthesizer>
