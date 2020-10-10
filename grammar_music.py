import tracery
from tracery.modifiers import base_english

rules = {

  "origin": [
    "#score#"
  ],

  "score": [
    "[#repeat_set#][#set_tempo#]r #repeat# REPEAT\nt 0 #tempo#\n[#set_inst#]#measure#\n[#set_inst#]#measure#\n[#set_inst#]#measure#\n[#set_inst#]#measure#"
  ],

  "repeat_set": [
    "[repeat:0]","[repeat:1]","[repeat:2]","[repeat:3]","[repeat:4]",
  ],

  "set_tempo": [
    "[tempo_set:#tempo#]"
  ],

  "tempo": [
    "80","90","100","110","120","130","140","150","160","170","180","190","200","210","220","230","240","250","260","270","280","290","300"
  ],

  "set_inst": [
    "[inst_set:#inst#]"
  ],

  "measure": [
    "#note_1#\n#note#\n#note#\n#note#\n#note#\n#note#\n#note#\n#note#\n#note#\n#note#\n#note#\n#note#\n#note#\n#note#\n#note#\n#note#"
  ],

  "note_1": [
    "i #inst_set# \[0+[#set_offset#]#offset#\] #dur# \[[#set_on_off#]#amp#*#note_on_off#\] #freq# $REPEAT"
  ],

  "note": [
    "i #inst_set# ^+1 #dur# \[[#set_on_off#]#amp#*#note_on_off#\] #freq# $REPEAT"
  ],

  "inst": [
    "1","2","3","4","5","6","7","8","9","10"
  ],

  "set_offset": [
    "[offset:0]","[offset:0.25]","[offset:0.5]","[offset:0.75]"
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
    print(grammar.flatten("#origin#"))  # prints, e.g., "Hello, world!"
