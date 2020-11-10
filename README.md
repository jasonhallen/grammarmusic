# Grammar Music
[SCREENSHOT]

## Introduction
Grammar Music generates short pieces of music with Tracery, Csound, and Python. I created this as a proof of concept that a grammar language like Tracery could be used to generate music.

The code in this repository is meant to show how Tracery and Csound can be used to make music and how Python can be used to stitch them together. The code is not meant to provide a stand alone, full-featured music generation system.

## Components
- Python 3.7.4
- [Tracery](https://github.com/galaxykate/tracery/tree/tracery2)
- [Csound 6.15](https://csound.com/)

## How It Works
* Python instantiates a Tracery grammar which determines the overall structure of a short piece of music. The grammar also randomly selects the instruments and randomly generates the melodies and rhythms.
* The output of the Tracery grammar is a long string formatted as a valid Csound score. Python loads this score into an instance of Csound which then plays the score.
* The Csound orchestra (i.e. the instruments and sound design) has been pre-designed and is outside the scope of the Tracery grammar itself.
* After playing through the piece, Python saves the Csound orchestra and score as a .csd file so that you can play it again and edit it.

## Key Files
* **grammar_music.py** - This is the main file.  It generates the score with the Tracery grammar and plays the score with the Csound orchestra.
* **grammar_music_tracery_test.py** - I used this for developing and debugging the Tracery grammar separately from the main file.
* **grammar_music_instrument_design.csd** - I used this to design and debug the instruments in the Csound orchestra.

## Examples
You can find example outputs in the **"examples"** folder.

You can also read more about the project and listen to the examples in [my blog post on Grammar Music](https://jasonhallen.com/blog/project-grammar-music).

## Project Status
This project is no longer being developed. It was only meant to be an exercise and a proof of concept that Tracery grammars can be used to generate music. I have since rebuilt the entire project as framework of classes and methods in Python.
