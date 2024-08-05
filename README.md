# pdf2wordGUI
Graphical user interface that allows you to select a pdf file, hit one button, and convert it to a word file in the same directory. You don't have to download the whole code base, I'd reccomend just downloading this file (pdf2wordGUI), and then follow the instructions below.

REQUIREMENTS: 
- Python 3.x (Go to https://www.python.org and download then run through the setup wizard) skip this step if you already have Python 
- Conversion Dependecy Package (open a terminal and run the following command: pip install pdf2docx)

To run the program:

I'd suggest saving a shortcut to pdf2wordGUI.py in your desktop, so you can double click on it to run it.

Alternatively, you can run directly from terminal: Python3 path/to/wherever/you/saved/this/script 

OR

Open the file in Python IDLE / VS Code and run it from there. 


# pdf2wordCLI
Accepts a file path to a pdf, converts it to a word file in the same directory, works on Mac OS and Windows locally keeping sensitive information secure. 

REQUIREMENTS: same as above

To run the program: same as above 

# Future considerations: 
- Creating an executable file with pyinstaller. Idea probably discarded; I had to many issues packaging dependencies and ultimately decided it'd be easier to make a powershell script to install the requirements and run the script. I created a rough draft of the script which needs to be debugged but since the MVP is done & inital client satisifed this project isn't a priority and is likely archived. But in the future I'm defintely intrigued by the idea of deploying software and dependencies automatically with powershell scripts.

# Why use this over a free online tool that doesn't require anything to be downloaded or installed?
This script completely runs on your local machine , your pdf isn't being uploaded to some random server offshore, so you can be assured that your data is safe. Because of that this program also runs offline. Also the installation and requirements setup just needs to be done once, afterwards you just run the program from a desktop shortcut. Also, this script and it's dependencies are completely open source so you can see exactly what's going on under the hood. (and if you're a developer, you can fork it and make your own modifications!)
