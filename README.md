This repository contains series of python exercices as well as bash scripts to run unit tests on those.

Usually python unit testing with pytest focuses on testing functions in an object oriented way. But these python exercices are intended for beginners and don't contain any functions.

Consequently, bash scripts are easier to test simple python scripts. Moreover, the default option verifies python exercices of a same serie in order, such that students are forced to validate the first exercice before moving on to the next.

The current assumption is that each python exercice takes user input with input() command and outputs results with the print() command.

Every unit test states a sequence of string input given by the user and validates the output against a very basic regex for expected output and against another regex for unexpected output.

The regex syntax  is currently only to match substrings with * symbol in between to denote an arbitrary number of characters.

The basic syntax if you want to create your own tests is the following :

`check your_exercice_name.py "input1\ninput2\ninput3" "expected_output1*expected_output2" "unexpeted_output1*unexpected_output2"`