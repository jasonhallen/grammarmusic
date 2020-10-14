import tracery
from tracery.modifiers import base_english
import ctcsound
from random import choice
from datetime import datetime

# TASKS
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
    "t 0 [tempo:#set_tempo#]#tempo#\n[#set_mode#][#set_drums#][#set_voices#]; #mode# #drums#\n#voices_template#\n"
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
    "[loop1:#set_measures#][store1:#measures#*4*#repeat#][store3:#max_loop_length#-(#store1#+#store2#)]b $BO#max_loop_length#-#store1#$BC\n#loop1#\n\n#evolve_template#\n\n"
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
    "#note1_evolve#","#note1_evolve#","#note1_evolve#","#note1_evolve#","#note1_evolve#","#note1_evolve#","#note1_evolve#","#note1_evolve#","#note1_evolve#","#note1_evolve#","#note1_evolve#","#[note1_evolve:#note1#]note1_evolve#"
  ],

  "evolve_note2": [
    "#note2#","#note2#","#note2#","#note2#","#note2#","#note2#","#note2#","#note2#","#note2#","#note2#","#note2#","#[note2:#note#]note2#"
  ],

  "evolve_note3": [
    "#note3#","#note3#","#note3#","#note3#","#note3#","#note3#","#note3#","#note3#","#note3#","#note3#","#note3#","#[note3:#note#]note3#"
  ],

  "evolve_note4": [
    "#note4#","#note4#","#note4#","#note4#","#note4#","#note4#","#note4#","#note4#","#note4#","#note4#","#note4#","#[note4:#note#]note4#"
  ],

  "evolve_note5": [
    "#note5#","#note5#","#note5#","#note5#","#note5#","#note5#","#note5#","#note5#","#note5#","#note5#","#note5#","#[note5:#note#]note5#"
  ],

  "evolve_note6": [
    "#note6#","#note6#","#note6#","#note6#","#note6#","#note6#","#note6#","#note6#","#note6#","#note6#","#note6#","#[note6:#note#]note6#"
  ],

  "evolve_note7": [
    "#note7#","#note7#","#note7#","#note7#","#note7#","#note7#","#note7#","#note7#","#note7#","#note7#","#note7#","#[note7:#note#]note7#"
  ],

  "evolve_note8": [
    "#note8#","#note8#","#note8#","#note8#","#note8#","#note8#","#note8#","#note8#","#note8#","#note8#","#note8#","#[note8:#note#]note8#"
  ],

  "evolve_note9": [
    "#note9#","#note9#","#note9#","#note9#","#note9#","#note9#","#note9#","#note9#","#note9#","#note9#","#note9#","#[note9:#note#]note9#"
  ],

  "evolve_note10": [
    "#note10#","#note10#","#note10#","#note10#","#note10#","#note10#","#note10#","#note10#","#note10#","#note10#","#note10#","#[note10:#note#]note10#"
  ],

  "evolve_note11": [
    "#note11#","#note11#","#note11#","#note11#","#note11#","#note11#","#note11#","#note11#","#note11#","#note11#","#note11#","#[note11:#note#]note11#"
  ],

  "evolve_note12": [
    "#note12#","#note12#","#note12#","#note12#","#note12#","#note12#","#note12#","#note12#","#note12#","#note12#","#note12#","#[note12:#note#]note12#"
  ],

  "evolve_note13": [
    "#note13#","#note13#","#note13#","#note13#","#note13#","#note13#","#note13#","#note13#","#note13#","#note13#","#note13#","#[note13:#note#]note13#"
  ],

  "evolve_note14": [
    "#note14#","#note14#","#note14#","#note14#","#note14#","#note14#","#note14#","#note14#","#note14#","#note14#","#note14#","#[note14:#note#]note14#"
  ],

  "evolve_note15": [
    "#note15#","#note15#","#note15#","#note15#","#note15#","#note15#","#note15#","#note15#","#note15#","#note15#","#note15#","#[note15:#note#]note15#"
  ],

  "evolve_note16": [
    "#note16#","#note16#","#note16#","#note16#","#note16#","#note16#","#note16#","#note16#","#note16#","#note16#","#note16#","#[note16:#note#]note16#"
  ],

  "evolve_note17": [
    "#note17#","#note17#","#note17#","#note17#","#note17#","#note17#","#note17#","#note17#","#note17#","#note17#","#note17#","#[note17:#note#]note17#"
  ],

  "evolve_note18": [
    "#note18#","#note18#","#note18#","#note18#","#note18#","#note18#","#note18#","#note18#","#note18#","#note18#","#note18#","#[note18:#note#]note18#"
  ],

  "evolve_note19": [
    "#note19#","#note19#","#note19#","#note19#","#note19#","#note19#","#note19#","#note19#","#note19#","#note19#","#note19#","#[note19:#note#]note19#"
  ],

  "evolve_note20": [
    "#note20#","#note20#","#note20#","#note20#","#note20#","#note20#","#note20#","#note20#","#note20#","#note20#","#note20#","#[note20:#note#]note20#"
  ],

  "evolve_note21": [
    "#note21#","#note21#","#note21#","#note21#","#note21#","#note21#","#note21#","#note21#","#note21#","#note21#","#note21#","#[note21:#note#]note21#"
  ],

  "evolve_note22": [
    "#note22#","#note22#","#note22#","#note22#","#note22#","#note22#","#note22#","#note22#","#note22#","#note22#","#note22#","#[note22:#note#]note22#"
  ],

  "evolve_note23": [
    "#note23#","#note23#","#note23#","#note23#","#note23#","#note23#","#note23#","#note23#","#note23#","#note23#","#note23#","#[note23:#note#]note23#"
  ],

  "evolve_note24": [
    "#note24#","#note24#","#note24#","#note24#","#note24#","#note24#","#note24#","#note24#","#note24#","#note24#","#note24#","#[note24:#note#]note24#"
  ],

  "set_measures": [
    "[measures:3][#set_inst#]\n{ #[repeat:#set_repeat#]repeat# CNT\n#[note1:#note_1#][note1_evolve:#note#]note1# #[note2:#note#]note2# #[note3:#note#]note3# #[note4:#note#]note4# #[note5:#note#]note5# #[note6:#note#]note6# #[note7:#note#]note7# #[note8:#note#]note8# #[note9:#note#]note9# #[note10:#note#]note10# #[note11:#note#]note11# #[note12:#note#]note12#}\n[evolve_template:#evolve_3#]","[measures:4][#set_inst#]\n{ #[repeat:#set_repeat#]repeat# CNT\n#[note1:#note_1#][note1_evolve:#note#]note1# #[note2:#note#]note2# #[note3:#note#]note3# #[note4:#note#]note4# #[note5:#note#]note5# #[note6:#note#]note6# #[note7:#note#]note7# #[note8:#note#]note8# #[note9:#note#]note9# #[note10:#note#]note10# #[note11:#note#]note11# #[note12:#note#]note12# #[note13:#note#]note13# #[note14:#note#]note14# #[note15:#note#]note15# #[note16:#note#]note16#}\n[evolve_template:#evolve_4#]","[measures:5][#set_inst#]\n{ #[repeat:#set_repeat#]repeat# CNT\n#[note1:#note_1#][note1_evolve:#note#]note1# #[note2:#note#]note2# #[note3:#note#]note3# #[note4:#note#]note4# #[note5:#note#]note5# #[note6:#note#]note6# #[note7:#note#]note7# #[note8:#note#]note8# #[note9:#note#]note9# #[note10:#note#]note10# #[note11:#note#]note11# #[note12:#note#]note12# #[note13:#note#]note13# #[note14:#note#]note14# #[note15:#note#]note15# #[note16:#note#]note16# #[note17:#note#]note17# #[note18:#note#]note18# #[note19:#note#]note19# #[note20:#note#]note20#}\n[evolve_template:#evolve_5#]","[measures:6][#set_inst#]\n{ #[repeat:#set_repeat#]repeat# CNT\n#[note1:#note_1#][note1_evolve:#note#]note1# #[note2:#note#]note2# #[note3:#note#]note3# #[note4:#note#]note4# #[note5:#note#]note5# #[note6:#note#]note6# #[note7:#note#]note7# #[note8:#note#]note8# #[note9:#note#]note9# #[note10:#note#]note10# #[note11:#note#]note11# #[note12:#note#]note12# #[note13:#note#]note13# #[note14:#note#]note14# #[note15:#note#]note15# #[note16:#note#]note16# #[note17:#note#]note17# #[note18:#note#]note18# #[note19:#note#]note19# #[note20:#note#]note20# #[note21:#note#]note21# #[note22:#note#]note22# #[note23:#note#]note23# #[note24:#note#]note24#}\n[evolve_template:#evolve_6#]"
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
    "i #inst_set# $BO0+[#set_offset#]#offset#+$CNT*#measures#*4$BC 1 #dur# $BO[#set_on_off#]#amp#*#note_on_off#/#voices#$BC $BO#inst_register#+#note_options#$BC\n"
  ],

  "note": [
    "i #inst_set# + 1 #dur# $BO[#set_on_off#]#amp#*#note_on_off#/#voices#$BC $BO#inst_register#+#note_options#$BC\n"
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
    "[note_on_off:0]","[note_on_off:0]","[note_on_off:0]","[note_on_off:1]",
  ],

  "amp": [
    "0.2","0.25","0.3","0.35","0.4","0.45","0.5","0.55","0.6","0.65","0.7","0.75","0.8","0.85","0.9","0.95"
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
