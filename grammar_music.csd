<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 10
0dbfs = 1

instr 1

	kenv expseg 0.001, p3*0.1, p4, p3*0.8, p4, p3*0.1, 0.001
	asig oscil 0.5, cpspch(p5)
	out asig

endin

instr 2

	if ftchnls(1) == 1 then
		asigl loscil p4, 1, 1, 1, 0
		asigr = asigl
	elseif ftchnls(1) == 2 then
	    asigl, asigr loscil p4, 1, 1, 1, 0
	endif
	out asigl

endin

instr 3

	if ftchnls(2) == 1 then
		asigl loscil p4, 1, 2, 1, 0
		asigr = asigl
	elseif ftchnls(2) == 2 then
	    asigl, asigr loscil p4, 1, 2, 1, 0
	endif
	out asigl

endin

instr 4

	if ftchnls(3) == 1 then
		asigl loscil p4, 1, 3, 1, 0
		asigr = asigl
	elseif ftchnls(3) == 2 then
	    asigl, asigr loscil p4, 1, 3, 1, 0
	endif
	out asigl

endin

instr 5

	if ftchnls(4) == 1 then
		asigl loscil p4, 1, 4, 1, 0
		asigr = asigl
	elseif ftchnls(4) == 2 then
	    asigl, asigr loscil p4, 1, 4, 1, 0
	endif
	out asigl

endin

instr 6

	if ftchnls(5) == 1 then
		asigl loscil p4, 1, 5, 1, 0
		asigr = asigl
	elseif ftchnls(5) == 2 then
	    asigl, asigr loscil p4, 1, 5, 1, 0
	endif
	out asigl

endin

instr 7

	if ftchnls(6) == 1 then
		asigl loscil p4, 1, 6, 1, 0
		asigr = asigl
	elseif ftchnls(6) == 2 then
	    asigl, asigr loscil p4, 1, 6, 1, 0
	endif
	out asigl

endin

instr 8

	if ftchnls(7) == 1 then
		asigl loscil p4, 1, 7, 1, 0
		asigr = asigl
	elseif ftchnls(7) == 2 then
	    asigl, asigr loscil p4, 1, 7, 1, 0
	endif
	out asigl
	print p1, p2, p3, p4, p5, p6

endin

instr 9

	if ftchnls(8) == 1 then
		asigl loscil p4, 1, 8, 1, 0
		asigr = asigl
	elseif ftchnls(8) == 2 then
	    asigl, asigr loscil p4, 1, 8, 1, 0
	endif
	out asigl

endin

instr 10

	if ftchnls(9) == 1 then
		asigl loscil p4, 1, 9, 1, 0
		asigr = asigl
	elseif ftchnls(9) == 2 then
	    asigl, asigr loscil p4, 1, 9, 1, 0
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


r 2 REPEAT
t 0 120
/*i 1 [0+0.25] 1.25 [0.45*0] 8.11 $REPEAT
i 1 ^+1 0.25 [0.95*0] 8.02 $REPEAT
i 1 ^+1 2.75 [0.3*0] 8.02 $REPEAT
i 1 ^+1 1 [0.1*1] 8.01 $REPEAT
i 1 ^+1 1 [0.45*0] 8.06 $REPEAT
i 1 ^+1 2.75 [0.8*1] 8.11 $REPEAT
i 1 ^+1 0.25 [0.9*0] 8.10 $REPEAT
i 1 ^+1 0.75 [0.45*1] 8.10 $REPEAT
i 1 ^+1 1 [0.55*1] 8.10 $REPEAT
i 1 ^+1 0.75 [0.2*1] 8.05 $REPEAT
i 1 ^+1 0.25 [0.95*1] 8.02 $REPEAT
i 1 ^+1 1 [0.65*0] 8.08 $REPEAT
i 1 ^+1 1 [0.25*1] 8.04 $REPEAT
i 1 ^+1 0.75 [0.8*0] 8.07 $REPEAT
i 1 ^+1 0.5 [0.7*0] 8.09 $REPEAT
i 1 ^+1 1.25 [0.5*0] 8.03 $REPEAT*/
i 7 [0+0] 1.25 [0.05*0] 8.09 $REPEAT
i 7 ^+1 2.75 [0.1*0] 8.05 $REPEAT
i 7 ^+1 1 [0.6*0] 8.02 $REPEAT
i 7 ^+1 1.25 [0.65*1] 8.06 $REPEAT
i 7 ^+1 1 [0.95*0] 8.10 $REPEAT
i 7 ^+1 0.25 [0.1*1] 8.07 $REPEAT
i 7 ^+1 1 [0.7*0] 8.09 $REPEAT
i 7 ^+1 3 [0.5*0] 8.11 $REPEAT
i 7 ^+1 1.5 [0.4*0] 8.02 $REPEAT
i 7 ^+1 1.25 [0.6*1] 8.04 $REPEAT
i 7 ^+1 0.25 [0.45*0] 8.10 $REPEAT
i 7 ^+1 0.25 [0.1*1] 8.05 $REPEAT
i 7 ^+1 0.25 [0.2*0] 8.03 $REPEAT
i 7 ^+1 2.75 [0.7*1] 8.05 $REPEAT
i 7 ^+1 0.75 [0.9*0] 8.02 $REPEAT
i 7 ^+1 0.25 [0.9*0] 8.08 $REPEAT
/*i 8 [0+0.75] 0.75 [0.8*1] 8.04 $REPEAT
i 8 ^+1 0.75 [0.4*0] 8.08 $REPEAT
i 8 ^+1 0.5 [0.5*1] 8.01 $REPEAT
i 8 ^+1 2.75 [0.8*0] 8.06 $REPEAT
i 8 ^+1 3 [0.3*0] 8.09 $REPEAT
i 8 ^+1 0.5 [0.1*1] 8.03 $REPEAT
i 8 ^+1 0.5 [0.05*0] 8.01 $REPEAT
i 8 ^+1 2.75 [0.6*1] 8.11 $REPEAT
i 8 ^+1 0.25 [0.5*1] 8.01 $REPEAT
i 8 ^+1 0.25 [0.9*0] 8.10 $REPEAT
i 8 ^+1 0.25 [0.75*0] 8.06 $REPEAT
i 8 ^+1 3 [0.65*0] 8.08 $REPEAT
i 8 ^+1 0.5 [0.8*1] 8.02 $REPEAT
i 8 ^+1 2.75 [0.1*0] 8.05 $REPEAT
i 8 ^+1 3 [0.5*0] 8.06 $REPEAT
i 8 ^+1 2.75 [0.25*0] 8.03 $REPEAT
i 4 [0+0.5] 1 [0.25*0] 8.07 $REPEAT
i 4 ^+1 1.25 [0.45*1] 8.11 $REPEAT
i 4 ^+1 1.5 [0.15*0] 8.01 $REPEAT
i 4 ^+1 0.75 [0.05*1] 8.02 $REPEAT
i 4 ^+1 0.5 [0.4*0] 8.09 $REPEAT
i 4 ^+1 1.5 [0.65*1] 8.06 $REPEAT
i 4 ^+1 2.75 [0.4*0] 8.04 $REPEAT
i 4 ^+1 1.25 [0.75*1] 8.07 $REPEAT
i 4 ^+1 0.75 [0.7*1] 8.05 $REPEAT
i 4 ^+1 0.75 [0.5*0] 8.09 $REPEAT
i 4 ^+1 1 [0.95*0] 8.05 $REPEAT
i 4 ^+1 1.5 [0.8*1] 8.01 $REPEAT
i 4 ^+1 3 [0.35*1] 8.11 $REPEAT
i 4 ^+1 2.75 [0.25*1] 8.04 $REPEAT
i 4 ^+1 0.75 [0.1*1] 8.05 $REPEAT
i 4 ^+1 1.5 [0.75*0] 8.06 $REPEAT
*/


</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
