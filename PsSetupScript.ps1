# STILL NEEDS TO BE DEVELOPED; Does not work yet
# Define variables
$pythonInstaller = "python-3.12.2-amd64.exe"
$pythonInstallerUrl = "https://www.python.org/ftp/python/3.12.2/$pythonInstaller"
$pythonInstallPath = "$env:LOCALAPPDATA\Programs\Python\Python312"
$scriptName = "pdf2word.py"
$desktopPath = [Environment]::GetFolderPath("Desktop")
$scriptPath = Join-Path -Path $desktopPath -ChildPath $scriptName

# Function to download file
Function Download-File {
    param (
        [string]$url,
        [string]$destination
    )
    (New-Object System.Net.WebClient).DownloadFile($url, $destination)
}

# Install Python if not already installed
if (-Not (Test-Path -Path $pythonInstallPath)) {
    Write-Output "Downloading Python installer..."
    Download-File -url $pythonInstallerUrl -destination $pythonInstaller

    Write-Output "Installing Python..."
    Start-Process -FilePath $pythonInstaller -ArgumentList "/quiet InstallAllUsers=1 PrependPath=1" -Wait

    # Clean up
    Remove-Item -Path $pythonInstaller
}

# Install pdf2docx using pip
Write-Output "Installing pdf2docx..."
$pythonExe = "$pythonInstallPath\python.exe"
& $pythonExe -m pip install pdf2docx

# Create the Python script on the Desktop
$scriptContent = @'
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
'@
Set-Content -Path $scriptPath -Value $scriptContent

# Create a shortcut on the Desktop to run the Python script
$shortcutPath = Join-Path -Path $desktopPath -ChildPath "Run PDF to Word Converter.lnk"
$wshShell = New-Object -ComObject WScript.Shell
$shortcut = $wshShell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = $pythonExe
$shortcut.Arguments = $scriptPath
$shortcut.Save()

Write-Output "Setup complete! Double-click the 'Run PDF to Word Converter' shortcut on your desktop to use the converter."
