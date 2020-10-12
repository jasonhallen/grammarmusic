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

</CsInstruments>
<CsScore>
i2 0 3 0.5 8.00

</CsScore>
</CsoundSynthesizer>