import tracery
from tracery.modifiers import base_english
import ctcsound
from random import choice
from datetime import datetime

# TASKS
# Rules for melody selection that emphasize smaller steps and the fundamental
# Allow individual notes to be offset by 0,0.25,0.5,0.75 instead of the whole line
# 3/4 time
# Suggest some starting rhythmic templates
# Add instruments - bass, organ, sax, synth, clavinet, rhodes, chimes
# Adjust instrument levels to mix better
# Add effects channels randomly selected (e.g. reverb, delay, filter)
# Add breathing spaces between parts (i.e. Eli Keszler)
# Randomize the tempo slow down point
# Add simple panning of parts
# Slow organ drones

rules = {

  "origin": [
    "#score#"
  ],

  "score": [
    "[#set_mode#][note_offset_1:#set_note_offset#][#set_theme#][#set_drums#][#set_voices#]; #mode# #drums# voices=#voices# key=#note_offset_1#\nt 0 [tempo:#set_tempo#]#tempo# ;426 #tempo# 486 $BO#tempo#/4$BC 566 $BO#tempo#/4$BC 626 $BO#tempo#/4$BC\n#voices_template#\ns\n#end_piece#"
  ],

  "set_mode": [
    "[mode:ionian][note_options:.00,.00,.00,.00,.02,.04,.04,.05,.07,.07,.09,.11]","[mode:dorian][note_options:.0,.02,.02,.02,.02,.04,.05,.05,.07,.09,.09,.11]","[mode:phrygian][note_options:.00,.02,.04,.04,.04,.05,.07,.07,.09,.11,.11]","[mode:lydian][note_options:.00,.00,.02,.04,.05,.05,.05,.07,.09,.09,.11]","[mode:mixolydian][note_options:.00,.02,.02,.04,.05,.07,.07,.07,.09,.11,.11]","[mode:aeolian][note_options:.00,.00,.02,.04,.04,.05,.07,.09,.09,.09,.11]","[mode:locrian][note_options:.00,.02,.02,.04,.05,.05,.07,.09,.11,.11,.11]"
  ],

  "set_note_offset": [
    "-0.92","-0.91","-0.9","-0.89","+0.06","+0.05","+0.04","+0.03","+0.02","+0.01","+0"
  ],

  "set_voices": [
    "[voices:8][voices_template:#8_voices#]"
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

  "8_voices": [
    "[inst:#drum_parts#][inst_register:#register#]#voice_constructor_rhythm#\n[inst:#drum_parts#][inst_register:#register#]#voice_constructor_rhythm#\n[inst:#drum_parts#][inst_register:#register#]#voice_constructor_rhythm#\n[inst:#drum_parts#][inst_register:#register#]#voice_constructor_rhythm#\n[inst:#melody_parts#][inst_register:#register#]#voice_constructor_melody#\n[inst:#melody_parts#][inst_register:#register#]#voice_constructor_melody#\n[inst:#melody_parts#][inst_register:#register#]#voice_constructor_melody#\n[inst:#bass_parts#][inst_register:#register#]#voice_constructor_rhythm#\n"
  ],

  "voice_constructor_rhythm": [
      "[note_offset:#note_offset_1#][loop1:#set_measures_rhythm#][repeat:#set_repeat#]b $BO#max_loop_length#-#measures#*4*#repeat#$BC\n; SECTION 1: LOOP1 #mode#\n{ #repeat# CNT\n#loop1#}\n\n; SECTION 2: EVOLVE 1 #mode#\n#evolve_section_1#\n[#mode1#]; SECTION 3: EVOLVE 2, #mode#\n#evolve_section_2#\n[#mode1#]; SECTION 4: EVOLVE 3, #mode#\n#evolve_section_3#\n; SECTION 5: SILENCE\n#silence_section#\n; SECTION 6: EVOLVE THEME 1\n#evolve_theme_section_1#\n; SECTION 7: EVOLVE THEME 2\n#evolve_theme_section_2#\n"
  ],

  "voice_constructor_melody": [
    "[note_offset:#note_offset_1#][loop1:#set_measures_melody#][repeat:#set_repeat#]b $BO#max_loop_length#-#measures#*4*#repeat#$BC\n; SECTION 1: LOOP1 #mode#\n{ #repeat# CNT\n#loop1#}\n\n; SECTION 2: EVOLVE 1 #mode#\n#evolve_section_1#\n[#mode1#]; SECTION 3: EVOLVE 2, #mode#\n#evolve_section_2#\n[#mode1#]; SECTION 4: EVOLVE 3, #mode#\n#evolve_section_3#\n; SECTION 5: SILENCE\n#silence_section#\n; SECTION 6: EVOLVE THEME 1\n#evolve_theme_section_1#\n; SECTION 7: EVOLVE THEME 2\n#evolve_theme_section_2#\n"
  ],

  "silence_356": [
    "#silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note#"
  ],

  "silence_4": [
    "#silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note##silent_note#"
  ],

  "silent_note": [
    "i #inst# + 1 1 0 8.00\n"
  ],

  "set_drums": [
     "[drums:tr808][drum_parts:1,2,3,4,5,6,7,8,9,10,11][register:8]","[drums:emu][drum_parts:12,13,14,15,16,17,18,19,20,21,22,23][register:8]","[drums:linn][drum_parts:24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40][register:8]","[drums:oberheim][drum_parts:41,42,43,44,45,46,47,48,49][register:8]"
  ],

  "melody_parts": [
    "[name:string_pluck][register:7,8,9]100","[name:organ][register:7,8,9]101","[name:rhodes][register:7,8,9]105","[name:marimba][register:7,8,9,10]106"
  ],

  "bass_parts": [
    "[name:string_pluck][register:6]100","[name:organ][register:5,6]101"
  ],

  "set_theme": [
    "[theme_part1:#set_theme_part1#][theme_part2:#set_theme_part2#]"
  ],

  "set_theme_part1": [
    "[theme_note_dur_1:#dur#][theme_note_on_off_1:#set_theme_note_on_off#][theme_note_value_1:#note_options#]\n[theme_note_dur_2:#dur#][theme_note_on_off_2:#set_theme_note_on_off#][theme_note_value_2:#note_options#]\n[theme_note_dur_3:#dur#][theme_note_on_off_3:#set_theme_note_on_off#][theme_note_value_3:#note_options#]\n[theme_note_dur_4:#dur#][theme_note_on_off_4:#set_theme_note_on_off#][theme_note_value_4:#note_options#]\n[theme_note_dur_5:#dur#][theme_note_on_off_5:#set_theme_note_on_off#][theme_note_value_5:#note_options#]\n[theme_note_dur_6:#dur#][theme_note_on_off_6:#set_theme_note_on_off#][theme_note_value_6:#note_options#]\n[theme_note_dur_7:#dur#][theme_note_on_off_7:#set_theme_note_on_off#][theme_note_value_7:#note_options#]\n[theme_note_dur_8:#dur#][theme_note_on_off_8:#set_theme_note_on_off#][theme_note_value_8:#note_options#]\n[theme_note_dur_9:#dur#][theme_note_on_off_9:#set_theme_note_on_off#][theme_note_value_9:#note_options#]\n[theme_note_dur_10:#dur#][theme_note_on_off_10:#set_theme_note_on_off#][theme_note_value_10:#note_options#]\n[theme_note_dur_11:#dur#][theme_note_on_off_11:#set_theme_note_on_off#][theme_note_value_11:#note_options#]\n[theme_note_dur_12:#dur#][theme_note_on_off_12:#set_theme_note_on_off#][theme_note_value_12:#note_options#]\n"
  ],

  "set_theme_part2": [
    "[theme_note_dur_13:#dur#][theme_note_on_off_13:#set_theme_note_on_off#][theme_note_value_13:#note_options#]\n[theme_note_dur_14:#dur#][theme_note_on_off_14:#set_theme_note_on_off#][theme_note_value_14:#note_options#]\n[theme_note_dur_15:#dur#][theme_note_on_off_15:#set_theme_note_on_off#][theme_note_value_15:#note_options#]\n[theme_note_dur_16:#dur#][theme_note_on_off_16:#set_theme_note_on_off#][theme_note_value_16:#note_options#]\n[theme_note_dur_17:#dur#][theme_note_on_off_17:#set_theme_note_on_off#][theme_note_value_17:#note_options#]\n[theme_note_dur_18:#dur#][theme_note_on_off_18:#set_theme_note_on_off#][theme_note_value_18:#note_options#]\n[theme_note_dur_19:#dur#][theme_note_on_off_19:#set_theme_note_on_off#][theme_note_value_19:#note_options#]\n[theme_note_dur_20:#dur#][theme_note_on_off_20:#set_theme_note_on_off#][theme_note_value_20:#note_options#]\n[theme_note_dur_21:#dur#][theme_note_on_off_21:#set_theme_note_on_off#][theme_note_value_21:#note_options#]\n[theme_note_dur_22:#dur#][theme_note_on_off_22:#set_theme_note_on_off#][theme_note_value_22:#note_options#]\n[theme_note_dur_23:#dur#][theme_note_on_off_23:#set_theme_note_on_off#][theme_note_value_23:#note_options#]\n[theme_note_dur_24:#dur#][theme_note_on_off_24:#set_theme_note_on_off#][theme_note_value_24:#note_options#]\n"
  ],

  "set_measures_rhythm": [
    "[measures:3]#[note1:#note_1#][note1_evolve:#note#]note1# #[note2:#note#]note2# #[note3:#note#]note3# #[note4:#note#]note4# #[note5:#note#]note5# #[note6:#note#]note6# #[note7:#note#]note7# #[note8:#note#]note8# #[note9:#note#]note9# #[note10:#note#]note10# #[note11:#note#]note11# #[note12:#note#]note12#[evolve_section_1:#evolve_3#][evolve_section_2:#evolve_3#][evolve_section_3:#evolve_3#][evolve_theme_section_1:#evolve_theme_3#][evolve_theme_section_2:#evolve_theme_3#][silence_section:#silence_356#]","[measures:4]#[note1:#note_1#][note1_evolve:#note#]note1# #[note2:#note#]note2# #[note3:#note#]note3# #[note4:#note#]note4# #[note5:#note#]note5# #[note6:#note#]note6# #[note7:#note#]note7# #[note8:#note#]note8# #[note9:#note#]note9# #[note10:#note#]note10# #[note11:#note#]note11# #[note12:#note#]note12# #[note13:#note#]note13# #[note14:#note#]note14# #[note15:#note#]note15# #[note16:#note#]note16#[evolve_section_1:#evolve_4#][evolve_section_2:#evolve_4#][evolve_section_3:#evolve_4#][evolve_theme_section_1:#evolve_theme_3#][evolve_theme_section_2:#evolve_theme_3#][silence_section:#silence_4#]","[measures:5]#[note1:#note_1#][note1_evolve:#note#]note1# #[note2:#note#]note2# #[note3:#note#]note3# #[note4:#note#]note4# #[note5:#note#]note5# #[note6:#note#]note6# #[note7:#note#]note7# #[note8:#note#]note8# #[note9:#note#]note9# #[note10:#note#]note10# #[note11:#note#]note11# #[note12:#note#]note12# #[note13:#note#]note13# #[note14:#note#]note14# #[note15:#note#]note15# #[note16:#note#]note16# #[note17:#note#]note17# #[note18:#note#]note18# #[note19:#note#]note19# #[note20:#note#]note20#[evolve_section_1:#evolve_5#][evolve_section_2:#evolve_5#][evolve_section_3:#evolve_5#][evolve_theme_section_1:#evolve_theme_3#][evolve_theme_section_2:#evolve_theme_3#][silence_section:#silence_356#]","[measures:6]#[note1:#note_1#][note1_evolve:#note#]note1# #[note2:#note#]note2# #[note3:#note#]note3# #[note4:#note#]note4# #[note5:#note#]note5# #[note6:#note#]note6# #[note7:#note#]note7# #[note8:#note#]note8# #[note9:#note#]note9# #[note10:#note#]note10# #[note11:#note#]note11# #[note12:#note#]note12# #[note13:#note#]note13# #[note14:#note#]note14# #[note15:#note#]note15# #[note16:#note#]note16# #[note17:#note#]note17# #[note18:#note#]note18# #[note19:#note#]note19# #[note20:#note#]note20# #[note21:#note#]note21# #[note22:#note#]note22# #[note23:#note#]note23# #[note24:#note#]note24#[evolve_section_1:#evolve_6#][evolve_section_2:#evolve_6#][evolve_section_3:#evolve_6#][evolve_theme_section_1:#evolve_theme_3#][evolve_theme_section_2:#evolve_theme_3#][silence_section:#silence_356#]"
  ],

  "set_measures_melody": [
    "[measures:3]#[note1:#note_1#][note1_evolve:#note#]note1# #[note2:#note#]note2# #[note3:#note#]note3# #[note4:#note#]note4# #[note5:#note#]note5# #[note6:#note#]note6# #[note7:#note#]note7# #[note8:#note#]note8# #[note9:#note#]note9# #[note10:#note#]note10# #[note11:#note#]note11# #[note12:#note#]note12#[evolve_section_1:#evolve_3#][evolve_section_2:#evolve_3#][evolve_section_3:#evolve_3#][evolve_theme_section_1:#evolve_theme_3#][evolve_theme_section_2:#evolve_theme_3#][silence_section:#silence_356#]","[measures:4]#[note1:#note_1#][note1_evolve:#note#]note1# #[note2:#note#]note2# #[note3:#note#]note3# #[note4:#note#]note4# #[note5:#note#]note5# #[note6:#note#]note6# #[note7:#note#]note7# #[note8:#note#]note8# #[note9:#note#]note9# #[note10:#note#]note10# #[note11:#note#]note11# #[note12:#note#]note12# #[note13:#note#]note13# #[note14:#note#]note14# #[note15:#note#]note15# #[note16:#note#]note16#[evolve_section_1:#evolve_4#][evolve_section_2:#evolve_4#][evolve_section_3:#evolve_4#][evolve_theme_section_1:#evolve_theme_3#][evolve_theme_section_2:#evolve_theme_3#][silence_section:#silence_4#]","[measures:5]#[note1:#note_1#][note1_evolve:#note#]note1# #[note2:#note#]note2# #[note3:#note#]note3# #[note4:#note#]note4# #[note5:#note#]note5# #[note6:#note#]note6# #[note7:#note#]note7# #[note8:#note#]note8# #[note9:#note#]note9# #[note10:#note#]note10# #[note11:#note#]note11# #[note12:#note#]note12# #[note13:#note#]note13# #[note14:#note#]note14# #[note15:#note#]note15# #[note16:#note#]note16# #[note17:#note#]note17# #[note18:#note#]note18# #[note19:#note#]note19# #[note20:#note#]note20#[evolve_section_1:#evolve_5#][evolve_section_2:#evolve_5#][evolve_section_3:#evolve_5#][evolve_theme_section_1:#evolve_theme_3#][evolve_theme_section_2:#evolve_theme_3#][silence_section:#silence_356#]","[measures:6]#[note1:#note_1#][note1_evolve:#note#]note1# #[note2:#note#]note2# #[note3:#note#]note3# #[note4:#note#]note4# #[note5:#note#]note5# #[note6:#note#]note6# #[note7:#note#]note7# #[note8:#note#]note8# #[note9:#note#]note9# #[note10:#note#]note10# #[note11:#note#]note11# #[note12:#note#]note12# #[note13:#note#]note13# #[note14:#note#]note14# #[note15:#note#]note15# #[note16:#note#]note16# #[note17:#note#]note17# #[note18:#note#]note18# #[note19:#note#]note19# #[note20:#note#]note20# #[note21:#note#]note21# #[note22:#note#]note22# #[note23:#note#]note23# #[note24:#note#]note24#[evolve_section_1:#evolve_6#][evolve_section_2:#evolve_6#][evolve_section_3:#evolve_6#][evolve_theme_section_1:#evolve_theme_3#][evolve_theme_section_2:#evolve_theme_3#][silence_section:#silence_356#]"
  ],

  "set_repeat": [
    "5","6","7","8"
  ],

  "evolve_3": [
    "#evolve_3_template# #evolve_3_template# #evolve_3_template# #evolve_3_template# #evolve_3_template# #evolve_3_template# #evolve_3_template# #evolve_3_template# #evolve_3_template# #evolve_3_template#"
  ],

  "evolve_3_template": [
    "#evolve_note1# #evolve_note2# #evolve_note3# #evolve_note4# #evolve_note5# #evolve_note6# #evolve_note7# #evolve_note8# #evolve_note9# #evolve_note10# #evolve_note11# #evolve_note12#"
  ],

  "evolve_4": [
    "#evolve_4_template# #evolve_4_template# #evolve_4_template# #evolve_4_template# #evolve_4_template# #evolve_4_template# #evolve_4_template# #evolve_4_template#"
  ],

  "evolve_4_template": [
    "#evolve_note1# #evolve_note2# #evolve_note3# #evolve_note4# #evolve_note5# #evolve_note6# #evolve_note7# #evolve_note8# #evolve_note9# #evolve_note10# #evolve_note11# #evolve_note12# #evolve_note13# #evolve_note14# #evolve_note15# #evolve_note16#"
  ],

  "evolve_5": [
    "#evolve_5_template# #evolve_5_template# #evolve_5_template# #evolve_5_template# #evolve_5_template# #evolve_5_template#"
  ],

  "evolve_5_template": [
    "#evolve_note1# #evolve_note2# #evolve_note3# #evolve_note4# #evolve_note5# #evolve_note6# #evolve_note7# #evolve_note8# #evolve_note9# #evolve_note10# #evolve_note11# #evolve_note12# #evolve_note13# #evolve_note14# #evolve_note15# #evolve_note16# #evolve_note17# #evolve_note18# #evolve_note19# #evolve_note20#"
  ],

  "evolve_6": [
    "#evolve_6_template# #evolve_6_template# #evolve_6_template# #evolve_6_template# #evolve_6_template#"
  ],

  "evolve_6_template": [
    "#evolve_note1# #evolve_note2# #evolve_note3# #evolve_note4# #evolve_note5# #evolve_note6# #evolve_note7# #evolve_note8# #evolve_note9# #evolve_note10# #evolve_note11# #evolve_note12# #evolve_note13# #evolve_note14# #evolve_note15# #evolve_note16# #evolve_note17# #evolve_note18# #evolve_note19# #evolve_note20# #evolve_note21# #evolve_note22# #evolve_note23# #evolve_note24#"
  ],

  "evolve_note1": [
    "#note1_evolve#","#note1_evolve#","#note1_evolve#","#note1_evolve#","#[note1_evolve:#note#]note1_evolve#"
  ],

  "evolve_note2": [
    "#note2#","#note2#","#note2#","#note2#","#[note2:#note#]note2#"
  ],

  "evolve_note3": [
    "#note3#","#note3#","#note3#","#note3#","#[note3:#note#]note3#"
  ],

  "evolve_note4": [
    "#note4#","#note4#","#note4#","#note4#","#[note4:#note#]note4#"
  ],

  "evolve_note5": [
    "#note5#","#note5#","#note5#","#note5#","#[note5:#note#]note5#"
  ],

  "evolve_note6": [
    "#note6#","#note6#","#note6#","#note6#","#[note6:#note#]note6#"
  ],

  "evolve_note7": [
    "#note7#","#note7#","#note7#","#note7#","#[note7:#note#]note7#"
  ],

  "evolve_note8": [
    "#note8#","#note8#","#note8#","#note8#","#[note8:#note#]note8#"
  ],

  "evolve_note9": [
    "#note9#","#note9#","#note9#","#note9#","#[note9:#note#]note9#"
  ],

  "evolve_note10": [
    "#note10#","#note10#","#note10#","#note10#","#[note10:#note#]note10#"
  ],

  "evolve_note11": [
    "#note11#","#note11#","#note11#","#note11#","#[note11:#note#]note11#"
  ],

  "evolve_note12": [
    "#note12#","#note12#","#note12#","#note12#","#[note12:#note#]note12#"
  ],

  "evolve_note13": [
    "#note13#","#note13#","#note13#","#note13#","#[note13:#note#]note13#"
  ],

  "evolve_note14": [
    "#note14#","#note14#","#note14#","#note14#","#[note14:#note#]note14#"
  ],

  "evolve_note15": [
    "#note15#","#note15#","#note15#","#note15#","#[note15:#note#]note15#"
  ],

  "evolve_note16": [
    "#note16#","#note16#","#note16#","#note16#","#[note16:#note#]note16#"
  ],

  "evolve_note17": [
    "#note17#","#note17#","#note17#","#note17#","#[note17:#note#]note17#"
  ],

  "evolve_note18": [
    "#note18#","#note18#","#note18#","#note18#","#[note18:#note#]note18#"
  ],

  "evolve_note19": [
    "#note19#","#note19#","#note19#","#note19#","#[note19:#note#]note19#"
  ],

  "evolve_note20": [
    "#note20#","#note20#","#note20#","#note20#","#[note20:#note#]note20#"
  ],

  "evolve_note21": [
    "#note21#","#note21#","#note21#","#note21#","#[note21:#note#]note21#"
  ],

  "evolve_note22": [
    "#note22#","#note22#","#note22#","#note22#","#[note22:#note#]note22#"
  ],

  "evolve_note23": [
    "#note23#","#note23#","#note23#","#note23#","#[note23:#note#]note23#"
  ],

  "evolve_note24": [
    "#note24#","#note24#","#note24#","#note24#","#[note24:#note#]note24#"
  ],

  "evolve_theme_3": [
    "#evolve_theme_3_template# #evolve_theme_3_template# #evolve_theme_3_template# #evolve_theme_3_template# #evolve_theme_3_template# #evolve_theme_3_template# #evolve_theme_3_template# #evolve_theme_3_template#"
  ],

  "evolve_theme_3_template": [
    "#evolve_theme_note1# #evolve_theme_note2# #evolve_theme_note3# #evolve_theme_note4# #evolve_theme_note5# #evolve_theme_note6# #evolve_theme_note7# #evolve_theme_note8# #evolve_theme_note9# #evolve_theme_note10# #evolve_theme_note11# #evolve_theme_note12#"
  ],

  "evolve_theme_4": [
    "#evolve_theme_4_template# #evolve_theme_4_template# #evolve_theme_4_template# #evolve_theme_4_template# #evolve_theme_4_template#","#evolve_theme_4_template# #evolve_theme_4_template# #evolve_theme_4_template# #evolve_theme_4_template# #evolve_theme_4_template# #evolve_theme_4_template#","#evolve_theme_4_template# #evolve_theme_4_template# #evolve_theme_4_template# #evolve_theme_4_template# #evolve_theme_4_template# #evolve_theme_4_template# #evolve_theme_4_template#","#evolve_theme_4_template# #evolve_theme_4_template# #evolve_theme_4_template# #evolve_theme_4_template# #evolve_theme_4_template# #evolve_theme_4_template# #evolve_theme_4_template# #evolve_theme_4_template#"
  ],

  "evolve_theme_4_template": [
    "#evolve_theme_note1# #evolve_theme_note2# #evolve_theme_note3# #evolve_theme_note4# #evolve_theme_note5# #evolve_theme_note6# #evolve_theme_note7# #evolve_theme_note8# #evolve_theme_note9# #evolve_theme_note10# #evolve_theme_note11# #evolve_theme_note12# #evolve_theme_note13# #evolve_theme_note14# #evolve_theme_note15# #evolve_theme_note16#"
  ],

  "evolve_theme_5": [
    "#evolve_theme_5_template# #evolve_theme_5_template# #evolve_theme_5_template# #evolve_theme_5_template# #evolve_theme_5_template#","#evolve_theme_5_template# #evolve_theme_5_template# #evolve_theme_5_template# #evolve_theme_5_template# #evolve_theme_5_template# #evolve_theme_5_template#","#evolve_theme_5_template# #evolve_theme_5_template# #evolve_theme_5_template# #evolve_theme_5_template# #evolve_theme_5_template# #evolve_theme_5_template# #evolve_theme_5_template#","#evolve_theme_5_template# #evolve_theme_5_template# #evolve_theme_5_template# #evolve_theme_5_template# #evolve_theme_5_template# #evolve_theme_5_template# #evolve_theme_5_template# #evolve_theme_5_template#"
  ],

  "evolve_theme_5_template": [
    "#evolve_theme_note1# #evolve_theme_note2# #evolve_theme_note3# #evolve_theme_note4# #evolve_theme_note5# #evolve_theme_note6# #evolve_theme_note7# #evolve_theme_note8# #evolve_theme_note9# #evolve_theme_note10# #evolve_theme_note11# #evolve_theme_note12# #evolve_theme_note13# #evolve_theme_note14# #evolve_theme_note15# #evolve_theme_note16# #evolve_theme_note17# #evolve_theme_note18# #evolve_theme_note19# #evolve_theme_note20#"
  ],

  "evolve_theme_6": [
    "#evolve_theme_6_template# #evolve_theme_6_template# #evolve_theme_6_template# #evolve_theme_6_template# #evolve_theme_6_template#","#evolve_theme_6_template# #evolve_theme_6_template# #evolve_theme_6_template# #evolve_theme_6_template# #evolve_theme_6_template# #evolve_theme_6_template#","#evolve_theme_6_template# #evolve_theme_6_template# #evolve_theme_6_template# #evolve_theme_6_template# #evolve_theme_6_template# #evolve_theme_6_template# #evolve_theme_6_template#","#evolve_theme_6_template# #evolve_theme_6_template# #evolve_theme_6_template# #evolve_theme_6_template# #evolve_theme_6_template# #evolve_theme_6_template# #evolve_theme_6_template# #evolve_theme_6_template#"
  ],

  "evolve_theme_6_template": [
    "#evolve_theme_note1# #evolve_theme_note2# #evolve_theme_note3# #evolve_theme_note4# #evolve_theme_note5# #evolve_theme_note6# #evolve_theme_note7# #evolve_theme_note8# #evolve_theme_note9# #evolve_theme_note10# #evolve_theme_note11# #evolve_theme_note12# #evolve_theme_note13# #evolve_theme_note14# #evolve_theme_note15# #evolve_theme_note16# #evolve_theme_note17# #evolve_theme_note18# #evolve_theme_note19# #evolve_theme_note20# #evolve_theme_note21# #evolve_theme_note22# #evolve_theme_note23# #evolve_theme_note24#"
  ],

  "evolve_theme_note1": [
    "#note1_evolve#","#note1_evolve#","#note1_evolve#","#note1_evolve#","#[theme_note_dur:#theme_note_dur_1#][theme_note_on_off:#theme_note_on_off_1#][theme_note_value:#theme_note_value_1#][note1_evolve:#evolve_theme_note_constructor#]note1_evolve#"
  ],

  "evolve_theme_note2": [
    "#note2#","#note2#","#note2#","#note2#","#[theme_note_dur:#theme_note_dur_2#][theme_note_on_off:#theme_note_on_off_2#][theme_note_value:#theme_note_value_2#][note2:#evolve_theme_note_constructor#]note2#"
  ],

  "evolve_theme_note3": [
    "#note3#","#note3#","#note3#","#note3#","#[theme_note_dur:#theme_note_dur_3#][theme_note_on_off:#theme_note_on_off_3#][theme_note_value:#theme_note_value_3#][note3:#evolve_theme_note_constructor#]note3#"
  ],

  "evolve_theme_note4": [
    "#note4#","#note4#","#note4#","#note4#","#[theme_note_dur:#theme_note_dur_4#][theme_note_on_off:#theme_note_on_off_4#][theme_note_value:#theme_note_value_4#][note4:#evolve_theme_note_constructor#]note4#"
  ],

  "evolve_theme_note5": [
    "#note5#","#note5#","#note5#","#note5#","#[theme_note_dur:#theme_note_dur_5#][theme_note_on_off:#theme_note_on_off_5#][theme_note_value:#theme_note_value_5#][note5:#evolve_theme_note_constructor#]note5#"
  ],

  "evolve_theme_note6": [
    "#note6#","#note6#","#note6#","#note6#","#[theme_note_dur:#theme_note_dur_6#][theme_note_on_off:#theme_note_on_off_6#][theme_note_value:#theme_note_value_6#][note6:#evolve_theme_note_constructor#]note6#"
  ],

  "evolve_theme_note7": [
    "#note7#","#note7#","#note7#","#note7#","#[theme_note_dur:#theme_note_dur_7#][theme_note_on_off:#theme_note_on_off_7#][theme_note_value:#theme_note_value_7#][note7:#evolve_theme_note_constructor#]note7#"
  ],

  "evolve_theme_note8": [
    "#note8#","#note8#","#note8#","#note8#","#[theme_note_dur:#theme_note_dur_8#][theme_note_on_off:#theme_note_on_off_8#][theme_note_value:#theme_note_value_8#][note8:#evolve_theme_note_constructor#]note8#"
  ],

  "evolve_theme_note9": [
    "#note9#","#note9#","#note9#","#note9#","#[theme_note_dur:#theme_note_dur_9#][theme_note_on_off:#theme_note_on_off_9#][theme_note_value:#theme_note_value_9#][note9:#evolve_theme_note_constructor#]note9#"
  ],

  "evolve_theme_note10": [
    "#note10#","#note10#","#note10#","#note10#","#[theme_note_dur:#theme_note_dur_10#][theme_note_on_off:#theme_note_on_off_10#][theme_note_value:#theme_note_value_10#][note10:#evolve_theme_note_constructor#]note10#"
  ],

  "evolve_theme_note11": [
    "#note11#","#note11#","#note11#","#note11#","#[theme_note_dur:#theme_note_dur_11#][theme_note_on_off:#theme_note_on_off_11#][theme_note_value:#theme_note_value_11#][note11:#evolve_theme_note_constructor#]note11#"
  ],

  "evolve_theme_note12": [
    "#note12#","#note12#","#note12#","#note12#","#[theme_note_dur:#theme_note_dur_12#][theme_note_on_off:#theme_note_on_off_12#][theme_note_value:#theme_note_value_12#][note12:#evolve_theme_note_constructor#]note12#"
  ],

  "evolve_theme_note13": [
    "#note13#","#note13#","#note13#","#note13#","#[theme_note_dur:#theme_note_dur_13#][theme_note_on_off:#theme_note_on_off_13#][theme_note_value:#theme_note_value_13#][note13:#evolve_theme_note_constructor#]note13#"
  ],

  "evolve_theme_note14": [
    "#note14#","#note14#","#note14#","#note14#","#[theme_note_dur:#theme_note_dur_14#][theme_note_on_off:#theme_note_on_off_14#][theme_note_value:#theme_note_value_14#][note14:#evolve_theme_note_constructor#]note14#"
  ],

  "evolve_theme_note15": [
    "#note15#","#note15#","#note15#","#note15#","#[theme_note_dur:#theme_note_dur_15#][theme_note_on_off:#theme_note_on_off_15#][theme_note_value:#theme_note_value_15#][note15:#evolve_theme_note_constructor#]note15#"
  ],

  "evolve_theme_note16": [
    "#note16#","#note16#","#note16#","#note16#","#[theme_note_dur:#theme_note_dur_16#][theme_note_on_off:#theme_note_on_off_16#][theme_note_value:#theme_note_value_16#][note16:#evolve_theme_note_constructor#]note16#"
  ],

  "evolve_theme_note17": [
    "#note17#","#note17#","#note17#","#note17#","#[theme_note_dur:#theme_note_dur_17#][theme_note_on_off:#theme_note_on_off_17#][theme_note_value:#theme_note_value_17#][note17:#evolve_theme_note_constructor#]note17#"
  ],

  "evolve_theme_note18": [
    "#note18#","#note18#","#note18#","#note18#","#[theme_note_dur:#theme_note_dur_18#][theme_note_on_off:#theme_note_on_off_18#][theme_note_value:#theme_note_value_18#][note18:#evolve_theme_note_constructor#]note18#"
  ],

  "evolve_theme_note19": [
    "#note19#","#note19#","#note19#","#note19#","#[theme_note_dur:#theme_note_dur_19#][theme_note_on_off:#theme_note_on_off_19#][theme_note_value:#theme_note_value_19#][note19:#evolve_theme_note_constructor#]note19#"
  ],

  "evolve_theme_note20": [
    "#note20#","#note20#","#note20#","#note20#","#[theme_note_dur:#theme_note_dur_20#][theme_note_on_off:#theme_note_on_off_20#][theme_note_value:#theme_note_value_20#][note20:#evolve_theme_note_constructor#]note20#"
  ],

  "evolve_theme_note21": [
    "#note21#","#note21#","#note21#","#note21#","#[theme_note_dur:#theme_note_dur_21#][theme_note_on_off:#theme_note_on_off_21#][theme_note_value:#theme_note_value_21#][note21:#evolve_theme_note_constructor#]note21#"
  ],

  "evolve_theme_note22": [
    "#note22#","#note22#","#note22#","#note22#","#[theme_note_dur:#theme_note_dur_22#][theme_note_on_off:#theme_note_on_off_22#][theme_note_value:#theme_note_value_22#][note22:#evolve_theme_note_constructor#]note22#"
  ],

  "evolve_theme_note23": [
    "#note23#","#note23#","#note23#","#note23#","#[theme_note_dur:#theme_note_dur_23#][theme_note_on_off:#theme_note_on_off_23#][theme_note_value:#theme_note_value_23#][note23:#evolve_theme_note_constructor#]note23#"
  ],

  "evolve_theme_note24": [
    "#note24#","#note24#","#note24#","#note24#","#[theme_note_dur:#theme_note_dur_24#][theme_note_on_off:#theme_note_on_off_24#][theme_note_value:#theme_note_value_24#][note24:#evolve_theme_note_constructor#]note24#"
  ],

  "evolve_theme_note_constructor": [
    "i #inst# + 1 0.25 $BO#amp#*#theme_note_on_off#/#voices#$BC $BO#inst_register#+#theme_note_value# #note_offset#$BC ;theme\n"
  ],

  "measure_1": [
    "#note_1#\n#note#\n#note#\n#note#\n"
  ],

  "measure": [
    "#note#\n#note#\n#note#\n#note#\n"
  ],

  "note_1": [
    "i #inst# $BO0+$CNT*#measures#*4$BC 1 #dur# $BO[#set_on_off#]#amp#*#note_on_off#/#voices#$BC $BO#inst_register#+#note_options# #note_offset#$BC\n"
  ],

  "note": [
    "i #inst# + 1 #dur# $BO[#set_on_off#]#amp#*#note_on_off#/#voices#$BC $BO#inst_register#+#note_options# #note_offset#$BC\n"
  ],

  "dur": [
    "0.25","0.25","0.25","0.25","0.25","0.5","0.5","0.5","0.75","0.75","1"
  ],

  "set_on_off": [
    "[note_on_off:0]","[note_on_off:0]","[note_on_off:0]","[note_on_off:1]",
  ],

  "set_theme_note_on_off": [
    "0","0","1"
  ],

  "amp": [
    "0.2","0.25","0.3","0.35","0.4","0.45","0.5","0.55","0.6","0.65","0.7","0.75","0.8","0.85","0.9","0.95"
  ],

  "end_piece": [
    "i 1 0 5 0 0 0\ni -1000 5 0"
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
nchnls = 2

instr 100 ; STRING PLUCK
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
    chnmix aSig*aEnv*1.5, "mixl"
	chnmix aSig*aEnv*1.5, "mixr"
endin

instr 101 ; ORGAN
    p3=p4
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
    asig = kenv*p5*0.5*(a1+a2+a3+a4+a5+a6+a7+a8+a9)
    chnmix asig, "mixl"
    chnmix asig, "mixr"
endin

instr 102 ; CHIMES
    p3=p4
    iamp = p5*.3
    kfreq = cpspch(p6)
    kc1 = 10
    kc2 = 5
    kvdepth = 0.1
    kvrate = 5

    kenv linseg 0,0.1,iamp,p3-0.2,iamp,0.1,0
    asig fmbell kenv, kfreq, kc1, kc2, kvdepth, kvrate, -1, -1, -1, -1, -1, 3
    chnmix asig, "mixl"
	chnmix asig, "mixr"
endin

instr 103 ; FLUTE
    p3=p4
    kfreq = cpspch(p6)
    kc1 = 5
    kvdepth = .01
    kvrate = 6

    kenv expseg 0.001,0.1,p5,p3-0.2,p5,0.1,0.001
    kc2  line 5, p3, p6
    asig fmpercfl kenv, kfreq, kc1, kc2, kvdepth, kvrate
    chnmix asig, "mixl"
	chnmix asig, "mixr"
endin

instr 104 ; VOICE
    p3 = p4
    kfreq cpspch p6
    kvowel = int(random(0,12))	; p4 = vowel (0 - 64)
    ktilt  = 99
    kvibamt = 0.01
    kvibrate = 5

    kenv adsr 0.01,0.1,0.8,0.1
    asig fmvoice p5*kenv, kfreq, kvowel, ktilt, kvibamt, kvibrate
    chnmix asig, "mixl"
	chnmix asig, "mixr"
endin

instr 105 ; RHODES
    seed 0
    p3=p4
    kfreq = cpspch(p6)
    kc1 = int(random(6,30))
    kc2 = 0
    kvdepth = 0.4
    kvrate = 3
    ifn1 = -1
    ifn2 = -1
    ifn3 = -1
    ifn4 = 53
    ivfn = -1
    kenv expseg 0.001,0.01,p5,p3-0.02,p5,0.01,0.001
    asig fmrhode kenv, kfreq, kc1, kc2, kvdepth, kvrate, ifn1, ifn2, ifn3, ifn4, ivfn
    chnmix asig, "mixl"
	chnmix asig, "mixr"
endin

instr 106 ; MARIMBA
    ifreq = cpspch(p6)
    ihrd = 0.1
    ipos = 0.561
    imp = 54
    kvibf = 6.0
    kvamp = 0.05
    ivibfn = 2
    idec = 0.6

    asig marimba p5*8, ifreq, ihrd, ipos, imp, kvibf, kvamp, ivibfn, idec, 0, 0

    chnmix asig, "mixl"
    chnmix asig, "mixr"
endin

instr 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52 ; DRUMS
    p3=4
	if ftchnls(p1) == 1 then
		asigl loscil p5, 1, p1, 1, 0
		asigr = asigl
	elseif ftchnls(p1) == 2 then
	    asigl, asigr loscil p5, 1, p1, 1, 0
	endif
	chnmix asigl, "mixl"
	chnmix asigr, "mixr"
endin


instr 1000 ; mixer
    asigl chnget "mixl"
    asigr chnget "mixr"
    areverbl,areverbr freeverb asigl,asigr,0.4,0.7
    outs asigl+areverbl,asigr+areverbr
    chnclear "mixl"
    chnclear "mixr"
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
f 24 0 0 1 "drums/linn/linn_cabasa.wav" 0 0 0
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
f 41 0 0 1 "drums/oberheim/oberheim_hat_accent.wav" 0 0 0
f 42 0 0 1 "drums/oberheim/oberheim_hat_closed.wav" 0 0 0
f 43 0 0 1 "drums/oberheim/oberheim_hat_open.wav" 0 0 0
f 44 0 0 1 "drums/oberheim/oberheim_kick.wav" 0 0 0
f 45 0 0 1 "drums/oberheim/oberheim_ride.wav" 0 0 0
f 46 0 0 1 "drums/oberheim/oberheim_shake.wav" 0 0 0
f 47 0 0 1 "drums/oberheim/oberheim_snare.wav" 0 0 0
f 48 0 0 1 "drums/oberheim/oberheim_stick.wav" 0 0 0
f 49 0 0 1 "drums/oberheim/oberheim_tamborine.wav" 0 0 0
f 50 0 0 1 "drums/oberheim/oberheim_tom1.wav" 0 0 0
f 51 0 0 1 "drums/oberheim/oberheim_tom2.wav" 0 0 0
f 52 0 0 1 "drums/oberheim/oberheim_tom3.wav" 0 0 0
f 53 0 256 1 "fwavblnk.aiff" 0 0 0
f 54 0 256 1 "marmstk1.wav" 0 0 0
i 1000 0 -1
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
