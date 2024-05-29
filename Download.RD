# Downloading
## Powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest https://github.com/El-Merovingio/AD-RedTeam-Setup/blob/main/ADSETUPLab.zip -outfile ADSETUPLab.zip

# Define the URIs
$zipFilePath = "C:\Users\Administrador\Desktop\ADSETUPLab.zip"
$destinationPath = "C:\Users\Administrador\Desktop\ADSETUPLab"

# Create the folder if not exists
if (-not (Test-Path $destinationPath)) {
    New-Item -ItemType Directory -Path $destinationPath
}

# Create COM Shell object
$shell = New-Object -ComObject Shell.Application

# Reference the ZIP file as folder
$zipFile = $shell.NameSpace($zipFilePath)

# Reference destination folder
$destinationFolder = $shell.NameSpace($destinationPath)

# Copy .zip elements to destination folder
$destinationFolder.CopyHere($zipFile.Items(), 0x10)  # 0x10 es para evitar los diálogos de confirmación
