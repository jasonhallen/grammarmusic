
<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 10
0dbfs = 1

instr 100 ;STRING PLUCK
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

instr 101 ;ORGAN
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

instr 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40
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
f 1 0 0 1 "drums/tr808/BD2510.WAV" 0 0 0
f 2 0 0 1 "drums/tr808/SD0010.WAV" 0 0 0
f 3 0 0 1 "drums/tr808/CP.WAV" 0 0 0
f 4 0 0 1 "drums/tr808/OH00.WAV" 0 0 0
f 5 0 0 1 "drums/tr808/MT00.WAV" 0 0 0
f 6 0 0 1 "drums/tr808/CY0050.WAV" 0 0 0
f 7 0 0 1 "drums/tr808/RS.WAV" 0 0 0
f 8 0 0 1 "drums/tr808/LT50.WAV" 0 0 0
f 9 0 0 1 "drums/tr808/CL.WAV" 0 0 0
f 10 0 0 1 "drums/tr808/MA.WAV" 0 0 0
f 11 0 0 1 "drums/tr808/CH.WAV" 0 0 0
f 12 0 0 1 "drums/emu/emu_CHH.wav" 0 0 0
f 13 0 0 1 "drums/emu/emu_Clap.wav" 0 0 0
f 14 0 0 1 "drums/emu/emu_Cowbell.wav" 0 0 0
f 15 0 0 1 "drums/emu/emu_Kick.wav" 0 0 0
f 16 0 0 1 "drums/emu/emu_OHH.wav" 0 0 0
f 17 0 0 1 "drums/emu/emu_Ride.wav" 0 0 0
f 18 0 0 1 "drums/emu/emu_Rim.wav" 0 0 0
f 19 0 0 1 "drums/emu/emu_Snare.wav" 0 0 0
f 20 0 0 1 "drums/emu/emu_Tom1.wav" 0 0 0
f 21 0 0 1 "drums/emu/emu_Tom2.wav" 0 0 0
f 22 0 0 1 "drums/emu/emu_Tom3.wav" 0 0 0
f 23 0 0 1 "drums/emu/emu_Wood_Block.wav" 0 0 0
f 24 0 0 1 "drums/linn/linn_casaba.wav" 0 0 0
f 25 0 0 1 "drums/linn/linn_clap.wav" 0 0 0
f 26 0 0 1 "drums/linn/linn_conga_hi.wav" 0 0 0
f 27 0 0 1 "drums/linn/linn_conga_low.wav" 0 0 0
f 28 0 0 1 "drums/linn/linn_cowbell.wav" 0 0 0
f 29 0 0 1 "drums/linn/linn_crash.wav" 0 0 0
f 30 0 0 1 "drums/linn/linn_hat_close.wav" 0 0 0
f 31 0 0 1 "drums/linn/linn_hat_med.wav" 0 0 0
f 32 0 0 1 "drums/linn/linn_hat_open.wav" 0 0 0
f 33 0 0 1 "drums/linn/linn_kick.wav" 0 0 0
f 34 0 0 1 "drums/linn/linn_ride.wav" 0 0 0
f 35 0 0 1 "drums/linn/linn_sidestick.wav" 0 0 0
f 36 0 0 1 "drums/linn/linn_snare.wav" 0 0 0
f 37 0 0 1 "drums/linn/linn_tambourine.wav" 0 0 0
f 38 0 0 1 "drums/linn/linn_tom1.wav" 0 0 0
f 39 0 0 1 "drums/linn/linn_tom2.wav" 0 0 0
f 40 0 0 1 "drums/linn/linn_tom3.wav" 0 0 0
; locrian emu voices=7
t 0 350
b [(6*4*8*1)-3*4*7]

{ 7 CNT
i 101 [0+0.5+$CNT*3*4] 1 2.75 [0.45*0/7] [8+.06]
 i 101 + 1 1.25 [0.95*0/7] [8+.12]
 i 101 + 1 0.75 [0.45*0/7] [8+.10]
 i 101 + 1 0.5 [0.35*0/7] [8+.00]
 i 101 + 1 0.5 [0.2*1/7] [8+.00]
 i 101 + 1 0.25 [0.3*0/7] [8+.12]
 i 101 + 1 0.25 [0.35*0/7] [8+.03]
 i 101 + 1 0.5 [0.75*0/7] [8+.06]
 i 101 + 1 1 [0.65*0/7] [8+.03]
 i 101 + 1 0.5 [0.9*1/7] [8+.08]
 i 101 + 1 0.25 [0.4*0/7] [8+.10]
 i 101 + 1 0.75 [0.55*1/7] [8+.01]
}


i 101 + 1 0.25 [0.75*0/7] [8+.03]
 i 101 + 1 1.25 [0.95*0/7] [8+.12]
 i 101 + 1 0.75 [0.45*0/7] [8+.10]
 i 101 + 1 0.5 [0.35*0/7] [8+.00]
 i 101 + 1 0.5 [0.2*1/7] [8+.00]
 i 101 + 1 0.25 [0.3*0/7] [8+.12]
 i 101 + 1 0.25 [0.35*0/7] [8+.03]
 i 101 + 1 0.5 [0.75*0/7] [8+.06]
 i 101 + 1 1 [0.65*0/7] [8+.03]
 i 101 + 1 0.5 [0.9*1/7] [8+.08]
 i 101 + 1 0.25 [0.4*0/7] [8+.10]
 i 101 + 1 0.75 [0.55*1/7] [8+.01]
 i 101 + 1 0.25 [0.75*0/7] [8+.03]
 i 101 + 1 0.5 [0.75*0/7] [8+.08]
 i 101 + 1 0.75 [0.45*0/7] [8+.10]
 i 101 + 1 0.5 [0.35*0/7] [8+.00]
 i 101 + 1 0.5 [0.2*1/7] [8+.00]
 i 101 + 1 0.25 [0.3*0/7] [8+.12]
 i 101 + 1 0.25 [0.35*0/7] [8+.03]
 i 101 + 1 0.5 [0.75*0/7] [8+.06]
 i 101 + 1 1 [0.65*0/7] [8+.03]
 i 101 + 1 0.5 [0.85*0/7] [8+.00]
 i 101 + 1 0.25 [0.4*0/7] [8+.10]
 i 101 + 1 0.75 [0.55*1/7] [8+.01]
 i 101 + 1 0.25 [0.75*0/7] [8+.03]
 i 101 + 1 0.5 [0.75*0/7] [8+.08]
 i 101 + 1 0.75 [0.45*0/7] [8+.10]
 i 101 + 1 0.5 [0.35*0/7] [8+.00]
 i 101 + 1 0.5 [0.9*0/7] [8+.00]
 i 101 + 1 0.25 [0.3*0/7] [8+.12]
 i 101 + 1 0.25 [0.35*0/7] [8+.03]
 i 101 + 1 0.5 [0.75*0/7] [8+.06]
 i 101 + 1 1 [0.65*0/7] [8+.03]
 i 101 + 1 0.5 [0.85*0/7] [8+.00]
 i 101 + 1 0.25 [0.4*0/7] [8+.10]
 i 101 + 1 0.75 [0.55*1/7] [8+.01]
 i 101 + 1 0.25 [0.75*0/7] [8+.03]
 i 101 + 1 0.5 [0.75*0/7] [8+.08]
 i 101 + 1 0.75 [0.45*0/7] [8+.10]
 i 101 + 1 0.5 [0.35*0/7] [8+.00]
 i 101 + 1 0.5 [0.9*0/7] [8+.00]
 i 101 + 1 0.25 [0.3*0/7] [8+.12]
 i 101 + 1 0.25 [0.35*0/7] [8+.03]
 i 101 + 1 0.5 [0.75*0/7] [8+.06]
 i 101 + 1 1 [0.65*0/7] [8+.03]
 i 101 + 1 3 [0.8*0/7] [8+.01]
 i 101 + 1 0.25 [0.4*0/7] [8+.10]
 i 101 + 1 0.75 [0.55*1/7] [8+.01]
 i 101 + 1 0.25 [0.75*0/7] [8+.03]
 i 101 + 1 0.5 [0.75*0/7] [8+.08]
 i 101 + 1 0.75 [0.45*0/7] [8+.10]
 i 101 + 1 0.5 [0.35*0/7] [8+.00]
 i 101 + 1 0.5 [0.9*0/7] [8+.00]
 i 101 + 1 0.25 [0.3*0/7] [8+.12]
 i 101 + 1 0.25 [0.35*0/7] [8+.03]
 i 101 + 1 0.5 [0.75*0/7] [8+.06]
 i 101 + 1 1 [0.65*0/7] [8+.03]
 i 101 + 1 0.25 [0.9*0/7] [8+.00]
 i 101 + 1 0.75 [0.8*0/7] [8+.01]
 i 101 + 1 0.75 [0.55*1/7] [8+.01]
 i 101 + 1 0.25 [0.75*0/7] [8+.03]
 i 101 + 1 0.5 [0.75*0/7] [8+.08]
 i 101 + 1 0.75 [0.45*0/7] [8+.10]
 i 101 + 1 0.5 [0.35*0/7] [8+.00]
 i 101 + 1 0.5 [0.9*0/7] [8+.00]
 i 101 + 1 0.25 [0.3*0/7] [8+.12]
 i 101 + 1 0.25 [0.35*0/7] [8+.03]
 i 101 + 1 0.5 [0.75*0/7] [8+.06]
 i 101 + 1 1 [0.65*0/7] [8+.03]
 i 101 + 1 0.25 [0.9*0/7] [8+.00]
 i 101 + 1 0.75 [0.8*0/7] [8+.01]
 i 101 + 1 0.75 [0.55*1/7] [8+.01]



b [(6*4*8*1)-6*4*6]

{ 6 CNT
i 18 [0+0+$CNT*6*4] 1 0.5 [0.85*0/7] [6+.12]
 i 18 + 1 0.5 [0.3*0/7] [6+.01]
 i 18 + 1 0.75 [0.2*0/7] [6+.00]
 i 18 + 1 0.75 [0.35*0/7] [6+.00]
 i 18 + 1 0.5 [0.65*0/7] [6+.06]
 i 18 + 1 0.5 [0.5*0/7] [6+.08]
 i 18 + 1 2.75 [0.35*1/7] [6+.00]
 i 18 + 1 3 [0.25*0/7] [6+.00]
 i 18 + 1 1.5 [0.35*0/7] [6+.12]
 i 18 + 1 0.75 [0.45*0/7] [6+.01]
 i 18 + 1 0.25 [0.75*0/7] [6+.00]
 i 18 + 1 0.25 [0.45*0/7] [6+.00]
 i 18 + 1 0.5 [0.3*1/7] [6+.10]
 i 18 + 1 0.75 [0.2*0/7] [6+.00]
 i 18 + 1 1.25 [0.9*0/7] [6+.03]
 i 18 + 1 2.75 [0.3*1/7] [6+.08]
 i 18 + 1 0.25 [0.25*0/7] [6+.05]
 i 18 + 1 0.75 [0.45*0/7] [6+.08]
 i 18 + 1 0.5 [0.6*0/7] [6+.12]
 i 18 + 1 0.25 [0.25*0/7] [6+.10]
 i 18 + 1 3 [0.8*0/7] [6+.03]
 i 18 + 1 0.75 [0.95*0/7] [6+.00]
 i 18 + 1 0.75 [0.55*0/7] [6+.00]
 i 18 + 1 0.5 [0.6*0/7] [6+.12]
}


i 18 + 1 1 [0.4*0/7] [6+.05]
 i 18 + 1 0.5 [0.3*0/7] [6+.01]
 i 18 + 1 0.75 [0.2*0/7] [6+.00]
 i 18 + 1 0.75 [0.35*0/7] [6+.00]
 i 18 + 1 0.5 [0.65*0/7] [6+.06]
 i 18 + 1 0.5 [0.5*0/7] [6+.08]
 i 18 + 1 0.5 [0.8*0/7] [6+.00]
 i 18 + 1 3 [0.25*0/7] [6+.00]
 i 18 + 1 3 [0.85*1/7] [6+.10]
 i 18 + 1 0.75 [0.45*0/7] [6+.01]
 i 18 + 1 0.25 [0.75*0/7] [6+.00]
 i 18 + 1 0.25 [0.45*0/7] [6+.00]
 i 18 + 1 0.5 [0.3*1/7] [6+.10]
 i 18 + 1 0.75 [0.2*0/7] [6+.00]
 i 18 + 1 1.25 [0.9*0/7] [6+.03]
 i 18 + 1 2.75 [0.3*1/7] [6+.08]
 i 18 + 1 0.25 [0.25*0/7] [6+.05]
 i 18 + 1 2.75 [0.85*0/7] [6+.00]
 i 18 + 1 0.5 [0.6*0/7] [6+.12]
 i 18 + 1 0.25 [0.25*0/7] [6+.10]
 i 18 + 1 3 [0.8*0/7] [6+.03]
 i 18 + 1 0.25 [0.8*0/7] [6+.10]
 i 18 + 1 0.75 [0.55*0/7] [6+.00]
 i 18 + 1 0.5 [0.6*0/7] [6+.12]
 i 18 + 1 0.5 [0.55*1/7] [6+.00]
 i 18 + 1 0.5 [0.3*0/7] [6+.01]
 i 18 + 1 1 [0.25*0/7] [6+.12]
 i 18 + 1 0.75 [0.35*0/7] [6+.00]
 i 18 + 1 0.5 [0.65*0/7] [6+.06]
 i 18 + 1 0.5 [0.5*0/7] [6+.08]
 i 18 + 1 0.5 [0.8*0/7] [6+.00]
 i 18 + 1 3 [0.25*0/7] [6+.00]
 i 18 + 1 3 [0.85*1/7] [6+.10]
 i 18 + 1 0.75 [0.45*0/7] [6+.01]
 i 18 + 1 0.25 [0.75*0/7] [6+.00]
 i 18 + 1 0.5 [0.55*0/7] [6+.12]
 i 18 + 1 0.5 [0.3*1/7] [6+.08]
 i 18 + 1 0.75 [0.2*0/7] [6+.00]
 i 18 + 1 1.25 [0.9*0/7] [6+.03]
 i 18 + 1 2.75 [0.3*1/7] [6+.08]
 i 18 + 1 0.25 [0.25*0/7] [6+.05]
 i 18 + 1 2.75 [0.85*0/7] [6+.00]
 i 18 + 1 0.25 [0.65*0/7] [6+.03]
 i 18 + 1 0.25 [0.25*0/7] [6+.10]
 i 18 + 1 3 [0.8*0/7] [6+.03]
 i 18 + 1 0.25 [0.8*0/7] [6+.10]
 i 18 + 1 0.75 [0.55*0/7] [6+.00]
 i 18 + 1 0.5 [0.6*0/7] [6+.12]
 i 18 + 1 1 [0.5*1/7] [6+.00]
 i 18 + 1 1 [0.75*0/7] [6+.00]
 i 18 + 1 1 [0.25*0/7] [6+.12]
 i 18 + 1 0.25 [0.8*0/7] [6+.05]
 i 18 + 1 1.5 [0.55*0/7] [6+.03]
 i 18 + 1 0.5 [0.5*0/7] [6+.08]
 i 18 + 1 0.5 [0.8*0/7] [6+.00]
 i 18 + 1 3 [0.25*0/7] [6+.00]
 i 18 + 1 3 [0.85*1/7] [6+.10]
 i 18 + 1 0.5 [0.45*0/7] [6+.06]
 i 18 + 1 0.25 [0.75*0/7] [6+.00]
 i 18 + 1 0.5 [0.55*0/7] [6+.12]
 i 18 + 1 0.5 [0.3*1/7] [6+.08]
 i 18 + 1 0.75 [0.2*0/7] [6+.00]
 i 18 + 1 1.25 [0.9*0/7] [6+.03]
 i 18 + 1 2.75 [0.3*1/7] [6+.08]
 i 18 + 1 0.25 [0.25*0/7] [6+.05]
 i 18 + 1 2.75 [0.85*0/7] [6+.00]
 i 18 + 1 0.25 [0.65*0/7] [6+.03]
 i 18 + 1 0.25 [0.25*0/7] [6+.10]
 i 18 + 1 3 [0.8*0/7] [6+.03]
 i 18 + 1 0.25 [0.8*0/7] [6+.10]
 i 18 + 1 0.75 [0.55*0/7] [6+.00]
 i 18 + 1 0.5 [0.6*0/7] [6+.12]
 i 18 + 1 1 [0.5*1/7] [6+.00]
 i 18 + 1 1 [0.75*0/7] [6+.00]
 i 18 + 1 1 [0.25*0/7] [6+.12]
 i 18 + 1 0.25 [0.8*0/7] [6+.05]
 i 18 + 1 1.5 [0.55*0/7] [6+.03]
 i 18 + 1 0.5 [0.5*0/7] [6+.08]
 i 18 + 1 0.5 [0.8*0/7] [6+.00]
 i 18 + 1 3 [0.25*0/7] [6+.00]
 i 18 + 1 3 [0.85*1/7] [6+.10]
 i 18 + 1 0.5 [0.45*0/7] [6+.06]
 i 18 + 1 0.25 [0.75*0/7] [6+.00]
 i 18 + 1 0.5 [0.55*0/7] [6+.12]
 i 18 + 1 0.5 [0.3*1/7] [6+.08]
 i 18 + 1 0.75 [0.2*0/7] [6+.00]
 i 18 + 1 1.25 [0.9*0/7] [6+.03]
 i 18 + 1 0.25 [0.6*0/7] [6+.00]
 i 18 + 1 0.25 [0.25*0/7] [6+.05]
 i 18 + 1 2.75 [0.85*0/7] [6+.00]
 i 18 + 1 0.25 [0.65*0/7] [6+.03]
 i 18 + 1 0.25 [0.25*0/7] [6+.10]
 i 18 + 1 3 [0.8*0/7] [6+.03]
 i 18 + 1 0.25 [0.8*0/7] [6+.10]
 i 18 + 1 0.75 [0.55*0/7] [6+.00]
 i 18 + 1 0.5 [0.6*0/7] [6+.12]
 i 18 + 1 1 [0.5*1/7] [6+.00]
 i 18 + 1 1 [0.75*0/7] [6+.00]
 i 18 + 1 1 [0.25*0/7] [6+.12]
 i 18 + 1 0.25 [0.8*0/7] [6+.05]
 i 18 + 1 1.5 [0.55*0/7] [6+.03]
 i 18 + 1 0.5 [0.5*0/7] [6+.08]
 i 18 + 1 0.5 [0.8*0/7] [6+.00]
 i 18 + 1 3 [0.25*0/7] [6+.00]
 i 18 + 1 3 [0.85*1/7] [6+.10]
 i 18 + 1 0.5 [0.3*1/7] [6+.06]
 i 18 + 1 0.25 [0.75*0/7] [6+.00]
 i 18 + 1 0.5 [0.55*0/7] [6+.12]
 i 18 + 1 0.5 [0.3*1/7] [6+.08]
 i 18 + 1 0.75 [0.2*0/7] [6+.00]
 i 18 + 1 1.25 [0.9*0/7] [6+.03]
 i 18 + 1 0.25 [0.6*0/7] [6+.00]
 i 18 + 1 0.25 [0.25*0/7] [6+.05]
 i 18 + 1 2.75 [0.85*0/7] [6+.00]
 i 18 + 1 0.25 [0.65*0/7] [6+.03]
 i 18 + 1 0.25 [0.25*0/7] [6+.10]
 i 18 + 1 3 [0.8*0/7] [6+.03]
 i 18 + 1 0.5 [0.4*0/7] [6+.00]
 i 18 + 1 0.75 [0.55*0/7] [6+.00]
 i 18 + 1 0.5 [0.6*0/7] [6+.12]



b [(6*4*8*1)-4*4*5]

{ 5 CNT
i 18 [0+0+$CNT*4*4] 1 0.25 [0.2*1/7] [8+.03]
 i 18 + 1 0.5 [0.6*1/7] [8+.10]
 i 18 + 1 1.5 [0.8*0/7] [8+.00]
 i 18 + 1 0.5 [0.75*1/7] [8+.06]
 i 18 + 1 1 [0.35*0/7] [8+.00]
 i 18 + 1 1 [0.55*0/7] [8+.08]
 i 18 + 1 0.25 [0.55*1/7] [8+.00]
 i 18 + 1 0.25 [0.65*0/7] [8+.05]
 i 18 + 1 0.5 [0.95*0/7] [8+.06]
 i 18 + 1 0.5 [0.9*1/7] [8+.06]
 i 18 + 1 1.5 [0.45*0/7] [8+.03]
 i 18 + 1 1.25 [0.5*0/7] [8+.00]
 i 18 + 1 0.75 [0.95*0/7] [8+.03]
 i 18 + 1 0.5 [0.65*0/7] [8+.00]
 i 18 + 1 0.5 [0.95*0/7] [8+.06]
 i 18 + 1 0.5 [0.45*0/7] [8+.08]
}


i 18 + 1 1.5 [0.9*0/7] [8+.12]
 i 18 + 1 0.5 [0.6*1/7] [8+.10]
 i 18 + 1 1.5 [0.8*0/7] [8+.00]
 i 18 + 1 0.5 [0.75*1/7] [8+.06]
 i 18 + 1 1 [0.35*0/7] [8+.00]
 i 18 + 1 0.5 [0.5*1/7] [8+.00]
 i 18 + 1 0.25 [0.55*1/7] [8+.00]
 i 18 + 1 0.25 [0.65*0/7] [8+.05]
 i 18 + 1 0.5 [0.95*0/7] [8+.06]
 i 18 + 1 0.25 [0.9*1/7] [8+.00]
 i 18 + 1 1.5 [0.45*0/7] [8+.03]
 i 18 + 1 1.25 [0.5*0/7] [8+.00]
 i 18 + 1 0.75 [0.95*0/7] [8+.03]
 i 18 + 1 0.5 [0.65*0/7] [8+.00]
 i 18 + 1 0.5 [0.95*0/7] [8+.06]
 i 18 + 1 0.5 [0.45*0/7] [8+.08]
 i 18 + 1 1.5 [0.9*0/7] [8+.12]
 i 18 + 1 0.5 [0.6*1/7] [8+.10]
 i 18 + 1 1.5 [0.8*0/7] [8+.00]
 i 18 + 1 0.5 [0.75*1/7] [8+.06]
 i 18 + 1 1 [0.35*0/7] [8+.00]
 i 18 + 1 0.5 [0.5*1/7] [8+.00]
 i 18 + 1 0.25 [0.55*1/7] [8+.00]
 i 18 + 1 0.25 [0.65*0/7] [8+.05]
 i 18 + 1 0.5 [0.95*0/7] [8+.06]
 i 18 + 1 0.25 [0.9*1/7] [8+.00]
 i 18 + 1 1.5 [0.45*0/7] [8+.03]
 i 18 + 1 1.25 [0.5*0/7] [8+.00]
 i 18 + 1 0.75 [0.95*0/7] [8+.03]
 i 18 + 1 0.5 [0.65*0/7] [8+.00]
 i 18 + 1 0.5 [0.4*0/7] [8+.10]
 i 18 + 1 0.5 [0.45*0/7] [8+.08]
 i 18 + 1 1.5 [0.9*0/7] [8+.12]
 i 18 + 1 0.5 [0.6*1/7] [8+.10]
 i 18 + 1 1.5 [0.8*0/7] [8+.00]
 i 18 + 1 0.5 [0.75*1/7] [8+.06]
 i 18 + 1 1 [0.35*0/7] [8+.00]
 i 18 + 1 0.5 [0.5*1/7] [8+.00]
 i 18 + 1 0.25 [0.55*1/7] [8+.00]
 i 18 + 1 0.25 [0.65*0/7] [8+.05]
 i 18 + 1 0.5 [0.95*0/7] [8+.06]
 i 18 + 1 0.25 [0.9*1/7] [8+.00]
 i 18 + 1 1.5 [0.4*0/7] [8+.03]
 i 18 + 1 1.25 [0.5*0/7] [8+.00]
 i 18 + 1 0.5 [0.65*0/7] [8+.00]
 i 18 + 1 0.5 [0.65*0/7] [8+.00]
 i 18 + 1 0.5 [0.4*0/7] [8+.10]
 i 18 + 1 0.5 [0.45*0/7] [8+.08]
 i 18 + 1 1.5 [0.9*0/7] [8+.12]
 i 18 + 1 0.5 [0.6*1/7] [8+.10]
 i 18 + 1 1.5 [0.8*0/7] [8+.00]
 i 18 + 1 0.5 [0.75*1/7] [8+.06]
 i 18 + 1 1 [0.35*0/7] [8+.00]
 i 18 + 1 0.5 [0.5*1/7] [8+.00]
 i 18 + 1 0.25 [0.55*1/7] [8+.00]
 i 18 + 1 0.25 [0.65*0/7] [8+.05]
 i 18 + 1 0.5 [0.95*0/7] [8+.06]
 i 18 + 1 0.25 [0.9*1/7] [8+.00]
 i 18 + 1 1.5 [0.4*0/7] [8+.03]
 i 18 + 1 1.25 [0.5*0/7] [8+.00]
 i 18 + 1 0.5 [0.65*0/7] [8+.00]
 i 18 + 1 0.5 [0.65*0/7] [8+.00]
 i 18 + 1 0.5 [0.4*0/7] [8+.10]
 i 18 + 1 0.5 [0.45*0/7] [8+.08]
 i 18 + 1 1.5 [0.9*0/7] [8+.12]
 i 18 + 1 0.5 [0.6*1/7] [8+.10]
 i 18 + 1 1.5 [0.8*0/7] [8+.00]
 i 18 + 1 0.5 [0.75*1/7] [8+.06]
 i 18 + 1 1 [0.35*0/7] [8+.00]
 i 18 + 1 0.5 [0.5*1/7] [8+.00]
 i 18 + 1 0.25 [0.55*1/7] [8+.00]
 i 18 + 1 0.25 [0.65*0/7] [8+.05]
 i 18 + 1 0.5 [0.95*0/7] [8+.06]
 i 18 + 1 0.25 [0.9*1/7] [8+.00]
 i 18 + 1 1.5 [0.4*0/7] [8+.03]
 i 18 + 1 1.25 [0.5*0/7] [8+.00]
 i 18 + 1 0.5 [0.65*0/7] [8+.00]
 i 18 + 1 0.5 [0.65*0/7] [8+.00]
 i 18 + 1 0.5 [0.4*0/7] [8+.10]
 i 18 + 1 0.5 [0.45*0/7] [8+.08]
 i 18 + 1 1.5 [0.9*0/7] [8+.12]
 i 18 + 1 0.5 [0.6*1/7] [8+.10]
 i 18 + 1 1.5 [0.8*0/7] [8+.00]
 i 18 + 1 0.5 [0.75*1/7] [8+.06]
 i 18 + 1 1 [0.35*0/7] [8+.00]
 i 18 + 1 0.5 [0.5*1/7] [8+.00]
 i 18 + 1 0.25 [0.55*1/7] [8+.00]
 i 18 + 1 0.25 [0.65*0/7] [8+.05]
 i 18 + 1 0.5 [0.95*0/7] [8+.06]
 i 18 + 1 0.25 [0.9*1/7] [8+.00]
 i 18 + 1 1.5 [0.4*0/7] [8+.03]
 i 18 + 1 1.25 [0.5*0/7] [8+.00]
 i 18 + 1 0.5 [0.65*0/7] [8+.00]
 i 18 + 1 0.5 [0.65*0/7] [8+.00]
 i 18 + 1 0.5 [0.4*0/7] [8+.10]
 i 18 + 1 0.5 [0.45*0/7] [8+.08]



b [(6*4*8*1)-3*4*7]

{ 7 CNT
i 100 [0+0+$CNT*3*4] 1 0.5 [0.8*0/7] [9+.00]
 i 100 + 1 1 [0.95*0/7] [9+.00]
 i 100 + 1 0.25 [0.3*0/7] [9+.01]
 i 100 + 1 2.75 [0.45*0/7] [9+.00]
 i 100 + 1 1.25 [0.85*0/7] [9+.00]
 i 100 + 1 0.25 [0.35*0/7] [9+.05]
 i 100 + 1 0.5 [0.7*1/7] [9+.03]
 i 100 + 1 0.25 [0.7*0/7] [9+.03]
 i 100 + 1 1.5 [0.6*1/7] [9+.01]
 i 100 + 1 0.5 [0.65*0/7] [9+.10]
 i 100 + 1 0.5 [0.75*1/7] [9+.06]
 i 100 + 1 2.75 [0.3*0/7] [9+.01]
}


i 100 + 1 1.5 [0.45*0/7] [9+.00]
 i 100 + 1 1 [0.95*0/7] [9+.00]
 i 100 + 1 0.25 [0.3*0/7] [9+.01]
 i 100 + 1 2.75 [0.45*0/7] [9+.00]
 i 100 + 1 1.25 [0.85*0/7] [9+.00]
 i 100 + 1 0.25 [0.35*0/7] [9+.05]
 i 100 + 1 0.5 [0.7*1/7] [9+.03]
 i 100 + 1 0.25 [0.7*0/7] [9+.03]
 i 100 + 1 1.5 [0.6*1/7] [9+.01]
 i 100 + 1 0.5 [0.65*0/7] [9+.10]
 i 100 + 1 0.5 [0.75*1/7] [9+.06]
 i 100 + 1 2.75 [0.3*0/7] [9+.01]
 i 100 + 1 0.75 [0.65*0/7] [9+.06]
 i 100 + 1 1 [0.95*0/7] [9+.00]
 i 100 + 1 0.25 [0.3*0/7] [9+.01]
 i 100 + 1 2.75 [0.45*0/7] [9+.00]
 i 100 + 1 1.25 [0.85*0/7] [9+.00]
 i 100 + 1 0.25 [0.35*0/7] [9+.05]
 i 100 + 1 0.5 [0.7*1/7] [9+.03]
 i 100 + 1 0.25 [0.7*0/7] [9+.03]
 i 100 + 1 1.5 [0.6*1/7] [9+.01]
 i 100 + 1 0.5 [0.65*0/7] [9+.10]
 i 100 + 1 0.5 [0.75*1/7] [9+.06]
 i 100 + 1 2.75 [0.3*0/7] [9+.01]
 i 100 + 1 0.75 [0.65*0/7] [9+.06]
 i 100 + 1 1 [0.95*0/7] [9+.00]
 i 100 + 1 0.25 [0.3*0/7] [9+.01]
 i 100 + 1 1.25 [0.5*1/7] [9+.00]
 i 100 + 1 1.25 [0.85*0/7] [9+.00]
 i 100 + 1 0.25 [0.35*0/7] [9+.05]
 i 100 + 1 0.5 [0.7*1/7] [9+.03]
 i 100 + 1 0.25 [0.7*0/7] [9+.03]
 i 100 + 1 1.5 [0.6*1/7] [9+.01]
 i 100 + 1 0.5 [0.65*0/7] [9+.10]
 i 100 + 1 0.5 [0.75*1/7] [9+.06]
 i 100 + 1 2.75 [0.3*0/7] [9+.01]
 i 100 + 1 0.75 [0.65*0/7] [9+.06]
 i 100 + 1 1 [0.95*0/7] [9+.00]
 i 100 + 1 0.25 [0.3*0/7] [9+.01]
 i 100 + 1 1.25 [0.5*1/7] [9+.00]
 i 100 + 1 0.25 [0.4*0/7] [9+.00]
 i 100 + 1 0.25 [0.35*0/7] [9+.05]
 i 100 + 1 0.5 [0.7*1/7] [9+.03]
 i 100 + 1 0.25 [0.7*0/7] [9+.03]
 i 100 + 1 1.5 [0.6*1/7] [9+.01]
 i 100 + 1 0.5 [0.65*0/7] [9+.10]
 i 100 + 1 0.5 [0.75*1/7] [9+.06]
 i 100 + 1 2.75 [0.3*0/7] [9+.01]
 i 100 + 1 0.75 [0.65*0/7] [9+.06]
 i 100 + 1 1 [0.95*0/7] [9+.00]
 i 100 + 1 0.25 [0.3*0/7] [9+.01]
 i 100 + 1 3 [0.65*1/7] [9+.05]
 i 100 + 1 0.25 [0.4*0/7] [9+.00]
 i 100 + 1 0.25 [0.55*0/7] [9+.00]
 i 100 + 1 0.25 [0.35*0/7] [9+.12]
 i 100 + 1 0.25 [0.7*0/7] [9+.03]
 i 100 + 1 1.5 [0.6*1/7] [9+.01]
 i 100 + 1 0.5 [0.65*0/7] [9+.10]
 i 100 + 1 0.5 [0.75*1/7] [9+.06]
 i 100 + 1 2.75 [0.3*0/7] [9+.01]
 i 100 + 1 0.75 [0.65*0/7] [9+.06]
 i 100 + 1 1 [0.95*0/7] [9+.00]
 i 100 + 1 0.25 [0.3*0/7] [9+.01]
 i 100 + 1 3 [0.65*1/7] [9+.05]
 i 100 + 1 0.25 [0.4*0/7] [9+.00]
 i 100 + 1 0.25 [0.55*0/7] [9+.00]
 i 100 + 1 0.25 [0.35*0/7] [9+.12]
 i 100 + 1 0.25 [0.7*0/7] [9+.03]
 i 100 + 1 0.25 [0.2*0/7] [9+.12]
 i 100 + 1 0.5 [0.65*0/7] [9+.10]
 i 100 + 1 0.5 [0.75*1/7] [9+.06]
 i 100 + 1 2.75 [0.3*0/7] [9+.01]
 i 100 + 1 0.75 [0.65*0/7] [9+.06]
 i 100 + 1 1 [0.95*0/7] [9+.00]
 i 100 + 1 0.25 [0.3*0/7] [9+.01]
 i 100 + 1 3 [0.65*1/7] [9+.05]
 i 100 + 1 0.25 [0.4*0/7] [9+.00]
 i 100 + 1 0.25 [0.55*0/7] [9+.00]
 i 100 + 1 0.25 [0.35*0/7] [9+.12]
 i 100 + 1 0.25 [0.7*0/7] [9+.03]
 i 100 + 1 0.25 [0.2*0/7] [9+.12]
 i 100 + 1 0.5 [0.65*0/7] [9+.10]
 i 100 + 1 3 [0.35*0/7] [9+.00]
 i 100 + 1 2.75 [0.3*0/7] [9+.01]



b [(6*4*8*1)-5*4*8]

{ 8 CNT
i 17 [0+0+$CNT*5*4] 1 0.25 [0.7*0/7] [7+.12]
 i 17 + 1 2.75 [0.65*1/7] [7+.00]
 i 17 + 1 0.25 [0.8*0/7] [7+.08]
 i 17 + 1 0.25 [0.45*1/7] [7+.12]
 i 17 + 1 1.5 [0.6*0/7] [7+.10]
 i 17 + 1 0.25 [0.25*0/7] [7+.00]
 i 17 + 1 0.25 [0.8*0/7] [7+.00]
 i 17 + 1 0.25 [0.8*0/7] [7+.00]
 i 17 + 1 0.5 [0.45*0/7] [7+.03]
 i 17 + 1 0.25 [0.3*1/7] [7+.00]
 i 17 + 1 0.25 [0.55*0/7] [7+.08]
 i 17 + 1 0.75 [0.5*0/7] [7+.12]
 i 17 + 1 0.25 [0.7*0/7] [7+.03]
 i 17 + 1 0.5 [0.9*1/7] [7+.01]
 i 17 + 1 2.75 [0.55*0/7] [7+.00]
 i 17 + 1 1.25 [0.65*1/7] [7+.00]
 i 17 + 1 0.75 [0.2*0/7] [7+.00]
 i 17 + 1 1.25 [0.9*0/7] [7+.10]
 i 17 + 1 0.5 [0.4*0/7] [7+.01]
 i 17 + 1 0.5 [0.25*0/7] [7+.06]
}


i 17 + 1 1 [0.8*0/7] [7+.00]
 i 17 + 1 2.75 [0.65*1/7] [7+.00]
 i 17 + 1 0.25 [0.8*0/7] [7+.08]
 i 17 + 1 0.25 [0.45*1/7] [7+.12]
 i 17 + 1 1.5 [0.6*0/7] [7+.10]
 i 17 + 1 0.25 [0.25*0/7] [7+.00]
 i 17 + 1 0.25 [0.8*0/7] [7+.00]
 i 17 + 1 0.25 [0.8*0/7] [7+.00]
 i 17 + 1 0.5 [0.45*0/7] [7+.03]
 i 17 + 1 0.25 [0.3*1/7] [7+.00]
 i 17 + 1 2.75 [0.25*0/7] [7+.12]
 i 17 + 1 0.75 [0.5*0/7] [7+.12]
 i 17 + 1 0.25 [0.9*0/7] [7+.06]
 i 17 + 1 0.25 [0.8*0/7] [7+.01]
 i 17 + 1 2.75 [0.55*0/7] [7+.00]
 i 17 + 1 0.5 [0.45*0/7] [7+.00]
 i 17 + 1 0.25 [0.65*0/7] [7+.06]
 i 17 + 1 1.25 [0.9*0/7] [7+.10]
 i 17 + 1 0.5 [0.4*0/7] [7+.01]
 i 17 + 1 0.5 [0.25*0/7] [7+.06]
 i 17 + 1 1 [0.8*0/7] [7+.00]
 i 17 + 1 2.75 [0.65*1/7] [7+.00]
 i 17 + 1 0.5 [0.65*0/7] [7+.08]
 i 17 + 1 0.25 [0.45*1/7] [7+.12]
 i 17 + 1 1.5 [0.6*0/7] [7+.10]
 i 17 + 1 0.25 [0.25*0/7] [7+.00]
 i 17 + 1 0.25 [0.8*0/7] [7+.00]
 i 17 + 1 0.25 [0.8*0/7] [7+.00]
 i 17 + 1 1.25 [0.25*0/7] [7+.03]
 i 17 + 1 0.25 [0.3*1/7] [7+.00]
 i 17 + 1 0.5 [0.5*0/7] [7+.06]
 i 17 + 1 0.5 [0.75*0/7] [7+.00]
 i 17 + 1 0.25 [0.9*0/7] [7+.06]
 i 17 + 1 2.75 [0.95*0/7] [7+.06]
 i 17 + 1 2.75 [0.55*0/7] [7+.00]
 i 17 + 1 0.5 [0.45*0/7] [7+.00]
 i 17 + 1 0.25 [0.65*0/7] [7+.06]
 i 17 + 1 1.25 [0.9*0/7] [7+.10]
 i 17 + 1 0.5 [0.4*0/7] [7+.01]
 i 17 + 1 0.5 [0.25*0/7] [7+.06]
 i 17 + 1 1 [0.8*0/7] [7+.00]
 i 17 + 1 2.75 [0.65*1/7] [7+.00]
 i 17 + 1 0.5 [0.65*0/7] [7+.08]
 i 17 + 1 0.25 [0.45*1/7] [7+.12]
 i 17 + 1 1.5 [0.6*0/7] [7+.10]
 i 17 + 1 0.25 [0.25*0/7] [7+.00]
 i 17 + 1 0.25 [0.8*0/7] [7+.00]
 i 17 + 1 0.25 [0.8*0/7] [7+.00]
 i 17 + 1 1.25 [0.25*0/7] [7+.03]
 i 17 + 1 0.25 [0.3*1/7] [7+.00]
 i 17 + 1 0.5 [0.5*0/7] [7+.06]
 i 17 + 1 0.5 [0.75*0/7] [7+.00]
 i 17 + 1 0.25 [0.9*0/7] [7+.06]
 i 17 + 1 2.75 [0.95*0/7] [7+.06]
 i 17 + 1 2.75 [0.55*0/7] [7+.00]
 i 17 + 1 0.5 [0.45*0/7] [7+.00]
 i 17 + 1 0.25 [0.65*0/7] [7+.06]
 i 17 + 1 1 [0.55*1/7] [7+.00]
 i 17 + 1 0.5 [0.4*0/7] [7+.01]
 i 17 + 1 0.5 [0.25*0/7] [7+.06]
 i 17 + 1 1 [0.8*0/7] [7+.00]
 i 17 + 1 2.75 [0.65*1/7] [7+.00]
 i 17 + 1 2.75 [0.85*0/7] [7+.00]
 i 17 + 1 0.25 [0.45*1/7] [7+.12]
 i 17 + 1 1.5 [0.6*0/7] [7+.10]
 i 17 + 1 0.5 [0.6*0/7] [7+.08]
 i 17 + 1 0.5 [0.3*0/7] [7+.03]
 i 17 + 1 0.25 [0.8*0/7] [7+.00]
 i 17 + 1 1.25 [0.25*0/7] [7+.03]
 i 17 + 1 0.25 [0.3*1/7] [7+.00]
 i 17 + 1 0.5 [0.5*0/7] [7+.06]
 i 17 + 1 0.5 [0.75*0/7] [7+.00]
 i 17 + 1 0.25 [0.9*0/7] [7+.06]
 i 17 + 1 2.75 [0.95*0/7] [7+.06]
 i 17 + 1 2.75 [0.55*0/7] [7+.00]
 i 17 + 1 0.5 [0.45*0/7] [7+.00]
 i 17 + 1 0.25 [0.65*0/7] [7+.06]
 i 17 + 1 1 [0.55*1/7] [7+.00]
 i 17 + 1 0.5 [0.4*0/7] [7+.01]
 i 17 + 1 0.5 [0.25*0/7] [7+.06]
 i 17 + 1 0.25 [0.95*0/7] [7+.01]
 i 17 + 1 2.75 [0.65*1/7] [7+.00]
 i 17 + 1 2.75 [0.85*0/7] [7+.00]
 i 17 + 1 0.25 [0.45*1/7] [7+.12]
 i 17 + 1 1.5 [0.6*0/7] [7+.10]
 i 17 + 1 0.5 [0.6*0/7] [7+.08]
 i 17 + 1 0.5 [0.3*0/7] [7+.03]
 i 17 + 1 0.25 [0.8*0/7] [7+.00]
 i 17 + 1 1.25 [0.25*0/7] [7+.03]
 i 17 + 1 0.25 [0.3*1/7] [7+.00]
 i 17 + 1 0.5 [0.5*0/7] [7+.06]
 i 17 + 1 0.5 [0.75*0/7] [7+.00]
 i 17 + 1 0.25 [0.9*0/7] [7+.06]
 i 17 + 1 2.75 [0.95*0/7] [7+.06]
 i 17 + 1 1.5 [0.5*1/7] [7+.03]
 i 17 + 1 0.5 [0.45*0/7] [7+.00]
 i 17 + 1 0.25 [0.65*0/7] [7+.06]
 i 17 + 1 1 [0.55*1/7] [7+.00]
 i 17 + 1 0.5 [0.4*0/7] [7+.01]
 i 17 + 1 0.5 [0.25*0/7] [7+.06]
 i 17 + 1 0.25 [0.95*0/7] [7+.01]
 i 17 + 1 2.75 [0.65*1/7] [7+.00]
 i 17 + 1 2.75 [0.85*0/7] [7+.00]
 i 17 + 1 0.25 [0.45*1/7] [7+.12]
 i 17 + 1 1.5 [0.6*0/7] [7+.10]
 i 17 + 1 0.5 [0.6*0/7] [7+.08]
 i 17 + 1 0.5 [0.3*0/7] [7+.03]
 i 17 + 1 0.25 [0.8*0/7] [7+.00]
 i 17 + 1 1.25 [0.25*0/7] [7+.03]
 i 17 + 1 0.25 [0.3*1/7] [7+.00]
 i 17 + 1 0.5 [0.5*0/7] [7+.06]
 i 17 + 1 0.5 [0.75*0/7] [7+.00]
 i 17 + 1 0.25 [0.9*0/7] [7+.06]
 i 17 + 1 2.75 [0.75*0/7] [7+.00]
 i 17 + 1 1.5 [0.5*1/7] [7+.03]
 i 17 + 1 0.5 [0.45*0/7] [7+.00]
 i 17 + 1 0.25 [0.65*0/7] [7+.06]
 i 17 + 1 1 [0.55*1/7] [7+.00]
 i 17 + 1 0.5 [0.4*0/7] [7+.01]
 i 17 + 1 0.5 [0.25*0/7] [7+.06]
 i 17 + 1 0.25 [0.95*0/7] [7+.01]
 i 17 + 1 2.75 [0.65*1/7] [7+.00]
 i 17 + 1 2.75 [0.85*0/7] [7+.00]
 i 17 + 1 0.25 [0.45*1/7] [7+.12]
 i 17 + 1 1.5 [0.6*0/7] [7+.10]
 i 17 + 1 0.5 [0.6*0/7] [7+.08]
 i 17 + 1 0.5 [0.3*0/7] [7+.03]
 i 17 + 1 0.25 [0.8*0/7] [7+.00]
 i 17 + 1 1.25 [0.25*0/7] [7+.03]
 i 17 + 1 0.25 [0.3*1/7] [7+.00]
 i 17 + 1 0.5 [0.5*0/7] [7+.06]
 i 17 + 1 1 [0.25*0/7] [7+.01]
 i 17 + 1 0.25 [0.9*0/7] [7+.06]
 i 17 + 1 2.75 [0.75*0/7] [7+.00]
 i 17 + 1 1.5 [0.5*1/7] [7+.03]
 i 17 + 1 0.5 [0.45*0/7] [7+.00]
 i 17 + 1 0.25 [0.65*0/7] [7+.06]
 i 17 + 1 1 [0.55*1/7] [7+.00]
 i 17 + 1 0.5 [0.4*0/7] [7+.01]
 i 17 + 1 0.5 [0.25*0/7] [7+.06]
 i 17 + 1 0.25 [0.95*0/7] [7+.01]
 i 17 + 1 2.75 [0.65*1/7] [7+.00]
 i 17 + 1 0.5 [0.9*0/7] [7+.00]
 i 17 + 1 0.25 [0.45*1/7] [7+.12]
 i 17 + 1 1.5 [0.6*0/7] [7+.10]
 i 17 + 1 0.5 [0.6*0/7] [7+.08]
 i 17 + 1 0.5 [0.3*0/7] [7+.03]
 i 17 + 1 2.75 [0.2*0/7] [7+.05]
 i 17 + 1 1.25 [0.25*0/7] [7+.03]
 i 17 + 1 0.25 [0.3*1/7] [7+.00]
 i 17 + 1 1 [0.95*0/7] [7+.06]
 i 17 + 1 1 [0.25*0/7] [7+.01]
 i 17 + 1 0.25 [0.9*0/7] [7+.06]
 i 17 + 1 2.75 [0.75*0/7] [7+.00]
 i 17 + 1 1.5 [0.5*1/7] [7+.03]
 i 17 + 1 0.5 [0.45*0/7] [7+.00]
 i 17 + 1 0.25 [0.65*0/7] [7+.06]
 i 17 + 1 1 [0.55*1/7] [7+.00]
 i 17 + 1 0.5 [0.4*0/7] [7+.01]
 i 17 + 1 0.5 [0.25*0/7] [7+.06]



b [(6*4*8*1)-3*4*6]

{ 6 CNT
i 100 [0+0+$CNT*3*4] 1 3 [0.65*0/7] [7+.10]
 i 100 + 1 0.25 [0.6*0/7] [7+.00]
 i 100 + 1 0.25 [0.65*0/7] [7+.10]
 i 100 + 1 0.5 [0.95*0/7] [7+.01]
 i 100 + 1 0.5 [0.5*0/7] [7+.01]
 i 100 + 1 0.25 [0.4*0/7] [7+.06]
 i 100 + 1 3 [0.4*1/7] [7+.12]
 i 100 + 1 0.25 [0.7*0/7] [7+.00]
 i 100 + 1 0.5 [0.5*0/7] [7+.00]
 i 100 + 1 0.25 [0.8*1/7] [7+.12]
 i 100 + 1 1 [0.25*0/7] [7+.05]
 i 100 + 1 0.25 [0.4*0/7] [7+.00]
}


i 100 + 1 1.5 [0.3*0/7] [7+.06]
 i 100 + 1 0.25 [0.6*0/7] [7+.00]
 i 100 + 1 0.25 [0.65*0/7] [7+.10]
 i 100 + 1 0.5 [0.95*0/7] [7+.01]
 i 100 + 1 0.5 [0.5*0/7] [7+.01]
 i 100 + 1 0.5 [0.3*0/7] [7+.08]
 i 100 + 1 3 [0.4*1/7] [7+.12]
 i 100 + 1 0.25 [0.7*0/7] [7+.00]
 i 100 + 1 0.5 [0.5*0/7] [7+.00]
 i 100 + 1 0.25 [0.8*1/7] [7+.12]
 i 100 + 1 1 [0.25*0/7] [7+.05]
 i 100 + 1 0.25 [0.4*0/7] [7+.00]
 i 100 + 1 1.5 [0.3*0/7] [7+.06]
 i 100 + 1 0.25 [0.6*0/7] [7+.00]
 i 100 + 1 0.25 [0.65*0/7] [7+.10]
 i 100 + 1 0.5 [0.95*0/7] [7+.01]
 i 100 + 1 0.5 [0.5*0/7] [7+.01]
 i 100 + 1 0.5 [0.3*0/7] [7+.08]
 i 100 + 1 0.5 [0.95*0/7] [7+.10]
 i 100 + 1 0.25 [0.7*0/7] [7+.00]
 i 100 + 1 0.5 [0.5*0/7] [7+.00]
 i 100 + 1 0.75 [0.95*0/7] [7+.08]
 i 100 + 1 1 [0.25*0/7] [7+.05]
 i 100 + 1 0.25 [0.4*0/7] [7+.00]
 i 100 + 1 1.5 [0.3*0/7] [7+.06]
 i 100 + 1 0.25 [0.6*0/7] [7+.00]
 i 100 + 1 0.25 [0.65*0/7] [7+.10]
 i 100 + 1 0.5 [0.95*0/7] [7+.01]
 i 100 + 1 0.5 [0.5*0/7] [7+.01]
 i 100 + 1 0.25 [0.55*1/7] [7+.06]
 i 100 + 1 0.5 [0.95*0/7] [7+.10]
 i 100 + 1 0.25 [0.7*0/7] [7+.00]
 i 100 + 1 0.5 [0.65*1/7] [7+.12]
 i 100 + 1 0.75 [0.95*0/7] [7+.08]
 i 100 + 1 1 [0.25*0/7] [7+.05]
 i 100 + 1 0.25 [0.4*0/7] [7+.00]
 i 100 + 1 1.25 [0.55*1/7] [7+.00]
 i 100 + 1 0.25 [0.6*0/7] [7+.00]
 i 100 + 1 0.25 [0.65*0/7] [7+.10]
 i 100 + 1 0.5 [0.95*0/7] [7+.01]
 i 100 + 1 0.5 [0.5*0/7] [7+.01]
 i 100 + 1 1.5 [0.6*1/7] [7+.03]
 i 100 + 1 0.5 [0.95*0/7] [7+.10]
 i 100 + 1 0.25 [0.7*0/7] [7+.00]
 i 100 + 1 0.5 [0.65*1/7] [7+.12]
 i 100 + 1 0.75 [0.95*0/7] [7+.08]
 i 100 + 1 1 [0.25*0/7] [7+.05]
 i 100 + 1 0.25 [0.4*0/7] [7+.00]
 i 100 + 1 1.25 [0.55*1/7] [7+.00]
 i 100 + 1 0.25 [0.6*0/7] [7+.00]
 i 100 + 1 0.25 [0.65*0/7] [7+.10]
 i 100 + 1 0.5 [0.95*0/7] [7+.01]
 i 100 + 1 0.5 [0.5*0/7] [7+.01]
 i 100 + 1 1.5 [0.6*1/7] [7+.03]
 i 100 + 1 0.5 [0.5*1/7] [7+.10]
 i 100 + 1 0.25 [0.7*0/7] [7+.00]
 i 100 + 1 0.5 [0.65*1/7] [7+.12]
 i 100 + 1 1.25 [0.8*0/7] [7+.12]
 i 100 + 1 1 [0.25*0/7] [7+.05]
 i 100 + 1 0.25 [0.4*0/7] [7+.00]



b [(6*4*8*1)-6*4*6]

{ 6 CNT
i 13 [0+0.5+$CNT*6*4] 1 0.25 [0.85*0/7] [8+.10]
 i 13 + 1 0.5 [0.35*0/7] [8+.10]
 i 13 + 1 0.75 [0.9*0/7] [8+.00]
 i 13 + 1 1.5 [0.35*0/7] [8+.10]
 i 13 + 1 1.25 [0.5*1/7] [8+.12]
 i 13 + 1 0.25 [0.9*1/7] [8+.00]
 i 13 + 1 0.75 [0.6*1/7] [8+.00]
 i 13 + 1 0.75 [0.3*0/7] [8+.12]
 i 13 + 1 1.5 [0.35*1/7] [8+.05]
 i 13 + 1 0.5 [0.95*0/7] [8+.05]
 i 13 + 1 2.75 [0.55*1/7] [8+.06]
 i 13 + 1 0.5 [0.65*1/7] [8+.06]
 i 13 + 1 1.5 [0.95*0/7] [8+.00]
 i 13 + 1 1.25 [0.35*1/7] [8+.12]
 i 13 + 1 0.75 [0.8*0/7] [8+.05]
 i 13 + 1 0.75 [0.95*0/7] [8+.05]
 i 13 + 1 0.75 [0.35*0/7] [8+.05]
 i 13 + 1 0.5 [0.3*0/7] [8+.01]
 i 13 + 1 3 [0.85*1/7] [8+.00]
 i 13 + 1 1 [0.95*0/7] [8+.01]
 i 13 + 1 3 [0.55*0/7] [8+.00]
 i 13 + 1 0.25 [0.9*0/7] [8+.10]
 i 13 + 1 1 [0.45*0/7] [8+.00]
 i 13 + 1 2.75 [0.5*0/7] [8+.01]
}


i 13 + 1 0.75 [0.55*0/7] [8+.00]
 i 13 + 1 0.5 [0.35*0/7] [8+.10]
 i 13 + 1 0.75 [0.9*0/7] [8+.00]
 i 13 + 1 1.5 [0.35*0/7] [8+.10]
 i 13 + 1 1.25 [0.5*1/7] [8+.12]
 i 13 + 1 0.25 [0.9*1/7] [8+.00]
 i 13 + 1 1.5 [0.55*0/7] [8+.00]
 i 13 + 1 0.75 [0.3*0/7] [8+.12]
 i 13 + 1 1.5 [0.35*1/7] [8+.05]
 i 13 + 1 0.5 [0.95*0/7] [8+.05]
 i 13 + 1 2.75 [0.55*1/7] [8+.06]
 i 13 + 1 0.5 [0.65*1/7] [8+.06]
 i 13 + 1 1.5 [0.95*0/7] [8+.00]
 i 13 + 1 0.25 [0.45*1/7] [8+.05]
 i 13 + 1 1.25 [0.9*0/7] [8+.05]
 i 13 + 1 0.75 [0.95*0/7] [8+.05]
 i 13 + 1 0.75 [0.35*0/7] [8+.05]
 i 13 + 1 0.5 [0.3*0/7] [8+.01]
 i 13 + 1 3 [0.85*1/7] [8+.00]
 i 13 + 1 0.5 [0.8*0/7] [8+.12]
 i 13 + 1 3 [0.55*0/7] [8+.00]
 i 13 + 1 0.25 [0.9*0/7] [8+.10]
 i 13 + 1 1 [0.45*0/7] [8+.00]
 i 13 + 1 2.75 [0.5*0/7] [8+.01]
 i 13 + 1 0.75 [0.55*0/7] [8+.00]
 i 13 + 1 0.5 [0.35*0/7] [8+.10]
 i 13 + 1 0.75 [0.9*0/7] [8+.00]
 i 13 + 1 1.5 [0.35*0/7] [8+.10]
 i 13 + 1 1.25 [0.5*1/7] [8+.12]
 i 13 + 1 0.25 [0.9*1/7] [8+.00]
 i 13 + 1 1.5 [0.55*0/7] [8+.00]
 i 13 + 1 0.75 [0.3*0/7] [8+.12]
 i 13 + 1 1.5 [0.45*0/7] [8+.08]
 i 13 + 1 0.5 [0.95*0/7] [8+.05]
 i 13 + 1 2.75 [0.55*1/7] [8+.06]
 i 13 + 1 0.75 [0.55*0/7] [8+.00]
 i 13 + 1 1.5 [0.95*0/7] [8+.00]
 i 13 + 1 0.25 [0.45*1/7] [8+.05]
 i 13 + 1 1.25 [0.9*0/7] [8+.05]
 i 13 + 1 0.75 [0.95*0/7] [8+.05]
 i 13 + 1 0.75 [0.35*0/7] [8+.05]
 i 13 + 1 0.5 [0.3*0/7] [8+.01]
 i 13 + 1 3 [0.85*1/7] [8+.00]
 i 13 + 1 0.5 [0.8*0/7] [8+.12]
 i 13 + 1 0.25 [0.3*1/7] [8+.05]
 i 13 + 1 0.25 [0.9*0/7] [8+.10]
 i 13 + 1 1 [0.45*0/7] [8+.00]
 i 13 + 1 2.75 [0.5*0/7] [8+.01]
 i 13 + 1 0.75 [0.55*0/7] [8+.00]
 i 13 + 1 0.5 [0.35*0/7] [8+.10]
 i 13 + 1 0.75 [0.9*0/7] [8+.00]
 i 13 + 1 1.5 [0.35*0/7] [8+.10]
 i 13 + 1 1.25 [0.5*1/7] [8+.12]
 i 13 + 1 0.25 [0.9*1/7] [8+.00]
 i 13 + 1 0.25 [0.35*0/7] [8+.05]
 i 13 + 1 0.75 [0.3*0/7] [8+.12]
 i 13 + 1 1 [0.7*0/7] [8+.06]
 i 13 + 1 0.5 [0.95*0/7] [8+.05]
 i 13 + 1 2.75 [0.55*1/7] [8+.06]
 i 13 + 1 0.75 [0.55*0/7] [8+.00]
 i 13 + 1 1.5 [0.95*0/7] [8+.00]
 i 13 + 1 0.25 [0.45*1/7] [8+.05]
 i 13 + 1 1.25 [0.9*0/7] [8+.05]
 i 13 + 1 0.75 [0.95*0/7] [8+.05]
 i 13 + 1 1.25 [0.65*0/7] [8+.10]
 i 13 + 1 0.5 [0.3*0/7] [8+.01]
 i 13 + 1 3 [0.85*1/7] [8+.00]
 i 13 + 1 0.5 [0.8*0/7] [8+.12]
 i 13 + 1 0.75 [0.6*0/7] [8+.00]
 i 13 + 1 0.25 [0.9*0/7] [8+.10]
 i 13 + 1 1 [0.45*0/7] [8+.00]
 i 13 + 1 1.25 [0.65*0/7] [8+.03]
 i 13 + 1 0.75 [0.55*0/7] [8+.00]
 i 13 + 1 0.5 [0.35*0/7] [8+.10]
 i 13 + 1 0.75 [0.9*0/7] [8+.00]
 i 13 + 1 1.5 [0.35*0/7] [8+.10]
 i 13 + 1 2.75 [0.9*1/7] [8+.00]
 i 13 + 1 0.25 [0.35*0/7] [8+.00]
 i 13 + 1 0.25 [0.35*0/7] [8+.05]
 i 13 + 1 0.75 [0.3*0/7] [8+.12]
 i 13 + 1 1 [0.7*0/7] [8+.06]
 i 13 + 1 0.5 [0.95*0/7] [8+.05]
 i 13 + 1 2.75 [0.55*1/7] [8+.06]
 i 13 + 1 0.75 [0.55*0/7] [8+.00]
 i 13 + 1 1.5 [0.95*0/7] [8+.00]
 i 13 + 1 0.25 [0.45*1/7] [8+.05]
 i 13 + 1 1.25 [0.9*0/7] [8+.05]
 i 13 + 1 0.75 [0.95*0/7] [8+.05]
 i 13 + 1 1.25 [0.65*0/7] [8+.10]
 i 13 + 1 0.5 [0.3*0/7] [8+.01]
 i 13 + 1 3 [0.85*1/7] [8+.00]
 i 13 + 1 0.5 [0.8*0/7] [8+.12]
 i 13 + 1 0.75 [0.6*0/7] [8+.00]
 i 13 + 1 0.25 [0.9*0/7] [8+.10]
 i 13 + 1 1 [0.45*0/7] [8+.00]
 i 13 + 1 0.5 [0.9*0/7] [8+.12]
 i 13 + 1 0.75 [0.55*0/7] [8+.00]
 i 13 + 1 3 [0.2*0/7] [8+.05]
 i 13 + 1 0.75 [0.9*0/7] [8+.00]
 i 13 + 1 1.5 [0.35*0/7] [8+.10]
 i 13 + 1 0.5 [0.7*0/7] [8+.05]
 i 13 + 1 0.25 [0.35*0/7] [8+.00]
 i 13 + 1 0.25 [0.35*0/7] [8+.05]
 i 13 + 1 1 [0.95*0/7] [8+.00]
 i 13 + 1 1 [0.7*0/7] [8+.06]
 i 13 + 1 0.5 [0.95*0/7] [8+.05]
 i 13 + 1 2.75 [0.55*1/7] [8+.06]
 i 13 + 1 0.75 [0.55*0/7] [8+.00]
 i 13 + 1 1.5 [0.95*0/7] [8+.00]
 i 13 + 1 0.25 [0.45*1/7] [8+.05]
 i 13 + 1 1.25 [0.9*0/7] [8+.05]
 i 13 + 1 0.75 [0.95*0/7] [8+.05]
 i 13 + 1 1.25 [0.65*0/7] [8+.10]
 i 13 + 1 0.5 [0.3*0/7] [8+.01]
 i 13 + 1 3 [0.85*1/7] [8+.00]
 i 13 + 1 0.5 [0.8*0/7] [8+.12]
 i 13 + 1 0.25 [0.7*0/7] [8+.03]
 i 13 + 1 0.25 [0.9*0/7] [8+.10]
 i 13 + 1 1 [0.45*0/7] [8+.00]
 i 13 + 1 0.5 [0.9*0/7] [8+.12]
 i 13 + 1 0.75 [0.55*0/7] [8+.00]
 i 13 + 1 3 [0.2*0/7] [8+.05]
 i 13 + 1 0.75 [0.9*0/7] [8+.00]
 i 13 + 1 2.75 [0.5*1/7] [8+.05]
 i 13 + 1 0.5 [0.7*0/7] [8+.05]
 i 13 + 1 0.25 [0.35*0/7] [8+.00]
 i 13 + 1 0.25 [0.35*0/7] [8+.05]
 i 13 + 1 1 [0.95*0/7] [8+.00]
 i 13 + 1 1 [0.7*0/7] [8+.06]
 i 13 + 1 0.5 [0.95*0/7] [8+.05]
 i 13 + 1 2.75 [0.55*1/7] [8+.06]
 i 13 + 1 0.75 [0.55*0/7] [8+.00]
 i 13 + 1 1.5 [0.95*0/7] [8+.00]
 i 13 + 1 0.25 [0.45*1/7] [8+.05]
 i 13 + 1 1.25 [0.9*0/7] [8+.05]
 i 13 + 1 0.75 [0.95*0/7] [8+.05]
 i 13 + 1 1.25 [0.65*0/7] [8+.10]
 i 13 + 1 0.5 [0.3*0/7] [8+.01]
 i 13 + 1 3 [0.85*1/7] [8+.00]
 i 13 + 1 0.5 [0.8*0/7] [8+.12]
 i 13 + 1 0.25 [0.7*0/7] [8+.03]
 i 13 + 1 0.5 [0.95*0/7] [8+.08]
 i 13 + 1 1 [0.45*0/7] [8+.00]
 i 13 + 1 0.5 [0.9*0/7] [8+.12]







</CsScore>
</CsoundSynthesizer>
