from engine import GrammarEngine

def midterm():

  engine = GrammarEngine(file_path="midterm_grammar.txt")

  output = engine.generate(start_symbol_name="SCORE", debug=False)
  output = output.replace("\\n","\n")
  print(output)
  print()

midterm()
