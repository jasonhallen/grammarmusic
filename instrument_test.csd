<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
; Initialize the global variables.
ksmps = 32
nchnls = 2
0dbfs = 1

giScal1	ftgen	0,0,128, -27,  0, 0.9, 24, 0.9, 36, 0.85, 48, 0.75, 60, 0.65, 72, 0.35, 84, 0.001, 96, 0.001, 127		; longer sustaining notes / less damping

instr 1

    seed 0
    irefl	random 0.001, 0.999
    aEnv	linsegr	0, 0.005, 1, p3-0.105, 1, 0.1, 0		; amplitude envelope
    iPlk	random	0.1, 0.3					; point at which to pluck the string
    iDtn	random    -0.05, 0.05					; random detune
    ;irefl	table	inum, giScal1					; read reflection value from giScal table according to note number
    aSig	wgpluck2  0.58, 0.5, cpspch(p5), iPlk, irefl	; generate Karplus-Strong plucked string audio
    kcf	expon	cpsoct(rnd(6)+6),p3,50				; filter cutoff frequency envelope
    aSig	clfilt	aSig, kcf, 0, 2					; butterworth lowpass filter
    outs aSig,aSig

endin

instr 2

 aEnv		linsegr		0, 0.005, 1, p3-0.105, 1, 0.1, 0 ; amplitude envelope
 aSig		poscil		p4,cpspch(p5)

 outs aSig*aEnv,aSig*aEnv

endin

instr 3
  ifrq = cpspch(p5)

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

  aorgan = kenv*p4*0.5*(a1+a2+a3+a4+a5+a6+a7+a8+a9)

  outs aorgan, aorgan
endin

instr 4

kfreq cpspch p5
kc1 = p6
kc2 = p7
kvrate = 6

kvdpth line 0, p3, p8
asig   fmb3 p4, kfreq, kc1, kc2, kvdpth, kvrate
       outs asig, asig

endin

instr 5

    kamp = p4
    kfreq = cpspch(p5)
    kc1 = p6
    kc2 = p7
    kvdepth = 0.1
    kvrate = 5

    asig fmbell kamp, kfreq, kc1, kc2, kvdepth, kvrate, -1, -1, -1, -1, -1, 1
         outs asig, asig
endin

instr 6 ;STRING PLUCK
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
    outs aSig*aEnv,aSig*aEnv
endin

instr 7

kfreq cpspch p5
kc1 = 5
kvdepth = .01
kvrate = 6

kenv expseg 0.001,0.1,p4,p3-0.2,p4,0.1,0.001
kc2  line 5, p3, p6
asig fmpercfl p4*kenv, kfreq, kc1, kc2, kvdepth, kvrate
     outs asig, asig
endin


</CsInstruments>
<CsScore>
;i3 0 1 0.8 10.00
;i3 + . . [10.00+0.07]
;i4 0 3 0.3 6.00 5 5 0.1
;i5 0 1 0.2 10.00 10 5
;i6 0 3 1 0.6 6.00
i7 0 1 0.5 10.00 1
i7 + . 0.5 10.02 1
i7 + . 0.5 10.04 1
i7 + . 0.5 10.05 1
</CsScore>
</CsoundSynthesizer>
