
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
{ 2 CNT 
i 2 $BO0+0.5+$CNT*12$BC 1 1 $BO0.3*0/2$BC $BO8+.02$BC ;lydian
i 2 + 1 0.5 $BO0.5*1/2$BC $BO8+.12$BC ;lydian
i 2 + 1 0.25 $BO0.75*0/2$BC $BO8+.12$BC ;lydian
i 2 + 1 3 $BO0.55*0/2$BC $BO8+.07$BC ;lydian
i 2 + 1 1.5 $BO0.25*0/2$BC $BO8+.06$BC ;lydian
i 2 + 1 2.75 $BO0.4*0/2$BC $BO8+.06$BC ;lydian
i 2 + 1 0.75 $BO0.2*0/2$BC $BO8+.00$BC ;lydian
i 2 + 1 0.5 $BO0.65*0/2$BC $BO8+.04$BC ;lydian
i 2 + 1 1 $BO0.3*1/2$BC $BO8+.00$BC ;lydian
i 2 + 1 1.5 $BO0.65*0/2$BC $BO8+.02$BC ;lydian
i 2 + 1 3 $BO0.3*0/2$BC $BO8+.04$BC ;lydian
i 2 + 1 1.25 $BO0.7*0/2$BC $BO8+.00$BC ;lydian
i 8 $BO0+0.75+$CNT*12$BC 1 0.5 $BO0.25*0/2$BC $BO8+.11$BC ;lydian
i 8 + 1 1.5 $BO0.9*0/2$BC $BO8+.12$BC ;lydian
i 8 + 1 1.5 $BO0.05*0/2$BC $BO8+.12$BC ;lydian
i 8 + 1 1.5 $BO0.85*1/2$BC $BO8+.11$BC ;lydian
i 8 + 1 0.25 $BO0.2*0/2$BC $BO8+.07$BC ;lydian
i 8 + 1 0.5 $BO0.1*0/2$BC $BO8+.06$BC ;lydian
i 8 + 1 3 $BO0.25*1/2$BC $BO8+.00$BC ;lydian
i 8 + 1 0.25 $BO0.4*0/2$BC $BO8+.00$BC ;lydian
i 8 + 1 0.5 $BO0.45*1/2$BC $BO8+.00$BC ;lydian
i 8 + 1 3 $BO0.1*1/2$BC $BO8+.02$BC ;lydian
i 8 + 1 1.5 $BO0.05*0/2$BC $BO8+.02$BC ;lydian
i 8 + 1 0.75 $BO0.15*0/2$BC $BO8+.09$BC ;lydian

}
b [12*2]
{ 4 CNT
i 8 $BO0+0+$CNT*12$BC 1 0.5 $BO0.15*1/4$BC $BO8+.10$BC ;phrygian
i 8 + 1 0.5 $BO0.2*0/4$BC $BO8+.00$BC ;phrygian
i 8 + 1 0.25 $BO0.95*0/4$BC $BO8+.10$BC ;phrygian
i 8 + 1 1.5 $BO0.7*1/4$BC $BO8+.10$BC ;phrygian
i 8 + 1 0.25 $BO0.4*1/4$BC $BO8+.01$BC ;phrygian
i 8 + 1 0.25 $BO0.3*1/4$BC $BO8+.12$BC ;phrygian
i 8 + 1 2.75 $BO0.65*0/4$BC $BO8+.03$BC ;phrygian
i 8 + 1 3 $BO0.05*0/4$BC $BO8+.07$BC ;phrygian
i 8 + 1 0.5 $BO0.05*0/4$BC $BO8+.08$BC ;phrygian
i 8 + 1 2.75 $BO0.8*0/4$BC $BO8+.00$BC ;phrygian
i 8 + 1 0.75 $BO0.3*0/4$BC $BO8+.10$BC ;phrygian
i 8 + 1 0.5 $BO0.45*0/4$BC $BO8+.10$BC ;phrygian
i 11 $BO0+0.25+$CNT*12$BC 1 0.25 $BO0.65*0/4$BC $BO8+.00$BC ;phrygian
i 11 + 1 0.25 $BO0.05*1/4$BC $BO8+.00$BC ;phrygian
i 11 + 1 1 $BO0.1*0/4$BC $BO8+.00$BC ;phrygian
i 11 + 1 0.25 $BO0.8*0/4$BC $BO8+.00$BC ;phrygian
i 11 + 1 1 $BO0.3*1/4$BC $BO8+.12$BC ;phrygian
i 11 + 1 1.5 $BO0.5*1/4$BC $BO8+.01$BC ;phrygian
i 11 + 1 0.5 $BO0.1*1/4$BC $BO8+.00$BC ;phrygian
i 11 + 1 0.5 $BO0.9*1/4$BC $BO8+.01$BC ;phrygian
i 11 + 1 2.75 $BO0.4*1/4$BC $BO8+.05$BC ;phrygian
i 11 + 1 1.5 $BO0.05*0/4$BC $BO8+.07$BC ;phrygian
i 11 + 1 0.25 $BO0.7*0/4$BC $BO8+.00$BC ;phrygian
i 11 + 1 0.5 $BO0.25*1/4$BC $BO8+.00$BC ;phrygian
i 4 $BO0+0.5+$CNT*12$BC 1 0.5 $BO0.2*0/4$BC $BO8+.00$BC ;phrygian
i 4 + 1 1.25 $BO0.35*0/4$BC $BO8+.00$BC ;phrygian
i 4 + 1 1.25 $BO0.6*0/4$BC $BO8+.00$BC ;phrygian
i 4 + 1 2.75 $BO0.55*0/4$BC $BO8+.08$BC ;phrygian
i 4 + 1 0.25 $BO0.1*0/4$BC $BO8+.07$BC ;phrygian
i 4 + 1 0.75 $BO0.45*0/4$BC $BO8+.10$BC ;phrygian
i 4 + 1 1.5 $BO0.5*0/4$BC $BO8+.00$BC ;phrygian
i 4 + 1 0.25 $BO0.1*1/4$BC $BO8+.08$BC ;phrygian
i 4 + 1 1.5 $BO0.55*0/4$BC $BO8+.12$BC ;phrygian
i 4 + 1 3 $BO0.6*0/4$BC $BO8+.07$BC ;phrygian
i 4 + 1 3 $BO0.05*0/4$BC $BO8+.00$BC ;phrygian
i 4 + 1 0.5 $BO0.05*0/4$BC $BO8+.05$BC ;phrygian
i 1 $BO0+0+$CNT*12$BC 1 1.25 $BO0.75*0/4$BC $BO8+.03$BC ;phrygian
i 1 + 1 0.25 $BO0.55*0/4$BC $BO8+.05$BC ;phrygian
i 1 + 1 0.75 $BO0.7*1/4$BC $BO8+.05$BC ;phrygian
i 1 + 1 1.25 $BO0.65*1/4$BC $BO8+.00$BC ;phrygian
i 1 + 1 0.25 $BO0.95*0/4$BC $BO8+.01$BC ;phrygian
i 1 + 1 0.25 $BO0.9*1/4$BC $BO8+.08$BC ;phrygian
i 1 + 1 1.25 $BO0.05*0/4$BC $BO8+.00$BC ;phrygian
i 1 + 1 0.25 $BO0.95*0/4$BC $BO8+.07$BC ;phrygian
i 1 + 1 0.5 $BO0.85*1/4$BC $BO8+.01$BC ;phrygian
i 1 + 1 0.25 $BO0.8*0/4$BC $BO8+.08$BC ;phrygian
i 1 + 1 0.5 $BO0.6*1/4$BC $BO8+.01$BC ;phrygian
i 1 + 1 0.25 $BO0.25*0/4$BC $BO8+.00$BC ;phrygian

}
output = output.replace("$BO","[")
output = output.replace("$BC","]")
</CsScore>
</CsoundSynthesizer>