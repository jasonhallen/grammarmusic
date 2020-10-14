import tracery
from tracery.modifiers import base_english
import ctcsound
from random import choice
from datetime import datetime

# TASKS
# Rules for melody selection that emphasize smaller steps and the fundamental
# Allow individual notes to be offset by 0,0.25,0.5,0.75 instead of the whole line
# Free floating instruments, looping, evolving, superimposed on each other, shifting sounds
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
    "t 0 [tempo:#set_tempo#]#tempo#\n[#set_mode#][#set_drums#][#set_voices#]; #mode# #drums#\n #voices_template#\n"
  ],

  "set_repeat": [
    "5","6","7","8"
  ],

  "set_tempo": [
    "200","210","220","230","240","250","260","270","280","290","300","310","320","330","340","350","360","370","380","390","400"
  ],

  "set_voices": [
    "[voices:6][voices_template:#6_voices#]"
  ],

  "2_voices": [
    "[measures:2][#set_mode#][#set_inst#]#measure_1# #measure#\n[#set_inst#]#measure_1# #measure#\n","[measures:3][#set_mode#][#set_inst#]#measure_1# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure#\n","[measures:4][#set_mode#][#set_inst#]#measure_1# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure#\n","[measures:5][#set_mode#][#set_inst#]#measure_1# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure#\n","[measures:6][#set_mode#][#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure#\n","[measures:7][#set_mode#][#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure# #measure#\n","[measures:8][#set_mode#][#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure# #measure# #measure#\n"
  ],

  "3_voices": [
    "[measures:2][#set_mode#][#set_inst#]#measure_1# #measure#\n[#set_inst#]#measure_1# #measure#\n[#set_inst#]#measure_1# #measure#\n","[measures:3][#set_mode#][#set_inst#]#measure_1# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure#\n","[measures:4][#set_mode#][#set_inst#]#measure_1# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure#\n","[measures:5][#set_mode#][#set_inst#]#measure_1# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure#\n","[measures:6][#set_mode#][#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure#\n","[measures:7][#set_mode#][#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure# #measure#\n","[measures:8][#set_mode#][#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure# #measure# #measure#\n"
  ],

  "4_voices": [
    "[measures:2][#set_mode#][#set_inst#]#measure_1# #measure#\n[#set_inst#]#measure_1# #measure#\n[#set_inst#]#measure_1# #measure#\n[#set_inst#]#measure_1# #measure#\n","[measures:3][#set_mode#][#set_inst#]#measure_1# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure#\n","[measures:4][#set_mode#][#set_inst#]#measure_1# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure#\n","[measures:5][#set_mode#][#set_inst#]#measure_1# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure#\n","[measures:6][#set_mode#][#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure#\n","[measures:7][#set_mode#][#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure# #measure#\n","[measures:8][#set_mode#][#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure# #measure# #measure#\n",
  ],

  "5_voices": [
    "[measures:2][#set_mode#][#set_inst#]#measure_1# #measure#\n[#set_inst#]#measure_1# #measure#\n[#set_inst#]#measure_1# #measure#\n[#set_inst#]#measure_1# #measure#\n[#set_inst#]#measure_1# #measure#\n","[measures:3][#set_mode#][#set_inst#]#measure_1# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure#\n","[measures:4][#set_mode#][#set_inst#]#measure_1# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure#\n","[measures:5][#set_mode#][#set_inst#]#measure_1# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure#\n","[measures:6][#set_mode#][#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure#\n","[measures:7][#set_mode#][#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure# #measure#\n","[measures:8][#set_mode#][#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure# #measure# #measure#\n[#set_inst#]#measure_1# #measure# #measure# #measure# #measure# #measure# #measure# #measure#\n",
  ],

  "max_loop_length": [
    "(6*4*8*1)"
  ],

  "6_voices": [
    "#voice_constructor#\n#voice_constructor#\n#voice_constructor#\n#voice_constructor#\n#voice_constructor#\n#voice_constructor#\n",
  ],

  "voice_constructor": [
    "[loop1:#set_measures#][store1:#measures#*4*#repeat#][store3:#max_loop_length#-(#store1#+#store2#)]b $BO#max_loop_length#-#store1#$BC\n#loop1#\n"
  ],

  "set_measures": [
    "[measures:3][#set_inst#]\n{ #[repeat:#set_repeat#]repeat# CNT\n#measure_1# #measure# #measure#}\n","[measures:4][#set_inst#]\n{ #[repeat:#set_repeat#]repeat# CNT\n#measure_1# #measure# #measure# #measure#}\n","[measures:5][#set_inst#]\n{ #[repeat:#set_repeat#]repeat# CNT\n#measure_1# #measure# #measure# #measure# #measure#}\n","[measures:6][#set_inst#]\n{ #[repeat:#set_repeat#]repeat# CNT\n#measure_1# #measure# #measure# #measure# #measure# #measure#}\n"
  ],

  "set_mode": [
    "[mode:atonal][note_options:.00,.01,.02,.03,.04,.05,.06,.07,.08,.09,.10,.11,.12]","[mode:aeolian][note_options:.00,.00,.00,.02,.03,.05,.07,.08,.10,.12]","[mode:dorian][note_options:.00,.00,.00,.02,.03,.05,.07,.09,.10,.12]","[mode:ionian][note_options:.00,.00,.00,.02,.04,.05,.07,.09,.11,.12]","[mode:phrygian][note_options:.00,.00,.00,.01,.03,.05,.07,.08,.10,.12]","[mode:lydian][note_options:.00,.00,.00,.02,.04,.06,.07,.09,.11,.12]","[mode:mixolydian][note_options:.00,.00,.00,.02,.04,.05,.07,.09,.10,.12]","[mode:locrian][note_options:.00,.00,.00,.01,.03,.05,.06,.08,.10,.12]"
  ],

  "set_drums": [
    "[drums:tr808][drum_options:2,5,6,7,8,9,10,11,12]","[drums:emu][drum_options:13,14,15,16,17,18,19,20,21,22,23,24]"
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
    "i #inst_set# $BO0+[#set_offset#]#offset#+$CNT*#measures#*4$BC 1 #dur# $BO[#set_on_off#]#amp#*#note_on_off#/#voices#$BC $BO#inst_register#+#note_options#$BC"
  ],

  "note": [
    "i #inst_set# + 1 #dur# $BO[#set_on_off#]#amp#*#note_on_off#/#voices#$BC $BO#inst_register#+#note_options#$BC"
  ],

  "inst": [
    "1","1","1","#drum_options#","#drum_options#","#drum_options#","#drum_options#","#drum_options#","#drum_options#","#drum_options#","#drum_options#","#drum_options#","#drum_options#","#drum_options#"
  ],

  "set_offset": [
    "[offset:0]","[offset:0]","[offset:0]","[offset:0.5]","[offset:0.5]"
  ],

  "dur": [
    "0.25","0.5","0.25","0.5","0.25","0.5","0.75","1","1.25","1.5","2.75","3"
  ],

  "set_on_off": [
    "[note_on_off:0]","[note_on_off:0]","[note_on_off:1]",
  ],

  "amp": [
    "0.05","0.1","0.15","0.2","0.25","0.3","0.35","0.4","0.45","0.5","0.55","0.6","0.65","0.7","0.75","0.8","0.85","0.9","0.95"
  ],

  "note_offset": [
    "+.12","+.11","+.10","+.9","+.08","+.07","+.06","+.05","+.04","+.03","+.02","+.01","+0"
  ]

}


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

title_chars=["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","1","2","3","4","5","6","7","8","9","1","2","3","4","5","6","7","8","9"]
title = ""
for i in range(7):
    title += choice(title_chars)
date = datetime.today().strftime('%Y_%m_%d')
filename = "output/"+date+"_"+title+".csd"

with open(filename, "w") as f:
    f.write(csd)
f.close()
