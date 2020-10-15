import tracery
from tracery.modifiers import base_english
import ctcsound
from random import choice
from datetime import datetime

# TASKS
# Rules for melody selection that emphasize smaller steps and the fundamental
# Allow individual notes to be offset by 0,0.25,0.5,0.75 instead of the whole line
# 3/4 time
# Save sections and return to them
# Let sections mutate with new note values
# Suggest some starting rhythmic templates
# Add instruments - bass, organ, sax, synth, clavinet, rhodes
# Adjust instrument levels to mix better
# Add effects channels randomly selected (e.g. reverb, delay, filter)
# Add breathing spaces between parts (i.e. Eli Keszler)

rules = {

  "origin": [
    "#score#"
  ],

  "score": [
    "[#set_mode#][note_offset_1:#set_note_offset#][key_change:#set_note_offset#][#set_drums#][#set_voices#]; #mode# #drums# voices=#voices#\nt 0 [tempo:#set_tempo#]#tempo#\n#voices_template#\n"
  ],

  "set_mode": [
    "[mode:atonal][note_options:.00,.01,.02,.03,.04,.05,.06,.07,.08,.09,.10,.11,.12]","[mode:aeolian][note_options:.00,.00,.00,.02,.03,.05,.07,.08,.10,.12]","[mode:dorian][note_options:.00,.00,.00,.02,.03,.05,.07,.09,.10,.12]","[mode:ionian][note_options:.00,.00,.00,.02,.04,.05,.07,.09,.11,.12]","[mode:phrygian][note_options:.00,.00,.00,.01,.03,.05,.07,.08,.10,.12]","[mode:lydian][note_options:.00,.00,.00,.02,.04,.06,.07,.09,.11,.12]","[mode:mixolydian][note_options:.00,.00,.00,.02,.04,.05,.07,.09,.10,.12]","[mode:locrian][note_options:.00,.00,.00,.01,.03,.05,.06,.08,.10,.12]"
  ],

  "set_note_offset": [
    "-1","-0.99","-0.98","-0.97","-0.96","-0.95","-0.94","-0.93","-0.92","-0.91","-0.9","-0.89","+0.12","+0.11","+0.10","+0.9","+0.08","+0.07","+0.06","+0.05","+0.04","+0.03","+0.02","+0.01","+0"
  ],

  "set_drums": [
    "[drums:tr808][drum_options:1,2,3,4,5,6,7,8,9,10,11]","[drums:emu][drum_options:12,13,14,15,16,17,18,19,20,21,22,23]","[drums:linn][drum_options:24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40]"
  ],

  "set_voices": [
    "[voices:7][voices_template:#7_voices#]"
  ],

  "set_tempo": [
    "310","320","330","340","350","360","370","380","390","400","410","420","430","440","450","460"
  ],

  "max_loop_length": [
    "(6*4*8*1)"
  ],

  "1_voices": [
    "#voice_constructor#\n"
  ],

  "2_voices": [
    "#voice_constructor#\n#voice_constructor#\n",
  ],

  "3_voices": [
    "#voice_constructor#\n#voice_constructor#\n#voice_constructor#\n",
  ],

  "4_voices": [
    "#voice_constructor#\n#voice_constructor#\n#voice_constructor#\n#voice_constructor#\n",
  ],

  "5_voices": [
    "#voice_constructor#\n#voice_constructor#\n#voice_constructor#\n#voice_constructor#\n#voice_constructor#\n",
  ],

  "6_voices": [
    "#voice_constructor#\n#voice_constructor#\n#voice_constructor#\n#voice_constructor#\n#voice_constructor#\n#voice_constructor#\n",
  ],

  "7_voices": [
    "#voice_constructor#\n#voice_constructor#\n#voice_constructor#\n#voice_constructor#\n#voice_constructor#\n#voice_constructor#\n#voice_constructor#\n",
  ],

  "voice_constructor": [
    "[note_offset:#note_offset_1#][loop1:#set_measures#][store1:#measures#*4*#repeat#][store3:#max_loop_length#-(#store1#+#store2#)]b $BO#max_loop_length#-#store1#$BC ; loop1 #mode#\n#loop1#\n\n; evolve 1 #mode#\n#evolve_section_1#\n[#mode1#]; evovle 2, #mode#\n#evolve_section_2#\n"
  ],

  "set_measures": [
    "[measures:3][#set_inst#]\n{ #[repeat:#set_repeat#]repeat# CNT\n#[note1:#note_1#][note1_evolve:#note#]note1# #[note2:#note#]note2# #[note3:#note#]note3# #[note4:#note#]note4# #[note5:#note#]note5# #[note6:#note#]note6# #[note7:#note#]note7# #[note8:#note#]note8# #[note9:#note#]note9# #[note10:#note#]note10# #[note11:#note#]note11# #[note12:#note#]note12#}\n[evolve_section_1:#evolve_3#][note_offset:#key_change#][evolve_section_2:#evolve_3#]","[measures:4][#set_inst#]\n{ #[repeat:#set_repeat#]repeat# CNT\n#[note1:#note_1#][note1_evolve:#note#]note1# #[note2:#note#]note2# #[note3:#note#]note3# #[note4:#note#]note4# #[note5:#note#]note5# #[note6:#note#]note6# #[note7:#note#]note7# #[note8:#note#]note8# #[note9:#note#]note9# #[note10:#note#]note10# #[note11:#note#]note11# #[note12:#note#]note12# #[note13:#note#]note13# #[note14:#note#]note14# #[note15:#note#]note15# #[note16:#note#]note16#}\n[evolve_section_1:#evolve_4#][note_offset:#key_change#][evolve_section_2:#evolve_4#]","[measures:5][#set_inst#]\n{ #[repeat:#set_repeat#]repeat# CNT\n#[note1:#note_1#][note1_evolve:#note#]note1# #[note2:#note#]note2# #[note3:#note#]note3# #[note4:#note#]note4# #[note5:#note#]note5# #[note6:#note#]note6# #[note7:#note#]note7# #[note8:#note#]note8# #[note9:#note#]note9# #[note10:#note#]note10# #[note11:#note#]note11# #[note12:#note#]note12# #[note13:#note#]note13# #[note14:#note#]note14# #[note15:#note#]note15# #[note16:#note#]note16# #[note17:#note#]note17# #[note18:#note#]note18# #[note19:#note#]note19# #[note20:#note#]note20#}\n[evolve_section_1:#evolve_5#][note_offset:#key_change#][evolve_section_2:#evolve_5#]","[measures:6][#set_inst#]\n{ #[repeat:#set_repeat#]repeat# CNT\n#[note1:#note_1#][note1_evolve:#note#]note1# #[note2:#note#]note2# #[note3:#note#]note3# #[note4:#note#]note4# #[note5:#note#]note5# #[note6:#note#]note6# #[note7:#note#]note7# #[note8:#note#]note8# #[note9:#note#]note9# #[note10:#note#]note10# #[note11:#note#]note11# #[note12:#note#]note12# #[note13:#note#]note13# #[note14:#note#]note14# #[note15:#note#]note15# #[note16:#note#]note16# #[note17:#note#]note17# #[note18:#note#]note18# #[note19:#note#]note19# #[note20:#note#]note20# #[note21:#note#]note21# #[note22:#note#]note22# #[note23:#note#]note23# #[note24:#note#]note24#}\n[evolve_section_1:#evolve_6#][note_offset:#key_change#][evolve_section_2:#evolve_6#]"
  ],

  "set_repeat": [
    "5","6","7","8"
  ],

  "evolve_3": [
    "#evolve_3_template# #evolve_3_template# #evolve_3_template# #evolve_3_template# #evolve_3_template#","#evolve_3_template# #evolve_3_template# #evolve_3_template# #evolve_3_template# #evolve_3_template# #evolve_3_template#","#evolve_3_template# #evolve_3_template# #evolve_3_template# #evolve_3_template# #evolve_3_template# #evolve_3_template# #evolve_3_template#","#evolve_3_template# #evolve_3_template# #evolve_3_template# #evolve_3_template# #evolve_3_template# #evolve_3_template# #evolve_3_template# #evolve_3_template#"
  ],

  "evolve_3_template": [
    "#evolve_note1# #evolve_note2# #evolve_note3# #evolve_note4# #evolve_note5# #evolve_note6# #evolve_note7# #evolve_note8# #evolve_note9# #evolve_note10# #evolve_note11# #evolve_note12#"
  ],

  "evolve_4": [
    "#evolve_4_template# #evolve_4_template# #evolve_4_template# #evolve_4_template# #evolve_4_template#","#evolve_4_template# #evolve_4_template# #evolve_4_template# #evolve_4_template# #evolve_4_template# #evolve_4_template#","#evolve_4_template# #evolve_4_template# #evolve_4_template# #evolve_4_template# #evolve_4_template# #evolve_4_template# #evolve_4_template#","#evolve_4_template# #evolve_4_template# #evolve_4_template# #evolve_4_template# #evolve_4_template# #evolve_4_template# #evolve_4_template# #evolve_4_template#"
  ],

  "evolve_4_template": [
    "#evolve_note1# #evolve_note2# #evolve_note3# #evolve_note4# #evolve_note5# #evolve_note6# #evolve_note7# #evolve_note8# #evolve_note9# #evolve_note10# #evolve_note11# #evolve_note12# #evolve_note13# #evolve_note14# #evolve_note15# #evolve_note16#"
  ],

  "evolve_5": [
    "#evolve_5_template# #evolve_5_template# #evolve_5_template# #evolve_5_template# #evolve_5_template#","#evolve_5_template# #evolve_5_template# #evolve_5_template# #evolve_5_template# #evolve_5_template# #evolve_5_template#","#evolve_5_template# #evolve_5_template# #evolve_5_template# #evolve_5_template# #evolve_5_template# #evolve_5_template# #evolve_5_template#","#evolve_5_template# #evolve_5_template# #evolve_5_template# #evolve_5_template# #evolve_5_template# #evolve_5_template# #evolve_5_template# #evolve_5_template#"
  ],

  "evolve_5_template": [
    "#evolve_note1# #evolve_note2# #evolve_note3# #evolve_note4# #evolve_note5# #evolve_note6# #evolve_note7# #evolve_note8# #evolve_note9# #evolve_note10# #evolve_note11# #evolve_note12# #evolve_note13# #evolve_note14# #evolve_note15# #evolve_note16# #evolve_note17# #evolve_note18# #evolve_note19# #evolve_note20#"
  ],

  "evolve_6": [
    "#evolve_6_template# #evolve_6_template# #evolve_6_template# #evolve_6_template# #evolve_6_template#","#evolve_6_template# #evolve_6_template# #evolve_6_template# #evolve_6_template# #evolve_6_template# #evolve_6_template#","#evolve_6_template# #evolve_6_template# #evolve_6_template# #evolve_6_template# #evolve_6_template# #evolve_6_template# #evolve_6_template#","#evolve_6_template# #evolve_6_template# #evolve_6_template# #evolve_6_template# #evolve_6_template# #evolve_6_template# #evolve_6_template# #evolve_6_template#"
  ],

  "evolve_6_template": [
    "#evolve_note1# #evolve_note2# #evolve_note3# #evolve_note4# #evolve_note5# #evolve_note6# #evolve_note7# #evolve_note8# #evolve_note9# #evolve_note10# #evolve_note11# #evolve_note12# #evolve_note13# #evolve_note14# #evolve_note15# #evolve_note16# #evolve_note17# #evolve_note18# #evolve_note19# #evolve_note20# #evolve_note21# #evolve_note22# #evolve_note23# #evolve_note24#"
  ],

  "evolve_note1": [
    "#note1_evolve#","#note1_evolve#","#note1_evolve#","#note1_evolve#","#note1_evolve#","#note1_evolve#","#[note1_evolve:#note#]note1_evolve#"
  ],

  "evolve_note2": [
    "#note2#","#note2#","#note2#","#note2#","#note2#","#note2#","#[note2:#note#]note2#"
  ],

  "evolve_note3": [
    "#note3#","#note3#","#note3#","#note3#","#note3#","#note3#","#[note3:#note#]note3#"
  ],

  "evolve_note4": [
    "#note4#","#note4#","#note4#","#note4#","#note4#","#note4#","#[note4:#note#]note4#"
  ],

  "evolve_note5": [
    "#note5#","#note5#","#note5#","#note5#","#note5#","#note5#","#[note5:#note#]note5#"
  ],

  "evolve_note6": [
    "#note6#","#note6#","#note6#","#note6#","#note6#","#note6#","#[note6:#note#]note6#"
  ],

  "evolve_note7": [
    "#note7#","#note7#","#note7#","#note7#","#note7#","#note7#","#[note7:#note#]note7#"
  ],

  "evolve_note8": [
    "#note8#","#note8#","#note8#","#note8#","#note8#","#note8#","#[note8:#note#]note8#"
  ],

  "evolve_note9": [
    "#note9#","#note9#","#note9#","#note9#","#note9#","#note9#","#[note9:#note#]note9#"
  ],

  "evolve_note10": [
    "#note10#","#note10#","#note10#","#note10#","#[note10:#note#]note10#"
  ],

  "evolve_note11": [
    "#note11#","#note11#","#note11#","#note11#","#note11#","#note11#","#[note11:#note#]note11#"
  ],

  "evolve_note12": [
    "#note12#","#note12#","#note12#","#note12#","#note12#","#note12#","#[note12:#note#]note12#"
  ],

  "evolve_note13": [
    "#note13#","#note13#","#note13#","#note13#","#note13#","#note13#","#[note13:#note#]note13#"
  ],

  "evolve_note14": [
    "#note14#","#note14#","#note14#","#note14#","#note14#","#note14#","#[note14:#note#]note14#"
  ],

  "evolve_note15": [
    "#note15#","#note15#","#note15#","#note15#","#note15#","#note15#","#[note15:#note#]note15#"
  ],

  "evolve_note16": [
    "#note16#","#note16#","#note16#","#note16#","#note16#","#note16#","#[note16:#note#]note16#"
  ],

  "evolve_note17": [
    "#note17#","#note17#","#note17#","#note17#","#note17#","#note17#","#[note17:#note#]note17#"
  ],

  "evolve_note18": [
    "#note18#","#note18#","#note18#","#note18#","#note18#","#note18#","#[note18:#note#]note18#"
  ],

  "evolve_note19": [
    "#note19#","#note19#","#note19#","#note19#","#note19#","#note19#","#[note19:#note#]note19#"
  ],

  "evolve_note20": [
    "#note20#","#note20#","#note20#","#note20#","#note20#","#note20#","#[note20:#note#]note20#"
  ],

  "evolve_note21": [
    "#note21#","#note21#","#note21#","#note21#","#note21#","#note21#","#[note21:#note#]note21#"
  ],

  "evolve_note22": [
    "#note22#","#note22#","#note22#","#note22#","#note22#","#note22#","#[note22:#note#]note22#"
  ],

  "evolve_note23": [
    "#note23#","#note23#","#note23#","#note23#","#note23#","#note23#","#[note23:#note#]note23#"
  ],

  "evolve_note24": [
    "#note24#","#note24#","#note24#","#note24#","#note24#","#note24#","#[note24:#note#]note24#"
  ],

  "set_inst": [
    "[inst_set:#inst#][inst_register:#register#]"
  ],

  "register": [
    "6","7","8","9"
  ],

  "measure_1": [
    "#note_1#\n#note#\n#note#\n#note#\n"
  ],

  "measure": [
    "#note#\n#note#\n#note#\n#note#\n"
  ],

  "note_1": [
    "i #inst_set# $BO0+$CNT*#measures#*4$BC 1 #dur# $BO[#set_on_off#]#amp#*#note_on_off#/#voices#$BC $BO#inst_register#+#note_options# #note_offset#$BC\n"
  ],

  "note": [
    "i #inst_set# + 1 #dur# $BO[#set_on_off#]#amp#*#note_on_off#/#voices#$BC $BO#inst_register#+#note_options# #note_offset#$BC\n"
  ],

  "inst": [
    "100","100","101","101","#drum_options#","#drum_options#","#drum_options#","#drum_options#","#drum_options#","#drum_options#","#drum_options#","#drum_options#","#drum_options#"
  ],

  "dur": [
    "0.25","0.5","0.25","0.5","0.25","0.5","0.75","1","1.25","1.5","2.75","3"
  ],

  "set_on_off": [
    "[note_on_off:0]","[note_on_off:0]","[note_on_off:1]",
  ],

  "amp": [
    "0.2","0.25","0.3","0.35","0.4","0.45","0.5","0.55","0.6","0.65","0.7","0.75","0.8","0.85","0.9","0.95"
  ]

}

title_chars=["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","1","2","3","4","5","6","7","8","9","1","2","3","4","5","6","7","8","9"]
title = ""
for i in range(7):
    title += choice(title_chars)
date = datetime.today().strftime('%Y_%m_%d')
filename = "output/"+date+"_"+title+".csd"
print(filename)

grammar = tracery.Grammar(rules)
grammar.add_modifiers(base_english)
for i in range(1):
    output = grammar.flatten("#origin#")
    output = output.replace("$BO","[")
    output = output.replace("$BC","]")
    print(output)
    print()

cs = ctcsound.Csound()

csd = '''
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
  aorgan = kenv*p5*0.7*(a1+a2+a3+a4+a5+a6+a7+a8+a9)
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
f 3 0 0 1 "drums/tr808/CH.WAV" 0 0 0
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
f 29 0 0 1 "drums/linn/linn_hat_open.wav" 0 0 0
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
'''
csd = csd + output + '''


</CsScore>
</CsoundSynthesizer>
'''

ret = cs.compileCsdText(csd)
if ret == ctcsound.CSOUND_SUCCESS:
    cs.start()
    cs.perform()
    cs.reset()

with open(filename, "w") as f:
    f.write(csd)
f.close()
