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
    aEnv	linsegr	0, 0.005, p4, p3-0.105, p4, 0.1, 0		; amplitude envelope
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

instr 3 ;ORGAN
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

instr 4 ; B3 ORGAN

kfreq = cpspch(p5)
kc1 = p6
kc2 = p7
kvrate = 5

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
    irefl	random 0.001, 0.4
    aEnv	linsegr	0, 0.005, 1, p3-0.105, 1, 0.1, 0		; amplitude envelope
    iPlk	random	0.1, 0.6					; point at which to pluck the string
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

instr 8 ;VOICE

kfreq cpspch p5
printk2 kfreq
kvowel = p6	; p4 = vowel (0 - 64)
ktilt  = p7
kvibamt = 0.01
kvibrate = 20

kenv adsr 0.01,0.1,0.8,0.1
asig fmvoice p4*kenv, kfreq, kvowel, ktilt, kvibamt, kvibrate
outs asig, asig

endin

instr 9 ;Rhodes
seed 0
kfreq = cpspch(p6)

kc1 = int(random(6,30))
printk2 kc1
kc2 = p5
kvdepth = 0.4
kvrate = 3
ifn1 = -1
ifn2 = -1
ifn3 = -1
ifn4 = 2
ivfn = -1
kenv expseg 0.001,0.01,0.5,p3-0.02,0.5,0.01,0.001

asig fmrhode kenv, kfreq, kc1, kc2, kvdepth, kvrate, ifn1, ifn2, ifn3, ifn4, ivfn
     outs asig, asig

endin

instr 10 ;MARIMBA
  ifreq = cpspch(p5)
  ihrd = 0.4
  ipos = 0.561
  imp = 3
  kvibf = 6.0
  kvamp = 0.05
  ivibfn = 2
  idec = 0.6

  a1 marimba p4, ifreq, ihrd, ipos, imp, kvibf, kvamp, ivibfn, idec, 20, 10

  outs a1, a1
endin

instr 11 ;VIBES
  ; kamp = 20000
  ; kfreq = 440
  ; ihrd = 0.5
  ; ipos = p4
  ; imp = 1
  ; kvibf = 6.0
  ; kvamp = 0.05
  ; ivibfn = 2
  ; idec = 0.1
  kenv adsr 0.01,0.1,0.8,0.2
    asig	vibes	0.5*kenv, 440, .6, p4 , 3, 1, 0.3, -1, .1
	outs		asig, asig
endin

instr 12

    kfreq = cpspch(p5)
    kc1 = p4
    kc2 = 1
    kvdepth = 0.05
    kvrate = 6
    ifn1 = -1
    ifn2 = -1
    ifn3 = -1
    ifn4 = 2
    ivfn = -1

    kenv linseg 0, 0.001, 1, p3-.002, 1, 0.001, 0
    asig fmwurlie .5*kenv, kfreq, kc1, kc2, kvdepth, kvrate, ifn1, ifn2, ifn3, ifn4, ivfn
    outs asig, asig

endin


instr 13

kpres = p4							;pressure value
krat = p5							;position along string
kvibf = 6.12723
kfreq cpspch p6

kvib  linseg 0, 0.5, 0, 1, 1, p3-0.5, 1				; amplitude envelope for the vibrato.		
kvamp = kvib * 0.01
asig  wgbow .7, kfreq, kpres, krat, kvibf, kvamp, -1
      outs asig, asig

endin


instr 14
  kamp = 0.7
  kfreq = p4
  ktens = p5
  iatt = p6
  kvibf = p7
  ifn = -1

  ; Create an amplitude envelope for the vibrato.
  kvamp line 0, p3, 0.5

  a1 wgbrass kamp, kfreq, ktens, iatt, kvibf, kvamp, ifn
  out a1
endin

instr 15; CLARINET

kfreq = 550
kstiff = -0.3
iatt = 0.1
idetk = 0.1
kngain init p4		;vary breath
kvibf = 5.735
kvamp = 0.1

asig wgclar .9, kfreq, kstiff, iatt, idetk, kngain, kvibf, kvamp, -1
     outs asig, asig
      
endin

</CsInstruments>
<CsScore>
f 2 0 256 1 "fwavblnk.aiff" 0 0 0
f 3 0 256 1 "marmstk1.wav" 0 0 0

;i1 0 3 0.4 5.00
;i3 0 1 0.6 7.03
;i3 + 1 0.6 7.05
;i3 + 1 0.6 7.07
;i3 + . . [10.00+0.07]
;i4 3 1 0.6 [7.03] .5 .5 0.1
;i4 + 1 0.6 [7.05] .5 .5 0.1
;i4 + 1 0.6 [7.07] .5 .5 0.1
;i5 0 1 0.2 10.00 10 5
;i6 0 3 1 0.6 9.00
;i7 0 1 0.5 10.00 1
;i8 0 1 0.5 5.06 1 99
;i 9 0 2 20 0 6.00
;i 10 0 1 0.7 11.00
;i 11 1 1 0.3
;i 12 0 .5 6 8.00
;i 12 + . 20 8.02


;i 13 0 1 3 0.127236 6.00
;i 13 + 1 5 0.127236 6.02
;i 13 + 1 5 0.23 6.04

;i 14 0 4  440    0.4   0.1  6.137
;i 14 4 4  440  0.4   0.01 0.137
;i 14 8 4  880   0.4   0.1  6.137

i 15 0 1 0.2
i 15 + 1 0.5	

</CsScore>
</CsoundSynthesizer>
