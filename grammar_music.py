import tracery
from tracery.modifiers import base_english
import ctcsound
from random import choice
from datetime import datetime

# TASKS
# Key signature selection for each section
# Rules for melody selection that emphasize smaller steps and the fundamental
# Different number of measures per section (e.g. 4, 8, 12)
# 3/4 time
# Save sections and return to them
# Let sections mutate with new note values
# Suggest some starting rhythmic templates
# Create more interesting instruments
# Adjust instrument levels to mix better
# Add effects channels randomly selected (e.g. reverb, delay, filter)

rules = {

  "origin": [
    "#score#"
  ],

  "score": [
    "t 0 [tempo:#set_tempo#]#tempo#\n{ [repeat:#set_repeat#]#repeat# CNT \n[#set_voices#]#voices_template#\n}\nb \[12*#repeat#\]\n{ [repeat:#set_repeat#]#repeat# CNT\n[#set_voices#]#voices_template#\n}"
  ],

  "set_repeat": [
    "1","2","3","4"
  ],

  "set_tempo": [
    "200","210","220","230","240","250","260","270","280","290","300","310","320","330","340","350","360","370","380","390","400"
  ],

  "set_voices": [
    "[voices:2][voices_template:#2_voices#]","[voices:3][voices_template:#3_voices#]","[voices:4][voices_template:#4_voices#]","[voices:5][voices_template:#5_voices#]","[voices:6][voices_template:#6_voices#]"
  ],

  "2_voices": [
    "[#set_inst#]#measure#\n[#set_inst#]#measure#\n"
  ],

  "3_voices": [
    "[#set_inst#]#measure#\n[#set_inst#]#measure#\n[#set_inst#]#measure#\n"
  ],

  "4_voices": [
    "[#set_inst#]#measure#\n[#set_inst#]#measure#\n[#set_inst#]#measure#\n[#set_inst#]#measure#\n"
  ],

  "5_voices": [
    "[#set_inst#]#measure#\n[#set_inst#]#measure#\n[#set_inst#]#measure#\n[#set_inst#]#measure#\n[#set_inst#]#measure#\n"
  ],

  "6_voices": [
    "[#set_inst#]#measure#\n[#set_inst#]#measure#\n[#set_inst#]#measure#\n[#set_inst#]#measure#\n[#set_inst#]#measure#\n[#set_inst#]#measure#\n"
  ],

  "set_measures": [
    "[measures:2][measures_template:#note_1#\n#note#\n#note#\n#note#\n#note#\n#note#\n#note#\n#note#\n#note#\n#note#\n#note#\n#note#]"
  ],

  "set_inst": [
    "[inst_set:#inst#]"
  ],

  "measure": [
    "#note_1#\n#note#\n#note#\n#note#\n#note#\n#note#\n#note#\n#note#\n#note#\n#note#\n#note#\n#note#"
  ],

  "note_1": [
    "i #inst_set# \[0+[#set_offset#]#offset#+$CNT*12\] 1 #dur# \[[#set_on_off#]#amp#*#note_on_off#/#voices#\] #freq#"
  ],

  "note": [
    "i #inst_set# + 1 #dur# \[[#set_on_off#]#amp#*#note_on_off#/#voices#\] #freq#"
  ],

  "inst": [
    "1","2","3","4","5","6","7","8","9","10"
  ],

  "set_offset": [
    "[offset:0]","[offset:0]","[offset:0]","[offset:0.25]","[offset:0.5]","[offset:0.75]"
  ],

  "dur": [
    "0.25","0.5","0.75","1","1.25","1.5","2.75","3"
  ],

  "set_on_off": [
    "[note_on_off:0]","[note_on_off:0]","[note_on_off:1]",
  ],

  "amp": [
    "0.05","0.1","0.15","0.2","0.25","0.3","0.35","0.4","0.45","0.5","0.55","0.6","0.65","0.7","0.75","0.8","0.85","0.9","0.95"
  ],

  "freq": [
    "8.01","8.02","8.03","8.04","8.05","8.06","8.07","8.08","8.09","8.10","8.11"
  ]

}


grammar = tracery.Grammar(rules)
grammar.add_modifiers(base_english)
for i in range(1):
    output = grammar.flatten("#origin#")
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
