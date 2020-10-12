
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
t 0 200
{ 4 CNT 
i 6 [0+0.25+$CNT*12] 1 1.25 [0.05*1/4] [8+.05] ;aeolian
i 6 + 1 1.25 [0.2*0/4] [8+.12] ;aeolian
i 6 + 1 2.75 [0.8*0/4] [8+.05] ;aeolian
i 6 + 1 1.25 [0.4*0/4] [8+.12] ;aeolian
i 6 + 1 0.25 [0.3*0/4] [8+.07] ;aeolian
i 6 + 1 0.5 [0.5*0/4] [8+.02] ;aeolian
i 6 + 1 1 [0.25*1/4] [8+.02] ;aeolian
i 6 + 1 1.5 [0.7*0/4] [8+.00] ;aeolian
i 6 + 1 0.5 [0.45*1/4] [8+.07] ;aeolian
i 6 + 1 1.5 [0.15*0/4] [8+.03] ;aeolian
i 6 + 1 0.5 [0.1*0/4] [8+.08] ;aeolian
i 6 + 1 3 [0.45*1/4] [8+.02] ;aeolian
i 7 [0+0+$CNT*12] 1 0.25 [0.5*0/4] [8+.12] ;aeolian
i 7 + 1 3 [0.8*0/4] [8+.00] ;aeolian
i 7 + 1 3 [0.2*0/4] [8+.00] ;aeolian
i 7 + 1 0.5 [0.15*0/4] [8+.05] ;aeolian
i 7 + 1 0.25 [0.05*0/4] [8+.05] ;aeolian
i 7 + 1 1.5 [0.5*0/4] [8+.08] ;aeolian
i 7 + 1 1.25 [0.9*0/4] [8+.02] ;aeolian
i 7 + 1 0.5 [0.25*0/4] [8+.02] ;aeolian
i 7 + 1 2.75 [0.05*0/4] [8+.00] ;aeolian
i 7 + 1 0.5 [0.25*0/4] [8+.08] ;aeolian
i 7 + 1 1.5 [0.9*1/4] [8+.10] ;aeolian
i 7 + 1 0.5 [0.9*0/4] [8+.08] ;aeolian
i 4 [0+0+$CNT*12] 1 0.5 [0.45*1/4] [8+.00] ;aeolian
i 4 + 1 0.5 [0.3*0/4] [8+.03] ;aeolian
i 4 + 1 2.75 [0.45*0/4] [8+.07] ;aeolian
i 4 + 1 0.25 [0.6*0/4] [8+.12] ;aeolian
i 4 + 1 2.75 [0.4*0/4] [8+.05] ;aeolian
i 4 + 1 1.25 [0.55*1/4] [8+.03] ;aeolian
i 4 + 1 2.75 [0.75*0/4] [8+.10] ;aeolian
i 4 + 1 1.25 [0.05*0/4] [8+.02] ;aeolian
i 4 + 1 3 [0.7*0/4] [8+.12] ;aeolian
i 4 + 1 0.5 [0.95*1/4] [8+.05] ;aeolian
i 4 + 1 0.25 [0.25*1/4] [8+.02] ;aeolian
i 4 + 1 1.5 [0.1*0/4] [8+.10] ;aeolian
i 1 [0+0+$CNT*12] 1 0.25 [0.5*0/4] [8+.00] ;aeolian
i 1 + 1 1.5 [0.8*0/4] [8+.08] ;aeolian
i 1 + 1 1.5 [0.95*0/4] [8+.12] ;aeolian
i 1 + 1 1.5 [0.7*1/4] [8+.12] ;aeolian
i 1 + 1 0.25 [0.6*0/4] [8+.03] ;aeolian
i 1 + 1 3 [0.75*0/4] [8+.10] ;aeolian
i 1 + 1 3 [0.65*0/4] [8+.02] ;aeolian
i 1 + 1 2.75 [0.75*1/4] [8+.07] ;aeolian
i 1 + 1 0.5 [0.15*1/4] [8+.07] ;aeolian
i 1 + 1 0.75 [0.95*1/4] [8+.08] ;aeolian
i 1 + 1 2.75 [0.6*0/4] [8+.12] ;aeolian
i 1 + 1 3 [0.45*0/4] [8+.02] ;aeolian

}
b [12*4]
{ 1 CNT
i 1 [0+0+$CNT*12] 1 1.25 [0.95*0/6] [8+.06] ;atonal
i 1 + 1 1.25 [0.55*0/6] [8+.05] ;atonal
i 1 + 1 3 [0.1*0/6] [8+.10] ;atonal
i 1 + 1 0.5 [0.7*0/6] [8+.07] ;atonal
i 1 + 1 3 [0.7*0/6] [8+.04] ;atonal
i 1 + 1 1 [0.05*0/6] [8+.01] ;atonal
i 1 + 1 0.5 [0.2*1/6] [8+.05] ;atonal
i 1 + 1 0.25 [0.35*1/6] [8+.03] ;atonal
i 1 + 1 2.75 [0.3*0/6] [8+.01] ;atonal
i 1 + 1 0.5 [0.55*0/6] [8+.03] ;atonal
i 1 + 1 1.5 [0.15*1/6] [8+.09] ;atonal
i 1 + 1 1.25 [0.3*0/6] [8+.03] ;atonal
i 9 [0+0+$CNT*12] 1 3 [0.1*1/6] [8+.05] ;atonal
i 9 + 1 2.75 [0.45*1/6] [8+.09] ;atonal
i 9 + 1 1.5 [0.4*0/6] [8+.01] ;atonal
i 9 + 1 0.25 [0.7*0/6] [8+.01] ;atonal
i 9 + 1 3 [0.35*1/6] [8+.06] ;atonal
i 9 + 1 0.5 [0.45*0/6] [8+.08] ;atonal
i 9 + 1 1.25 [0.15*1/6] [8+.04] ;atonal
i 9 + 1 0.5 [0.35*0/6] [8+.05] ;atonal
i 9 + 1 0.25 [0.05*1/6] [8+.00] ;atonal
i 9 + 1 3 [0.55*0/6] [8+.12] ;atonal
i 9 + 1 0.25 [0.95*1/6] [8+.02] ;atonal
i 9 + 1 1.25 [0.6*0/6] [8+.07] ;atonal
i 3 [0+0.25+$CNT*12] 1 0.75 [0.95*0/6] [8+.07] ;atonal
i 3 + 1 1 [0.3*1/6] [8+.11] ;atonal
i 3 + 1 0.75 [0.85*0/6] [8+.11] ;atonal
i 3 + 1 1.25 [0.9*1/6] [8+.08] ;atonal
i 3 + 1 0.75 [0.55*0/6] [8+.07] ;atonal
i 3 + 1 2.75 [0.9*1/6] [8+.05] ;atonal
i 3 + 1 3 [0.5*0/6] [8+.04] ;atonal
i 3 + 1 0.75 [0.75*0/6] [8+.07] ;atonal
i 3 + 1 1 [0.5*0/6] [8+.09] ;atonal
i 3 + 1 1.5 [0.65*1/6] [8+.05] ;atonal
i 3 + 1 3 [0.2*0/6] [8+.00] ;atonal
i 3 + 1 0.25 [0.05*0/6] [8+.10] ;atonal
i 1 [0+0+$CNT*12] 1 1 [0.65*1/6] [8+.03] ;atonal
i 1 + 1 1.5 [0.3*0/6] [8+.06] ;atonal
i 1 + 1 1.5 [0.4*0/6] [8+.07] ;atonal
i 1 + 1 1 [0.65*0/6] [8+.11] ;atonal
i 1 + 1 1.5 [0.35*0/6] [8+.11] ;atonal
i 1 + 1 2.75 [0.8*0/6] [8+.07] ;atonal
i 1 + 1 3 [0.7*1/6] [8+.03] ;atonal
i 1 + 1 1.25 [0.95*1/6] [8+.00] ;atonal
i 1 + 1 1 [0.55*0/6] [8+.11] ;atonal
i 1 + 1 1 [0.85*1/6] [8+.09] ;atonal
i 1 + 1 0.25 [0.85*0/6] [8+.08] ;atonal
i 1 + 1 1 [0.3*0/6] [8+.00] ;atonal
i 2 [0+0.25+$CNT*12] 1 1.25 [0.9*0/6] [8+.01] ;atonal
i 2 + 1 1.5 [0.9*1/6] [8+.09] ;atonal
i 2 + 1 3 [0.55*0/6] [8+.01] ;atonal
i 2 + 1 1.25 [0.05*0/6] [8+.00] ;atonal
i 2 + 1 1 [0.2*1/6] [8+.12] ;atonal
i 2 + 1 1 [0.55*1/6] [8+.06] ;atonal
i 2 + 1 0.25 [0.25*0/6] [8+.11] ;atonal
i 2 + 1 1.25 [0.35*0/6] [8+.12] ;atonal
i 2 + 1 0.25 [0.45*1/6] [8+.02] ;atonal
i 2 + 1 1 [0.95*0/6] [8+.04] ;atonal
i 2 + 1 1.5 [0.65*0/6] [8+.08] ;atonal
i 2 + 1 3 [0.9*1/6] [8+.12] ;atonal
i 10 [0+0.25+$CNT*12] 1 0.5 [0.35*0/6] [8+.11] ;atonal
i 10 + 1 0.5 [0.35*1/6] [8+.11] ;atonal
i 10 + 1 1 [0.7*0/6] [8+.06] ;atonal
i 10 + 1 1.25 [0.7*0/6] [8+.01] ;atonal
i 10 + 1 3 [0.1*0/6] [8+.06] ;atonal
i 10 + 1 3 [0.3*1/6] [8+.04] ;atonal
i 10 + 1 0.25 [0.7*1/6] [8+.12] ;atonal
i 10 + 1 1.5 [0.65*0/6] [8+.10] ;atonal
i 10 + 1 1.5 [0.7*1/6] [8+.03] ;atonal
i 10 + 1 0.75 [0.3*0/6] [8+.06] ;atonal
i 10 + 1 1 [0.8*0/6] [8+.06] ;atonal
i 10 + 1 2.75 [0.9*1/6] [8+.11] ;atonal

}
</CsScore>
</CsoundSynthesizer>
