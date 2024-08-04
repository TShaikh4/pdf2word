# pdf2wordGUI
Graphical user interface that allows you to select a pdf file, hit one button, and convert it to a word file in the same directory. You don't have to download the whole code base, I'd reccomend just downloading this file (pdf2wordGUI), and then follow the instructions below.

REQUIREMENTS: run brackets in a terminal {win + R, cmd}
- Python 3.x (Windows: winget install Python.Python, Mac: brew install python) skip this step if you already have Python 
- Conversion Dependecy Pakage (pip install pdf2docx, if that doesn't work: pip3 install pdf2docx)

To run the program:
directly from terminal: Python3 path/to/wherever/you/saved/this/script 

OR

Open the file in Python IDLE / VS Code and run it from there. 


# pdf2wordCLI
Accepts a file path to a pdf, converts it to a word file in the same directory, works on Mac OS and Windows locally keeping sensitive information secure. 

REQUIREMENTS: same as above

To run the program: same as above 

# Future considerations: 
- Creating an executable file with pyinstaller.

# Why use this over a free online tool that doesn't require anything to be downloaded or installed?
This script runs on your local machine completely, your pdf isn't being uploaded to some shady random server offshore so you can be assured your data is safe. Also the installation and requirements setup just needs to be done once, afterwards you just run the program from your terminal or an IDE and instantly convert your files. Also, this script and it's dependencies are completely open source so you can see exactly what's going on under the hood. (and if you're a developer, you can fork it and make your own modifications!)
