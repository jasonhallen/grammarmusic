
<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 10
0dbfs = 1

instr 1 ;STRING PLUCK
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

instr 25 ;ORGAN
  ifrq = cpspch(p6)
  kenv madsr 0.001,0.5,0.7,0.2
  a1     oscili 8/43,   1      * ifrq
  a2     oscili 8/43,   2      * ifrq
  a3     oscili 8/43,   2.9966 * ifrq
  a4     oscili 8/43,   4      * ifrq
  a5     oscili 3/43,   5.9932 * ifrq
  a6     oscili 2/43,   8      * ifrq
  a7     oscili 1/43,  10.0794 * ifrq
  a8     oscili 1/43,  11.9864 * ifrq
  a9     oscili 4/43,  16      * ifrq
  aorgan = kenv*p5*(a1+a2+a3+a4+a5+a6+a7+a8+a9)
  out aorgan
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
; phrygian tr808 voices=7
t 0 320
b [(6*4*8*1)-5*4*5]

{ 5 CNT
i 5 [0+0+$CNT*5*4] 1 0.25 [0.8*0/7] [8+.12]
 i 5 + 1 1 [0.7*0/7] [8+.05]
 i 5 + 1 0.75 [0.25*0/7] [8+.08]
 i 5 + 1 3 [0.95*1/7] [8+.12]
 i 5 + 1 2.75 [0.3*1/7] [8+.10]
 i 5 + 1 0.5 [0.25*0/7] [8+.03]
 i 5 + 1 0.75 [0.95*0/7] [8+.10]
 i 5 + 1 2.75 [0.35*0/7] [8+.00]
 i 5 + 1 0.25 [0.35*0/7] [8+.12]
 i 5 + 1 0.5 [0.2*0/7] [8+.01]
 i 5 + 1 0.25 [0.85*0/7] [8+.00]
 i 5 + 1 3 [0.45*1/7] [8+.00]
 i 5 + 1 0.25 [0.2*1/7] [8+.01]
 i 5 + 1 3 [0.8*0/7] [8+.12]
 i 5 + 1 1.5 [0.75*0/7] [8+.03]
 i 5 + 1 0.75 [0.3*0/7] [8+.03]
 i 5 + 1 0.5 [0.3*0/7] [8+.10]
 i 5 + 1 0.5 [0.6*1/7] [8+.00]
 i 5 + 1 0.5 [0.85*1/7] [8+.00]
 i 5 + 1 0.5 [0.95*0/7] [8+.05]
}


i 5 + 1 0.25 [0.7*0/7] [8+.08]
 i 5 + 1 3 [0.9*0/7] [8+.08]
 i 5 + 1 0.75 [0.25*0/7] [8+.08]
 i 5 + 1 3 [0.95*1/7] [8+.12]
 i 5 + 1 2.75 [0.3*1/7] [8+.10]
 i 5 + 1 0.25 [0.7*0/7] [8+.05]
 i 5 + 1 0.75 [0.95*0/7] [8+.10]
 i 5 + 1 2.75 [0.35*0/7] [8+.00]
 i 5 + 1 0.25 [0.35*0/7] [8+.12]
 i 5 + 1 0.5 [0.2*0/7] [8+.01]
 i 5 + 1 0.25 [0.85*0/7] [8+.00]
 i 5 + 1 3 [0.45*1/7] [8+.00]
 i 5 + 1 0.5 [0.25*0/7] [8+.08]
 i 5 + 1 3 [0.8*0/7] [8+.12]
 i 5 + 1 1.5 [0.75*0/7] [8+.03]
 i 5 + 1 0.75 [0.3*0/7] [8+.03]
 i 5 + 1 0.5 [0.3*0/7] [8+.10]
 i 5 + 1 0.5 [0.6*1/7] [8+.00]
 i 5 + 1 0.25 [0.6*0/7] [8+.00]
 i 5 + 1 1.5 [0.25*1/7] [8+.10]
 i 5 + 1 1.25 [0.95*0/7] [8+.08]
 i 5 + 1 3 [0.9*0/7] [8+.08]
 i 5 + 1 0.75 [0.85*1/7] [8+.00]
 i 5 + 1 3 [0.95*1/7] [8+.12]
 i 5 + 1 2.75 [0.3*1/7] [8+.10]
 i 5 + 1 0.25 [0.5*0/7] [8+.12]
 i 5 + 1 0.75 [0.95*0/7] [8+.10]
 i 5 + 1 2.75 [0.35*0/7] [8+.00]
 i 5 + 1 0.25 [0.35*0/7] [8+.12]
 i 5 + 1 0.5 [0.2*0/7] [8+.01]
 i 5 + 1 0.25 [0.85*0/7] [8+.00]
 i 5 + 1 3 [0.45*1/7] [8+.00]
 i 5 + 1 0.5 [0.25*0/7] [8+.08]
 i 5 + 1 3 [0.8*0/7] [8+.12]
 i 5 + 1 1.5 [0.75*0/7] [8+.03]
 i 5 + 1 0.75 [0.3*0/7] [8+.03]
 i 5 + 1 0.25 [0.8*1/7] [8+.01]
 i 5 + 1 0.5 [0.6*1/7] [8+.00]
 i 5 + 1 0.25 [0.6*0/7] [8+.00]
 i 5 + 1 1.5 [0.25*1/7] [8+.10]
 i 5 + 1 1.25 [0.95*0/7] [8+.08]
 i 5 + 1 3 [0.9*0/7] [8+.08]
 i 5 + 1 0.75 [0.85*1/7] [8+.00]
 i 5 + 1 3 [0.95*1/7] [8+.12]
 i 5 + 1 0.5 [0.75*0/7] [8+.07]
 i 5 + 1 0.5 [0.75*0/7] [8+.00]
 i 5 + 1 0.25 [0.35*1/7] [8+.01]
 i 5 + 1 2.75 [0.35*0/7] [8+.00]
 i 5 + 1 0.25 [0.8*0/7] [8+.05]
 i 5 + 1 0.5 [0.2*0/7] [8+.01]
 i 5 + 1 0.25 [0.85*0/7] [8+.00]
 i 5 + 1 3 [0.45*1/7] [8+.00]
 i 5 + 1 0.5 [0.25*0/7] [8+.08]
 i 5 + 1 3 [0.8*0/7] [8+.12]
 i 5 + 1 1.5 [0.75*0/7] [8+.03]
 i 5 + 1 0.75 [0.3*0/7] [8+.03]
 i 5 + 1 0.25 [0.8*1/7] [8+.01]
 i 5 + 1 0.5 [0.6*1/7] [8+.00]
 i 5 + 1 0.25 [0.6*0/7] [8+.00]
 i 5 + 1 1.5 [0.25*1/7] [8+.10]
 i 5 + 1 1.25 [0.95*0/7] [8+.08]
 i 5 + 1 3 [0.9*0/7] [8+.08]
 i 5 + 1 0.75 [0.85*1/7] [8+.00]
 i 5 + 1 3 [0.95*1/7] [8+.12]
 i 5 + 1 0.5 [0.75*0/7] [8+.07]
 i 5 + 1 0.5 [0.75*0/7] [8+.00]
 i 5 + 1 0.25 [0.35*1/7] [8+.01]
 i 5 + 1 0.5 [0.2*1/7] [8+.01]
 i 5 + 1 0.5 [0.4*1/7] [8+.05]
 i 5 + 1 0.5 [0.2*0/7] [8+.01]
 i 5 + 1 0.25 [0.85*0/7] [8+.00]
 i 5 + 1 3 [0.45*1/7] [8+.00]
 i 5 + 1 0.5 [0.25*0/7] [8+.08]
 i 5 + 1 3 [0.8*0/7] [8+.12]
 i 5 + 1 1.5 [0.75*0/7] [8+.03]
 i 5 + 1 0.75 [0.3*0/7] [8+.03]
 i 5 + 1 0.25 [0.8*1/7] [8+.01]
 i 5 + 1 0.5 [0.6*1/7] [8+.00]
 i 5 + 1 0.25 [0.6*0/7] [8+.00]
 i 5 + 1 1.5 [0.25*1/7] [8+.10]
 i 5 + 1 1.25 [0.95*0/7] [8+.08]
 i 5 + 1 3 [0.9*0/7] [8+.08]
 i 5 + 1 0.75 [0.85*1/7] [8+.00]
 i 5 + 1 3 [0.95*1/7] [8+.12]
 i 5 + 1 1.25 [0.3*0/7] [8+.03]
 i 5 + 1 0.5 [0.75*0/7] [8+.00]
 i 5 + 1 0.25 [0.35*1/7] [8+.01]
 i 5 + 1 0.5 [0.2*1/7] [8+.01]
 i 5 + 1 3 [0.35*0/7] [8+.12]
 i 5 + 1 0.5 [0.2*0/7] [8+.01]
 i 5 + 1 0.25 [0.85*0/7] [8+.00]
 i 5 + 1 3 [0.45*1/7] [8+.00]
 i 5 + 1 0.5 [0.25*0/7] [8+.08]
 i 5 + 1 3 [0.8*0/7] [8+.12]
 i 5 + 1 1.5 [0.75*0/7] [8+.03]
 i 5 + 1 0.75 [0.3*0/7] [8+.03]
 i 5 + 1 0.25 [0.8*1/7] [8+.01]
 i 5 + 1 0.5 [0.6*1/7] [8+.00]
 i 5 + 1 0.25 [0.6*0/7] [8+.00]
 i 5 + 1 1.5 [0.25*1/7] [8+.10]
 i 5 + 1 1.25 [0.95*0/7] [8+.08]
 i 5 + 1 3 [0.9*0/7] [8+.08]
 i 5 + 1 0.75 [0.85*1/7] [8+.00]
 i 5 + 1 3 [0.95*1/7] [8+.12]
 i 5 + 1 1.25 [0.3*0/7] [8+.03]
 i 5 + 1 0.5 [0.75*0/7] [8+.00]
 i 5 + 1 0.25 [0.35*1/7] [8+.01]
 i 5 + 1 0.5 [0.2*1/7] [8+.01]
 i 5 + 1 3 [0.35*0/7] [8+.12]
 i 5 + 1 1.25 [0.6*1/7] [8+.08]
 i 5 + 1 0.25 [0.85*0/7] [8+.00]
 i 5 + 1 3 [0.45*1/7] [8+.00]
 i 5 + 1 0.5 [0.25*0/7] [8+.08]
 i 5 + 1 3 [0.8*0/7] [8+.12]
 i 5 + 1 1.5 [0.75*0/7] [8+.03]
 i 5 + 1 2.75 [0.7*0/7] [8+.12]
 i 5 + 1 0.25 [0.8*1/7] [8+.01]
 i 5 + 1 0.5 [0.6*1/7] [8+.00]
 i 5 + 1 0.25 [0.6*0/7] [8+.00]
 i 5 + 1 1.5 [0.25*1/7] [8+.10]



b [(6*4*8*1)-3*4*8]

{ 8 CNT
i 10 [0+0+$CNT*3*4] 1 1.25 [0.9*0/7] [7+.00]
 i 10 + 1 0.25 [0.55*0/7] [7+.10]
 i 10 + 1 0.25 [0.55*0/7] [7+.01]
 i 10 + 1 0.75 [0.85*0/7] [7+.07]
 i 10 + 1 1 [0.75*0/7] [7+.00]
 i 10 + 1 0.25 [0.55*0/7] [7+.00]
 i 10 + 1 0.5 [0.8*0/7] [7+.07]
 i 10 + 1 3 [0.3*0/7] [7+.00]
 i 10 + 1 3 [0.8*1/7] [7+.08]
 i 10 + 1 0.25 [0.5*0/7] [7+.10]
 i 10 + 1 1.5 [0.5*1/7] [7+.00]
 i 10 + 1 0.5 [0.75*0/7] [7+.03]
}


i 10 + 1 0.5 [0.95*0/7] [7+.10]
 i 10 + 1 0.25 [0.55*0/7] [7+.10]
 i 10 + 1 0.25 [0.55*0/7] [7+.01]
 i 10 + 1 0.75 [0.85*0/7] [7+.07]
 i 10 + 1 1 [0.75*0/7] [7+.00]
 i 10 + 1 0.25 [0.55*0/7] [7+.00]
 i 10 + 1 0.5 [0.8*0/7] [7+.07]
 i 10 + 1 3 [0.3*0/7] [7+.00]
 i 10 + 1 3 [0.8*1/7] [7+.08]
 i 10 + 1 0.25 [0.5*0/7] [7+.10]
 i 10 + 1 1.5 [0.5*1/7] [7+.00]
 i 10 + 1 0.5 [0.75*0/7] [7+.03]
 i 10 + 1 0.5 [0.95*0/7] [7+.10]
 i 10 + 1 0.25 [0.55*0/7] [7+.10]
 i 10 + 1 0.25 [0.55*0/7] [7+.01]
 i 10 + 1 0.75 [0.85*0/7] [7+.07]
 i 10 + 1 1 [0.75*0/7] [7+.00]
 i 10 + 1 0.25 [0.55*0/7] [7+.00]
 i 10 + 1 0.5 [0.8*0/7] [7+.07]
 i 10 + 1 3 [0.3*0/7] [7+.00]
 i 10 + 1 3 [0.8*1/7] [7+.08]
 i 10 + 1 0.25 [0.5*0/7] [7+.10]
 i 10 + 1 1.5 [0.5*1/7] [7+.00]
 i 10 + 1 0.5 [0.75*0/7] [7+.03]
 i 10 + 1 0.5 [0.95*0/7] [7+.10]
 i 10 + 1 0.25 [0.55*0/7] [7+.10]
 i 10 + 1 0.25 [0.55*0/7] [7+.01]
 i 10 + 1 0.5 [0.55*0/7] [7+.01]
 i 10 + 1 1 [0.75*0/7] [7+.00]
 i 10 + 1 0.25 [0.55*0/7] [7+.00]
 i 10 + 1 0.5 [0.8*0/7] [7+.07]
 i 10 + 1 0.25 [0.25*0/7] [7+.05]
 i 10 + 1 3 [0.8*1/7] [7+.08]
 i 10 + 1 0.25 [0.5*0/7] [7+.10]
 i 10 + 1 1.5 [0.5*1/7] [7+.00]
 i 10 + 1 0.5 [0.75*0/7] [7+.03]
 i 10 + 1 0.5 [0.95*0/7] [7+.10]
 i 10 + 1 0.25 [0.55*0/7] [7+.10]
 i 10 + 1 0.25 [0.55*0/7] [7+.01]
 i 10 + 1 0.5 [0.55*0/7] [7+.01]
 i 10 + 1 1 [0.75*0/7] [7+.00]
 i 10 + 1 0.25 [0.55*0/7] [7+.00]
 i 10 + 1 0.5 [0.8*0/7] [7+.07]
 i 10 + 1 0.25 [0.25*0/7] [7+.05]
 i 10 + 1 2.75 [0.3*0/7] [7+.03]
 i 10 + 1 0.25 [0.5*0/7] [7+.10]
 i 10 + 1 1.5 [0.5*1/7] [7+.00]
 i 10 + 1 0.5 [0.75*0/7] [7+.03]
 i 10 + 1 0.5 [0.95*0/7] [7+.10]
 i 10 + 1 0.25 [0.55*0/7] [7+.10]
 i 10 + 1 0.25 [0.55*0/7] [7+.01]
 i 10 + 1 0.5 [0.55*0/7] [7+.01]
 i 10 + 1 0.25 [0.6*1/7] [7+.07]
 i 10 + 1 1.5 [0.3*0/7] [7+.00]
 i 10 + 1 0.5 [0.8*0/7] [7+.07]
 i 10 + 1 0.25 [0.25*0/7] [7+.05]
 i 10 + 1 2.75 [0.3*0/7] [7+.03]
 i 10 + 1 0.25 [0.5*0/7] [7+.10]
 i 10 + 1 1.5 [0.5*1/7] [7+.00]
 i 10 + 1 0.5 [0.45*0/7] [7+.05]
 i 10 + 1 0.5 [0.95*0/7] [7+.10]
 i 10 + 1 0.25 [0.55*0/7] [7+.10]
 i 10 + 1 0.25 [0.55*0/7] [7+.01]
 i 10 + 1 0.5 [0.55*0/7] [7+.01]
 i 10 + 1 0.25 [0.6*1/7] [7+.07]
 i 10 + 1 0.25 [0.25*0/7] [7+.10]
 i 10 + 1 0.5 [0.8*0/7] [7+.07]
 i 10 + 1 0.25 [0.25*0/7] [7+.05]
 i 10 + 1 2.75 [0.3*0/7] [7+.03]
 i 10 + 1 1.25 [0.55*0/7] [7+.01]
 i 10 + 1 1.5 [0.5*1/7] [7+.00]
 i 10 + 1 0.5 [0.45*0/7] [7+.05]



b [(6*4*8*1)-5*4*7]

{ 7 CNT
i 7 [0+0+$CNT*5*4] 1 3 [0.25*0/7] [6+.08]
 i 7 + 1 1.25 [0.2*0/7] [6+.03]
 i 7 + 1 1 [0.45*0/7] [6+.10]
 i 7 + 1 0.5 [0.2*1/7] [6+.10]
 i 7 + 1 2.75 [0.85*0/7] [6+.07]
 i 7 + 1 0.25 [0.2*1/7] [6+.01]
 i 7 + 1 1 [0.85*0/7] [6+.01]
 i 7 + 1 0.5 [0.9*0/7] [6+.00]
 i 7 + 1 1.5 [0.35*0/7] [6+.00]
 i 7 + 1 1.5 [0.5*0/7] [6+.08]
 i 7 + 1 0.75 [0.45*0/7] [6+.08]
 i 7 + 1 2.75 [0.8*1/7] [6+.05]
 i 7 + 1 0.5 [0.25*0/7] [6+.07]
 i 7 + 1 0.25 [0.8*0/7] [6+.10]
 i 7 + 1 1 [0.85*0/7] [6+.03]
 i 7 + 1 0.75 [0.8*0/7] [6+.08]
 i 7 + 1 2.75 [0.45*0/7] [6+.00]
 i 7 + 1 1.25 [0.4*1/7] [6+.10]
 i 7 + 1 2.75 [0.85*0/7] [6+.05]
 i 7 + 1 0.5 [0.2*0/7] [6+.03]
}


i 7 + 1 0.5 [0.55*0/7] [6+.00]
 i 7 + 1 1.25 [0.2*0/7] [6+.03]
 i 7 + 1 0.25 [0.5*1/7] [6+.12]
 i 7 + 1 0.5 [0.2*1/7] [6+.10]
 i 7 + 1 2.75 [0.85*0/7] [6+.07]
 i 7 + 1 0.25 [0.2*1/7] [6+.01]
 i 7 + 1 1 [0.85*0/7] [6+.01]
 i 7 + 1 0.5 [0.9*0/7] [6+.00]
 i 7 + 1 1.5 [0.35*0/7] [6+.00]
 i 7 + 1 1.5 [0.5*0/7] [6+.08]
 i 7 + 1 0.75 [0.45*0/7] [6+.08]
 i 7 + 1 2.75 [0.8*1/7] [6+.05]
 i 7 + 1 0.5 [0.25*0/7] [6+.07]
 i 7 + 1 0.25 [0.8*0/7] [6+.10]
 i 7 + 1 1 [0.85*0/7] [6+.03]
 i 7 + 1 0.75 [0.8*0/7] [6+.08]
 i 7 + 1 2.75 [0.45*0/7] [6+.00]
 i 7 + 1 1.25 [0.4*1/7] [6+.10]
 i 7 + 1 2.75 [0.85*0/7] [6+.05]
 i 7 + 1 0.5 [0.2*0/7] [6+.03]
 i 7 + 1 0.5 [0.55*0/7] [6+.00]
 i 7 + 1 1.25 [0.2*0/7] [6+.03]
 i 7 + 1 0.5 [0.55*1/7] [6+.00]
 i 7 + 1 0.5 [0.2*1/7] [6+.10]
 i 7 + 1 2.75 [0.85*0/7] [6+.07]
 i 7 + 1 0.25 [0.2*1/7] [6+.01]
 i 7 + 1 1 [0.85*0/7] [6+.01]
 i 7 + 1 0.5 [0.9*0/7] [6+.00]
 i 7 + 1 1.5 [0.35*0/7] [6+.00]
 i 7 + 1 1.5 [0.5*0/7] [6+.08]
 i 7 + 1 0.75 [0.45*0/7] [6+.08]
 i 7 + 1 2.75 [0.8*1/7] [6+.05]
 i 7 + 1 0.5 [0.25*0/7] [6+.07]
 i 7 + 1 0.25 [0.8*0/7] [6+.10]
 i 7 + 1 1 [0.85*0/7] [6+.03]
 i 7 + 1 0.75 [0.8*0/7] [6+.08]
 i 7 + 1 2.75 [0.45*0/7] [6+.00]
 i 7 + 1 1.25 [0.4*1/7] [6+.10]
 i 7 + 1 2.75 [0.85*0/7] [6+.05]
 i 7 + 1 0.5 [0.2*0/7] [6+.03]
 i 7 + 1 0.5 [0.55*0/7] [6+.00]
 i 7 + 1 1.25 [0.2*0/7] [6+.03]
 i 7 + 1 0.5 [0.55*1/7] [6+.00]
 i 7 + 1 0.5 [0.2*1/7] [6+.10]
 i 7 + 1 2.75 [0.85*0/7] [6+.07]
 i 7 + 1 0.25 [0.2*1/7] [6+.01]
 i 7 + 1 1 [0.85*0/7] [6+.01]
 i 7 + 1 0.5 [0.9*0/7] [6+.00]
 i 7 + 1 1.5 [0.35*0/7] [6+.00]
 i 7 + 1 1.5 [0.5*0/7] [6+.08]
 i 7 + 1 0.75 [0.45*0/7] [6+.08]
 i 7 + 1 2.75 [0.8*1/7] [6+.05]
 i 7 + 1 0.5 [0.25*0/7] [6+.07]
 i 7 + 1 0.25 [0.8*0/7] [6+.10]
 i 7 + 1 1 [0.85*0/7] [6+.03]
 i 7 + 1 0.75 [0.8*0/7] [6+.08]
 i 7 + 1 2.75 [0.45*0/7] [6+.00]
 i 7 + 1 1.25 [0.4*1/7] [6+.10]
 i 7 + 1 2.75 [0.85*0/7] [6+.05]
 i 7 + 1 0.5 [0.2*0/7] [6+.03]
 i 7 + 1 0.5 [0.55*0/7] [6+.00]
 i 7 + 1 1.25 [0.2*0/7] [6+.03]
 i 7 + 1 1.25 [0.65*0/7] [6+.08]
 i 7 + 1 0.5 [0.85*1/7] [6+.00]
 i 7 + 1 1.25 [0.75*0/7] [6+.05]
 i 7 + 1 0.25 [0.55*0/7] [6+.05]
 i 7 + 1 1 [0.85*0/7] [6+.01]
 i 7 + 1 0.5 [0.9*0/7] [6+.00]
 i 7 + 1 1.5 [0.35*0/7] [6+.00]
 i 7 + 1 1.5 [0.5*0/7] [6+.08]
 i 7 + 1 0.75 [0.45*0/7] [6+.08]
 i 7 + 1 2.75 [0.8*1/7] [6+.05]
 i 7 + 1 0.5 [0.25*0/7] [6+.07]
 i 7 + 1 0.25 [0.8*0/7] [6+.10]
 i 7 + 1 1 [0.85*0/7] [6+.03]
 i 7 + 1 0.75 [0.8*0/7] [6+.08]
 i 7 + 1 2.75 [0.45*0/7] [6+.00]
 i 7 + 1 1.25 [0.4*1/7] [6+.10]
 i 7 + 1 2.75 [0.85*0/7] [6+.05]
 i 7 + 1 0.5 [0.2*0/7] [6+.03]
 i 7 + 1 0.5 [0.55*0/7] [6+.00]
 i 7 + 1 1.25 [0.2*0/7] [6+.03]
 i 7 + 1 1.25 [0.65*0/7] [6+.08]
 i 7 + 1 0.5 [0.85*1/7] [6+.00]
 i 7 + 1 1.25 [0.75*0/7] [6+.05]
 i 7 + 1 0.25 [0.55*0/7] [6+.05]
 i 7 + 1 1 [0.85*0/7] [6+.01]
 i 7 + 1 0.5 [0.9*0/7] [6+.00]
 i 7 + 1 0.5 [0.55*0/7] [6+.00]
 i 7 + 1 1.5 [0.5*0/7] [6+.08]
 i 7 + 1 0.75 [0.45*0/7] [6+.08]
 i 7 + 1 0.5 [0.8*0/7] [6+.05]
 i 7 + 1 0.5 [0.25*0/7] [6+.07]
 i 7 + 1 0.25 [0.8*0/7] [6+.10]
 i 7 + 1 2.75 [0.45*0/7] [6+.07]
 i 7 + 1 0.75 [0.8*0/7] [6+.08]
 i 7 + 1 2.75 [0.45*0/7] [6+.00]
 i 7 + 1 0.25 [0.75*0/7] [6+.07]
 i 7 + 1 0.25 [0.9*1/7] [6+.07]
 i 7 + 1 0.5 [0.2*0/7] [6+.03]
 i 7 + 1 0.5 [0.55*0/7] [6+.00]
 i 7 + 1 1.25 [0.2*0/7] [6+.03]
 i 7 + 1 1.25 [0.65*0/7] [6+.08]
 i 7 + 1 0.5 [0.85*1/7] [6+.00]
 i 7 + 1 1.25 [0.75*0/7] [6+.05]
 i 7 + 1 0.25 [0.55*0/7] [6+.05]
 i 7 + 1 1 [0.85*0/7] [6+.01]
 i 7 + 1 0.5 [0.9*0/7] [6+.00]
 i 7 + 1 0.5 [0.55*0/7] [6+.00]
 i 7 + 1 0.5 [0.6*0/7] [6+.10]
 i 7 + 1 0.75 [0.45*0/7] [6+.08]
 i 7 + 1 0.5 [0.8*0/7] [6+.05]
 i 7 + 1 0.5 [0.25*0/7] [6+.07]
 i 7 + 1 0.25 [0.8*0/7] [6+.10]
 i 7 + 1 2.75 [0.45*0/7] [6+.07]
 i 7 + 1 0.75 [0.8*0/7] [6+.08]
 i 7 + 1 2.75 [0.45*0/7] [6+.00]
 i 7 + 1 0.25 [0.75*0/7] [6+.07]
 i 7 + 1 0.25 [0.9*1/7] [6+.07]
 i 7 + 1 0.5 [0.2*0/7] [6+.03]
 i 7 + 1 0.5 [0.55*0/7] [6+.00]
 i 7 + 1 1.25 [0.2*0/7] [6+.03]
 i 7 + 1 0.5 [0.3*1/7] [6+.00]
 i 7 + 1 0.5 [0.85*1/7] [6+.00]
 i 7 + 1 1.25 [0.75*0/7] [6+.05]
 i 7 + 1 0.25 [0.55*0/7] [6+.05]
 i 7 + 1 1 [0.85*0/7] [6+.01]
 i 7 + 1 0.5 [0.9*0/7] [6+.00]
 i 7 + 1 1.25 [0.6*0/7] [6+.12]
 i 7 + 1 0.5 [0.6*0/7] [6+.10]
 i 7 + 1 0.75 [0.45*0/7] [6+.08]
 i 7 + 1 0.5 [0.8*0/7] [6+.05]
 i 7 + 1 0.5 [0.25*0/7] [6+.07]
 i 7 + 1 0.25 [0.8*0/7] [6+.10]
 i 7 + 1 2.75 [0.45*0/7] [6+.07]
 i 7 + 1 0.75 [0.8*0/7] [6+.08]
 i 7 + 1 2.75 [0.45*0/7] [6+.00]
 i 7 + 1 0.5 [0.55*0/7] [6+.10]
 i 7 + 1 0.25 [0.75*1/7] [6+.07]
 i 7 + 1 0.5 [0.2*0/7] [6+.03]



b [(6*4*8*1)-4*4*7]

{ 7 CNT
i 1 [0+0+$CNT*4*4] 1 1.5 [0.5*0/7] [8+.08]
 i 1 + 1 2.75 [0.8*0/7] [8+.05]
 i 1 + 1 1 [0.55*0/7] [8+.10]
 i 1 + 1 3 [0.8*0/7] [8+.01]
 i 1 + 1 1.25 [0.65*1/7] [8+.10]
 i 1 + 1 1.5 [0.9*1/7] [8+.10]
 i 1 + 1 3 [0.45*0/7] [8+.08]
 i 1 + 1 0.5 [0.3*0/7] [8+.03]
 i 1 + 1 0.25 [0.65*0/7] [8+.05]
 i 1 + 1 0.25 [0.25*0/7] [8+.10]
 i 1 + 1 3 [0.4*0/7] [8+.01]
 i 1 + 1 0.5 [0.65*1/7] [8+.12]
 i 1 + 1 3 [0.85*0/7] [8+.08]
 i 1 + 1 3 [0.35*1/7] [8+.08]
 i 1 + 1 0.75 [0.6*0/7] [8+.00]
 i 1 + 1 0.25 [0.75*0/7] [8+.07]
}


i 1 + 1 0.25 [0.4*0/7] [8+.00]
 i 1 + 1 2.75 [0.8*0/7] [8+.05]
 i 1 + 1 1 [0.55*0/7] [8+.10]
 i 1 + 1 0.25 [0.35*0/7] [8+.10]
 i 1 + 1 1.25 [0.65*1/7] [8+.10]
 i 1 + 1 1.5 [0.9*1/7] [8+.10]
 i 1 + 1 3 [0.45*0/7] [8+.08]
 i 1 + 1 0.5 [0.3*0/7] [8+.03]
 i 1 + 1 0.25 [0.65*0/7] [8+.05]
 i 1 + 1 0.25 [0.25*0/7] [8+.10]
 i 1 + 1 3 [0.4*0/7] [8+.01]
 i 1 + 1 0.5 [0.65*1/7] [8+.12]
 i 1 + 1 3 [0.85*0/7] [8+.08]
 i 1 + 1 3 [0.35*1/7] [8+.08]
 i 1 + 1 0.75 [0.6*0/7] [8+.00]
 i 1 + 1 0.25 [0.75*0/7] [8+.07]
 i 1 + 1 0.25 [0.4*0/7] [8+.00]
 i 1 + 1 2.75 [0.8*0/7] [8+.05]
 i 1 + 1 1 [0.55*0/7] [8+.10]
 i 1 + 1 0.25 [0.35*0/7] [8+.10]
 i 1 + 1 1.25 [0.65*1/7] [8+.10]
 i 1 + 1 1.5 [0.9*1/7] [8+.10]
 i 1 + 1 3 [0.45*0/7] [8+.08]
 i 1 + 1 1 [0.55*0/7] [8+.03]
 i 1 + 1 0.25 [0.65*0/7] [8+.05]
 i 1 + 1 0.25 [0.25*0/7] [8+.10]
 i 1 + 1 0.25 [0.45*0/7] [8+.03]
 i 1 + 1 0.5 [0.65*1/7] [8+.12]
 i 1 + 1 3 [0.85*0/7] [8+.08]
 i 1 + 1 3 [0.35*1/7] [8+.08]
 i 1 + 1 0.75 [0.6*0/7] [8+.00]
 i 1 + 1 0.25 [0.75*0/7] [8+.07]
 i 1 + 1 0.25 [0.4*0/7] [8+.00]
 i 1 + 1 2.75 [0.8*0/7] [8+.05]
 i 1 + 1 1 [0.55*0/7] [8+.10]
 i 1 + 1 0.5 [0.65*0/7] [8+.12]
 i 1 + 1 1.25 [0.65*1/7] [8+.10]
 i 1 + 1 1.5 [0.9*1/7] [8+.10]
 i 1 + 1 3 [0.45*0/7] [8+.08]
 i 1 + 1 1 [0.55*0/7] [8+.03]
 i 1 + 1 0.25 [0.65*0/7] [8+.05]
 i 1 + 1 0.25 [0.8*0/7] [8+.03]
 i 1 + 1 0.25 [0.45*0/7] [8+.03]
 i 1 + 1 0.5 [0.65*1/7] [8+.12]
 i 1 + 1 3 [0.85*0/7] [8+.08]
 i 1 + 1 3 [0.35*1/7] [8+.08]
 i 1 + 1 0.75 [0.6*0/7] [8+.00]
 i 1 + 1 0.25 [0.75*0/7] [8+.07]
 i 1 + 1 0.25 [0.4*0/7] [8+.00]
 i 1 + 1 0.25 [0.8*1/7] [8+.08]
 i 1 + 1 1 [0.55*0/7] [8+.10]
 i 1 + 1 0.5 [0.65*0/7] [8+.12]
 i 1 + 1 1.25 [0.65*1/7] [8+.10]
 i 1 + 1 1.5 [0.9*1/7] [8+.10]
 i 1 + 1 3 [0.45*0/7] [8+.08]
 i 1 + 1 1 [0.55*0/7] [8+.03]
 i 1 + 1 0.25 [0.65*0/7] [8+.05]
 i 1 + 1 0.25 [0.8*0/7] [8+.03]
 i 1 + 1 0.5 [0.5*0/7] [8+.00]
 i 1 + 1 0.5 [0.65*1/7] [8+.12]
 i 1 + 1 3 [0.85*0/7] [8+.08]
 i 1 + 1 3 [0.35*1/7] [8+.08]
 i 1 + 1 0.75 [0.6*0/7] [8+.00]
 i 1 + 1 0.25 [0.75*0/7] [8+.07]
 i 1 + 1 2.75 [0.65*0/7] [8+.00]
 i 1 + 1 0.5 [0.3*0/7] [8+.05]
 i 1 + 1 1 [0.55*0/7] [8+.10]
 i 1 + 1 0.5 [0.65*0/7] [8+.12]
 i 1 + 1 1.25 [0.65*1/7] [8+.10]
 i 1 + 1 0.75 [0.55*0/7] [8+.00]
 i 1 + 1 3 [0.45*0/7] [8+.08]
 i 1 + 1 0.5 [0.65*0/7] [8+.08]
 i 1 + 1 1.5 [0.85*1/7] [8+.05]
 i 1 + 1 0.25 [0.8*0/7] [8+.03]
 i 1 + 1 0.75 [0.4*0/7] [8+.10]
 i 1 + 1 0.5 [0.65*1/7] [8+.12]
 i 1 + 1 3 [0.85*0/7] [8+.08]
 i 1 + 1 0.25 [0.5*0/7] [8+.07]
 i 1 + 1 0.75 [0.6*0/7] [8+.00]
 i 1 + 1 0.25 [0.75*0/7] [8+.07]
 i 1 + 1 2.75 [0.65*0/7] [8+.00]
 i 1 + 1 0.5 [0.3*0/7] [8+.05]
 i 1 + 1 1 [0.55*0/7] [8+.10]
 i 1 + 1 0.5 [0.65*0/7] [8+.12]
 i 1 + 1 1.25 [0.65*1/7] [8+.10]
 i 1 + 1 0.75 [0.55*0/7] [8+.00]
 i 1 + 1 3 [0.45*0/7] [8+.08]
 i 1 + 1 0.5 [0.65*0/7] [8+.08]
 i 1 + 1 1.5 [0.85*1/7] [8+.05]
 i 1 + 1 0.25 [0.8*0/7] [8+.03]
 i 1 + 1 0.75 [0.4*0/7] [8+.10]
 i 1 + 1 0.5 [0.65*1/7] [8+.12]
 i 1 + 1 3 [0.85*0/7] [8+.08]
 i 1 + 1 0.25 [0.5*0/7] [8+.07]
 i 1 + 1 0.75 [0.6*0/7] [8+.00]
 i 1 + 1 0.5 [0.65*0/7] [8+.05]



b [(6*4*8*1)-3*4*7]

{ 7 CNT
i 6 [0+0.5+$CNT*3*4] 1 2.75 [0.95*0/7] [8+.03]
 i 6 + 1 0.5 [0.65*0/7] [8+.08]
 i 6 + 1 0.25 [0.6*0/7] [8+.00]
 i 6 + 1 0.25 [0.5*0/7] [8+.08]
 i 6 + 1 0.5 [0.45*0/7] [8+.08]
 i 6 + 1 0.5 [0.8*0/7] [8+.12]
 i 6 + 1 3 [0.65*0/7] [8+.00]
 i 6 + 1 0.5 [0.75*0/7] [8+.07]
 i 6 + 1 0.75 [0.7*0/7] [8+.12]
 i 6 + 1 0.5 [0.95*1/7] [8+.01]
 i 6 + 1 0.25 [0.7*1/7] [8+.12]
 i 6 + 1 3 [0.55*0/7] [8+.01]
}


i 6 + 1 0.25 [0.95*0/7] [8+.12]
 i 6 + 1 0.5 [0.65*0/7] [8+.08]
 i 6 + 1 0.25 [0.6*0/7] [8+.00]
 i 6 + 1 0.25 [0.5*0/7] [8+.08]
 i 6 + 1 0.5 [0.45*0/7] [8+.08]
 i 6 + 1 0.5 [0.8*0/7] [8+.12]
 i 6 + 1 3 [0.65*0/7] [8+.00]
 i 6 + 1 0.5 [0.75*0/7] [8+.07]
 i 6 + 1 0.75 [0.7*0/7] [8+.12]
 i 6 + 1 0.5 [0.95*1/7] [8+.01]
 i 6 + 1 0.25 [0.8*0/7] [8+.00]
 i 6 + 1 3 [0.55*0/7] [8+.01]
 i 6 + 1 0.25 [0.95*0/7] [8+.12]
 i 6 + 1 0.5 [0.65*0/7] [8+.08]
 i 6 + 1 0.25 [0.8*0/7] [8+.12]
 i 6 + 1 0.25 [0.5*0/7] [8+.08]
 i 6 + 1 0.5 [0.45*0/7] [8+.08]
 i 6 + 1 0.5 [0.8*0/7] [8+.12]
 i 6 + 1 3 [0.65*0/7] [8+.00]
 i 6 + 1 0.5 [0.75*0/7] [8+.07]
 i 6 + 1 0.75 [0.7*0/7] [8+.12]
 i 6 + 1 0.5 [0.95*1/7] [8+.01]
 i 6 + 1 0.25 [0.8*0/7] [8+.00]
 i 6 + 1 1 [0.45*1/7] [8+.08]
 i 6 + 1 0.25 [0.95*0/7] [8+.12]
 i 6 + 1 0.5 [0.65*0/7] [8+.08]
 i 6 + 1 0.25 [0.8*0/7] [8+.03]
 i 6 + 1 0.25 [0.5*0/7] [8+.08]
 i 6 + 1 0.5 [0.45*0/7] [8+.08]
 i 6 + 1 0.5 [0.8*0/7] [8+.12]
 i 6 + 1 3 [0.65*0/7] [8+.00]
 i 6 + 1 0.5 [0.75*0/7] [8+.07]
 i 6 + 1 0.75 [0.7*0/7] [8+.12]
 i 6 + 1 0.5 [0.95*1/7] [8+.01]
 i 6 + 1 0.75 [0.25*0/7] [8+.07]
 i 6 + 1 1 [0.45*1/7] [8+.08]
 i 6 + 1 0.5 [0.5*0/7] [8+.00]
 i 6 + 1 0.5 [0.65*0/7] [8+.08]
 i 6 + 1 0.25 [0.8*0/7] [8+.03]
 i 6 + 1 0.25 [0.5*0/7] [8+.08]
 i 6 + 1 0.5 [0.7*0/7] [8+.03]
 i 6 + 1 0.5 [0.8*0/7] [8+.12]
 i 6 + 1 3 [0.65*0/7] [8+.00]
 i 6 + 1 0.5 [0.75*0/7] [8+.07]
 i 6 + 1 0.75 [0.7*0/7] [8+.12]
 i 6 + 1 0.5 [0.95*1/7] [8+.01]
 i 6 + 1 0.75 [0.25*0/7] [8+.07]
 i 6 + 1 1 [0.45*1/7] [8+.08]
 i 6 + 1 0.5 [0.5*0/7] [8+.00]
 i 6 + 1 0.5 [0.65*0/7] [8+.07]
 i 6 + 1 0.25 [0.8*0/7] [8+.03]
 i 6 + 1 0.25 [0.5*0/7] [8+.08]
 i 6 + 1 0.5 [0.7*0/7] [8+.03]
 i 6 + 1 0.5 [0.8*0/7] [8+.12]
 i 6 + 1 3 [0.65*0/7] [8+.00]
 i 6 + 1 0.5 [0.75*0/7] [8+.07]
 i 6 + 1 0.75 [0.7*0/7] [8+.12]
 i 6 + 1 0.5 [0.95*1/7] [8+.01]
 i 6 + 1 0.75 [0.25*0/7] [8+.07]
 i 6 + 1 1.5 [0.6*0/7] [8+.08]
 i 6 + 1 0.5 [0.5*0/7] [8+.00]
 i 6 + 1 0.5 [0.65*0/7] [8+.07]
 i 6 + 1 0.25 [0.8*0/7] [8+.03]
 i 6 + 1 0.25 [0.5*0/7] [8+.08]
 i 6 + 1 0.5 [0.7*0/7] [8+.03]
 i 6 + 1 0.5 [0.8*0/7] [8+.12]
 i 6 + 1 3 [0.65*0/7] [8+.00]
 i 6 + 1 0.5 [0.75*0/7] [8+.07]
 i 6 + 1 0.75 [0.7*0/7] [8+.12]
 i 6 + 1 0.5 [0.95*1/7] [8+.01]
 i 6 + 1 0.75 [0.25*0/7] [8+.07]
 i 6 + 1 1.5 [0.6*0/7] [8+.08]



b [(6*4*8*1)-4*4*6]

{ 6 CNT
i 7 [0+0+$CNT*4*4] 1 0.5 [0.65*0/7] [9+.07]
 i 7 + 1 1.5 [0.3*1/7] [9+.07]
 i 7 + 1 2.75 [0.75*0/7] [9+.00]
 i 7 + 1 0.5 [0.75*0/7] [9+.03]
 i 7 + 1 0.25 [0.4*1/7] [9+.10]
 i 7 + 1 0.25 [0.55*0/7] [9+.07]
 i 7 + 1 0.25 [0.45*0/7] [9+.03]
 i 7 + 1 1.5 [0.3*0/7] [9+.07]
 i 7 + 1 0.5 [0.45*0/7] [9+.12]
 i 7 + 1 1 [0.2*1/7] [9+.00]
 i 7 + 1 1 [0.7*0/7] [9+.05]
 i 7 + 1 0.5 [0.35*0/7] [9+.01]
 i 7 + 1 3 [0.9*0/7] [9+.01]
 i 7 + 1 2.75 [0.2*0/7] [9+.12]
 i 7 + 1 0.5 [0.6*0/7] [9+.07]
 i 7 + 1 0.25 [0.95*1/7] [9+.00]
}


i 7 + 1 0.5 [0.45*0/7] [9+.07]
 i 7 + 1 1.5 [0.3*1/7] [9+.07]
 i 7 + 1 2.75 [0.75*0/7] [9+.00]
 i 7 + 1 0.5 [0.75*0/7] [9+.03]
 i 7 + 1 0.25 [0.4*1/7] [9+.10]
 i 7 + 1 0.25 [0.55*0/7] [9+.07]
 i 7 + 1 0.25 [0.45*0/7] [9+.03]
 i 7 + 1 1 [0.65*0/7] [9+.00]
 i 7 + 1 0.5 [0.45*0/7] [9+.12]
 i 7 + 1 1 [0.2*1/7] [9+.00]
 i 7 + 1 1 [0.7*0/7] [9+.05]
 i 7 + 1 0.5 [0.35*0/7] [9+.01]
 i 7 + 1 3 [0.9*0/7] [9+.01]
 i 7 + 1 2.75 [0.2*0/7] [9+.12]
 i 7 + 1 0.5 [0.6*0/7] [9+.07]
 i 7 + 1 0.25 [0.95*1/7] [9+.00]
 i 7 + 1 0.5 [0.45*0/7] [9+.07]
 i 7 + 1 0.5 [0.5*0/7] [9+.08]
 i 7 + 1 2.75 [0.75*0/7] [9+.00]
 i 7 + 1 0.5 [0.75*0/7] [9+.03]
 i 7 + 1 1.5 [0.45*1/7] [9+.01]
 i 7 + 1 0.25 [0.55*0/7] [9+.07]
 i 7 + 1 0.25 [0.45*0/7] [9+.03]
 i 7 + 1 1 [0.65*0/7] [9+.00]
 i 7 + 1 0.5 [0.45*0/7] [9+.12]
 i 7 + 1 1 [0.2*1/7] [9+.00]
 i 7 + 1 1 [0.7*0/7] [9+.05]
 i 7 + 1 0.5 [0.35*0/7] [9+.01]
 i 7 + 1 3 [0.9*0/7] [9+.01]
 i 7 + 1 2.75 [0.2*0/7] [9+.12]
 i 7 + 1 1.5 [0.8*0/7] [9+.10]
 i 7 + 1 0.25 [0.95*1/7] [9+.00]
 i 7 + 1 0.75 [0.35*0/7] [9+.00]
 i 7 + 1 0.5 [0.5*0/7] [9+.08]
 i 7 + 1 0.5 [0.85*1/7] [9+.08]
 i 7 + 1 0.5 [0.75*0/7] [9+.03]
 i 7 + 1 1.5 [0.45*1/7] [9+.01]
 i 7 + 1 0.25 [0.55*0/7] [9+.07]
 i 7 + 1 0.25 [0.45*0/7] [9+.03]
 i 7 + 1 1 [0.65*0/7] [9+.00]
 i 7 + 1 0.5 [0.45*0/7] [9+.12]
 i 7 + 1 1 [0.2*1/7] [9+.00]
 i 7 + 1 1 [0.7*0/7] [9+.05]
 i 7 + 1 0.5 [0.35*0/7] [9+.01]
 i 7 + 1 3 [0.9*0/7] [9+.01]
 i 7 + 1 2.75 [0.2*0/7] [9+.12]
 i 7 + 1 0.5 [0.6*0/7] [9+.12]
 i 7 + 1 0.25 [0.95*1/7] [9+.00]
 i 7 + 1 3 [0.75*0/7] [9+.03]
 i 7 + 1 0.5 [0.5*0/7] [9+.08]
 i 7 + 1 0.5 [0.85*1/7] [9+.08]
 i 7 + 1 0.5 [0.75*0/7] [9+.03]
 i 7 + 1 1.5 [0.45*1/7] [9+.01]
 i 7 + 1 0.25 [0.55*0/7] [9+.07]
 i 7 + 1 0.25 [0.45*0/7] [9+.03]
 i 7 + 1 1 [0.65*0/7] [9+.00]
 i 7 + 1 0.5 [0.45*0/7] [9+.12]
 i 7 + 1 0.5 [0.5*0/7] [9+.07]
 i 7 + 1 1 [0.7*0/7] [9+.05]
 i 7 + 1 0.5 [0.35*0/7] [9+.01]
 i 7 + 1 3 [0.9*0/7] [9+.01]
 i 7 + 1 2.75 [0.2*0/7] [9+.12]
 i 7 + 1 0.5 [0.6*0/7] [9+.12]
 i 7 + 1 0.25 [0.95*1/7] [9+.00]
 i 7 + 1 3 [0.75*0/7] [9+.03]
 i 7 + 1 0.5 [0.5*0/7] [9+.08]
 i 7 + 1 0.5 [0.85*1/7] [9+.08]
 i 7 + 1 0.5 [0.75*0/7] [9+.03]
 i 7 + 1 1.5 [0.45*1/7] [9+.01]
 i 7 + 1 0.25 [0.55*0/7] [9+.07]
 i 7 + 1 0.25 [0.45*0/7] [9+.03]
 i 7 + 1 1 [0.65*0/7] [9+.00]
 i 7 + 1 0.5 [0.45*0/7] [9+.12]
 i 7 + 1 0.5 [0.5*0/7] [9+.07]
 i 7 + 1 1 [0.7*0/7] [9+.05]
 i 7 + 1 0.5 [0.35*0/7] [9+.01]
 i 7 + 1 3 [0.9*0/7] [9+.01]
 i 7 + 1 2.75 [0.2*0/7] [9+.12]
 i 7 + 1 0.5 [0.6*0/7] [9+.12]
 i 7 + 1 0.75 [0.5*1/7] [9+.12]



b [(6*4*8*1)-3*4*6]

{ 6 CNT
i 10 [0+0+$CNT*3*4] 1 0.5 [0.9*0/7] [7+.05]
 i 10 + 1 0.75 [0.65*0/7] [7+.05]
 i 10 + 1 0.5 [0.95*0/7] [7+.12]
 i 10 + 1 0.5 [0.7*0/7] [7+.10]
 i 10 + 1 0.25 [0.4*1/7] [7+.03]
 i 10 + 1 0.75 [0.7*0/7] [7+.05]
 i 10 + 1 1.25 [0.6*0/7] [7+.01]
 i 10 + 1 0.75 [0.45*0/7] [7+.03]
 i 10 + 1 1.25 [0.35*1/7] [7+.08]
 i 10 + 1 0.5 [0.95*0/7] [7+.08]
 i 10 + 1 0.5 [0.2*0/7] [7+.00]
 i 10 + 1 0.75 [0.25*0/7] [7+.07]
}


i 10 + 1 0.25 [0.95*0/7] [7+.00]
 i 10 + 1 0.75 [0.65*0/7] [7+.05]
 i 10 + 1 0.5 [0.95*0/7] [7+.12]
 i 10 + 1 0.5 [0.7*0/7] [7+.10]
 i 10 + 1 0.25 [0.4*1/7] [7+.03]
 i 10 + 1 0.75 [0.7*0/7] [7+.05]
 i 10 + 1 1.25 [0.6*0/7] [7+.01]
 i 10 + 1 0.75 [0.45*0/7] [7+.03]
 i 10 + 1 1.25 [0.35*1/7] [7+.08]
 i 10 + 1 0.5 [0.95*0/7] [7+.08]
 i 10 + 1 0.5 [0.2*0/7] [7+.00]
 i 10 + 1 0.75 [0.25*0/7] [7+.07]
 i 10 + 1 0.25 [0.95*0/7] [7+.00]
 i 10 + 1 0.75 [0.65*0/7] [7+.05]
 i 10 + 1 0.5 [0.95*0/7] [7+.12]
 i 10 + 1 0.5 [0.7*0/7] [7+.10]
 i 10 + 1 0.25 [0.4*1/7] [7+.03]
 i 10 + 1 0.75 [0.7*0/7] [7+.05]
 i 10 + 1 1.25 [0.6*0/7] [7+.01]
 i 10 + 1 0.75 [0.2*0/7] [7+.08]
 i 10 + 1 1.25 [0.35*1/7] [7+.08]
 i 10 + 1 0.5 [0.95*0/7] [7+.08]
 i 10 + 1 0.5 [0.2*0/7] [7+.00]
 i 10 + 1 0.75 [0.25*0/7] [7+.07]
 i 10 + 1 0.25 [0.95*0/7] [7+.00]
 i 10 + 1 3 [0.8*0/7] [7+.01]
 i 10 + 1 0.5 [0.95*0/7] [7+.12]
 i 10 + 1 0.5 [0.7*0/7] [7+.10]
 i 10 + 1 0.25 [0.4*1/7] [7+.03]
 i 10 + 1 0.75 [0.7*0/7] [7+.05]
 i 10 + 1 1.25 [0.6*0/7] [7+.01]
 i 10 + 1 0.75 [0.2*0/7] [7+.08]
 i 10 + 1 1.25 [0.35*1/7] [7+.08]
 i 10 + 1 0.5 [0.95*0/7] [7+.08]
 i 10 + 1 0.5 [0.2*0/7] [7+.00]
 i 10 + 1 0.75 [0.25*0/7] [7+.07]
 i 10 + 1 1 [0.5*0/7] [7+.03]
 i 10 + 1 3 [0.8*0/7] [7+.01]
 i 10 + 1 0.5 [0.95*0/7] [7+.12]
 i 10 + 1 0.5 [0.7*0/7] [7+.10]
 i 10 + 1 0.25 [0.4*1/7] [7+.03]
 i 10 + 1 0.25 [0.9*1/7] [7+.00]
 i 10 + 1 1.25 [0.6*0/7] [7+.01]
 i 10 + 1 0.75 [0.2*0/7] [7+.08]
 i 10 + 1 1 [0.2*0/7] [7+.00]
 i 10 + 1 0.5 [0.95*0/7] [7+.08]
 i 10 + 1 0.5 [0.2*0/7] [7+.00]
 i 10 + 1 0.75 [0.25*0/7] [7+.07]
 i 10 + 1 1 [0.5*0/7] [7+.03]
 i 10 + 1 3 [0.8*0/7] [7+.01]
 i 10 + 1 0.25 [0.85*1/7] [7+.05]
 i 10 + 1 0.5 [0.7*0/7] [7+.10]
 i 10 + 1 0.25 [0.4*1/7] [7+.03]
 i 10 + 1 0.25 [0.9*1/7] [7+.00]
 i 10 + 1 1.25 [0.6*0/7] [7+.01]
 i 10 + 1 0.75 [0.2*0/7] [7+.08]
 i 10 + 1 1 [0.2*0/7] [7+.00]
 i 10 + 1 0.5 [0.95*0/7] [7+.08]
 i 10 + 1 0.5 [0.2*0/7] [7+.00]
 i 10 + 1 0.75 [0.25*0/7] [7+.07]
 i 10 + 1 3 [0.25*0/7] [7+.00]
 i 10 + 1 3 [0.8*0/7] [7+.01]
 i 10 + 1 0.25 [0.85*1/7] [7+.05]
 i 10 + 1 0.5 [0.7*0/7] [7+.10]
 i 10 + 1 0.25 [0.4*1/7] [7+.03]
 i 10 + 1 0.25 [0.9*1/7] [7+.00]
 i 10 + 1 1.25 [0.6*0/7] [7+.01]
 i 10 + 1 1 [0.75*0/7] [7+.00]
 i 10 + 1 1 [0.2*0/7] [7+.00]
 i 10 + 1 0.5 [0.95*0/7] [7+.08]
 i 10 + 1 0.5 [0.2*0/7] [7+.00]
 i 10 + 1 0.75 [0.25*0/7] [7+.07]
 i 10 + 1 3 [0.25*0/7] [7+.00]
 i 10 + 1 3 [0.8*0/7] [7+.01]
 i 10 + 1 0.25 [0.85*1/7] [7+.05]
 i 10 + 1 0.5 [0.7*0/7] [7+.10]
 i 10 + 1 0.25 [0.4*1/7] [7+.03]
 i 10 + 1 0.25 [0.9*1/7] [7+.00]
 i 10 + 1 1.25 [0.6*0/7] [7+.01]
 i 10 + 1 1 [0.75*0/7] [7+.00]
 i 10 + 1 1 [0.4*0/7] [7+.12]
 i 10 + 1 0.5 [0.95*0/7] [7+.08]
 i 10 + 1 0.5 [0.2*0/7] [7+.00]
 i 10 + 1 0.75 [0.25*0/7] [7+.07]
 i 10 + 1 3 [0.25*0/7] [7+.00]
 i 10 + 1 3 [0.8*0/7] [7+.01]
 i 10 + 1 2.75 [0.55*1/7] [7+.00]
 i 10 + 1 0.5 [0.7*0/7] [7+.10]
 i 10 + 1 0.25 [0.4*1/7] [7+.03]
 i 10 + 1 0.25 [0.9*1/7] [7+.00]
 i 10 + 1 1.25 [0.6*0/7] [7+.01]
 i 10 + 1 1 [0.75*0/7] [7+.00]
 i 10 + 1 1 [0.4*0/7] [7+.12]
 i 10 + 1 0.5 [0.95*0/7] [7+.08]
 i 10 + 1 0.5 [0.2*0/7] [7+.00]
 i 10 + 1 0.75 [0.25*0/7] [7+.07]







</CsScore>
</CsoundSynthesizer>
