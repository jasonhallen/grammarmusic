
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

instr 2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24
    p3=4
	if ftchnls(p1) == 1 then
		asigl loscil p5, 1, p1, 1, 0
		asigr = asigl
	elseif ftchnls(p1) == 2 then
	    asigl, asigr loscil p5, 1, p1, 1, 0
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
t 0 250
; phrygian emu
 b [(6*4*8*1)-6*4*7]

{ 7 CNT
((None))note1(( ))note2(( ))note3(( ))note4(( ))note5(( ))note6(( ))note7(( ))note8(( ))note9(( ))note10(( ))note11(( ))note12(( ))note13(( ))note14(( ))note15(( ))note16(( ))note17(( ))note18(( ))note19(( ))note20(( ))note21(( ))note22(( ))note23(( ))note24}


b [(6*4*8*1)-6*4*6]

{ 6 CNT
((None))note1(( ))note2(( ))note3(( ))note4(( ))note5(( ))note6(( ))note7(( ))note8(( ))note9(( ))note10(( ))note11(( ))note12(( ))note13(( ))note14(( ))note15(( ))note16(( ))note17(( ))note18(( ))note19(( ))note20(( ))note21(( ))note22(( ))note23(( ))note24}


b [(6*4*8*1)-6*4*7]

{ 7 CNT
((None))note1(( ))note2(( ))note3(( ))note4(( ))note5(( ))note6(( ))note7(( ))note8(( ))note9(( ))note10(( ))note11(( ))note12(( ))note13(( ))note14(( ))note15(( ))note16(( ))note17(( ))note18(( ))note19(( ))note20(( ))note21(( ))note22(( ))note23(( ))note24}


b [(6*4*8*1)-6*4*5]

{ 5 CNT
((None))note1(( ))note2(( ))note3(( ))note4(( ))note5(( ))note6(( ))note7(( ))note8(( ))note9(( ))note10(( ))note11(( ))note12(( ))note13(( ))note14(( ))note15(( ))note16(( ))note17(( ))note18(( ))note19(( ))note20(( ))note21(( ))note22(( ))note23(( ))note24}


b [(6*4*8*1)-4*4*6]

{ 6 CNT
((None))note1(( ))note2(( ))note3(( ))note4(( ))note5(( ))note6(( ))note7(( ))note8(( ))note9(( ))note10(( ))note11(( ))note12(( ))note13(( ))note14(( ))note15(( ))note16}


b [(6*4*8*1)-6*4*8]

{ 8 CNT
((None))note1(( ))note2(( ))note3(( ))note4(( ))note5(( ))note6(( ))note7(( ))note8(( ))note9(( ))note10(( ))note11(( ))note12(( ))note13(( ))note14(( ))note15(( ))note16(( ))note17(( ))note18(( ))note19(( ))note20(( ))note21(( ))note22(( ))note23(( ))note24}






</CsScore>
</CsoundSynthesizer>