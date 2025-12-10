$ErrorActionPreference = 'Stop'

$Repo = "ElmerAdrianV/homebrew-octus"
$InstallDir = "$env:LOCALAPPDATA\Octus\bin"
$BinaryName = "octus.exe"
$AssetName = "octus-windows.exe"

# Crear directorio
if (!(Test-Path -Path $InstallDir)) {
    New-Item -ItemType Directory -Force -Path $InstallDir | Out-Null
}

# URL de descarga
$DownloadUrl = "https://github.com/$Repo/releases/latest/download/$AssetName"
$OutputPath = Join-Path -Path $InstallDir -ChildPath $BinaryName

Write-Host "Descargando Octus CLI..." -ForegroundColor Cyan
try {
    Invoke-WebRequest -Uri $DownloadUrl -OutFile $OutputPath
    Write-Host "Descarga completada." -ForegroundColor Green
}
catch {
    Write-Host "Error al descargar: $_" -ForegroundColor Red
    Write-Host "Asegúrate de que existe una Release publicada en GitHub." -ForegroundColor Yellow
    Read-Host "Presiona Enter para salir..."
    exit 1
}

# Agregar al PATH (Usuario)
$CurrentPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($CurrentPath -notlike "*$InstallDir*") {
    $NewPath = "$CurrentPath;$InstallDir"
    [Environment]::SetEnvironmentVariable("Path", $NewPath, "User")
    Write-Host "Agregado al PATH del usuario." -ForegroundColor Green
    Write-Host "Por favor reinicia tu terminal para usar el comando 'octus'." -ForegroundColor Yellow
} else {
    Write-Host "El PATH ya estaba configurado." -ForegroundColor Green
}

Write-Host "Instalación exitosa!" -ForegroundColor Green
Read-Host "Presiona Enter para salir..."