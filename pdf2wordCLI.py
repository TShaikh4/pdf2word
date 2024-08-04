### Talha Shaikh - August 2024 
### pdf2word converter, written to help some family members safely and securely convert file types 

import os
from pdf2docx import Converter

def convert_pdf_to_word(pdf_path):
    """
    Converts a PDF file to a Word document (.docx).

    Parameters:
    pdf_path (str): The path to the PDF file to be converted.

    Returns:
    None
    """
    # Remove surrounding quotes if present
    pdf_path = pdf_path.strip('\"')

    # Check if the file exists
    if not os.path.isfile(pdf_path):
        print(f"Error: The file {pdf_path} does not exist.")
        return

    # Check if the file is a PDF
    if not pdf_path.lower().endswith('.pdf'):
        print("Error: The file is not a PDF.")
        return

    # Define the output path
    word_path = pdf_path.replace('.pdf', '.docx')

    # Convert PDF to Word
    cv = Converter(pdf_path)
    cv.convert(word_path, start=0, end=None)
    cv.close()

    print(f"Conversion complete! The file has been saved as {word_path}")

def main():
    """
    Main function to prompt the user for the PDF file path and initiate the conversion.

    Returns:
    None
    """
    # Ask user for the file path
    pdf_path = input("Please enter the path to the PDF file: ").strip()
    convert_pdf_to_word(pdf_path)

if __name__ == "__main__":
    main()
