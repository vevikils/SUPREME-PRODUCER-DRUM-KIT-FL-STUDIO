# Supreme Producer Drum Kit v2.0 - PowerShell Installer
Write-Host "=====================================================================" -ForegroundColor Cyan
Write-Host "   🔥 SUPREME PRODUCER SUITE v2.0 — AUTO-INSTALLER" -ForegroundColor Yellow
Write-Host "=====================================================================" -ForegroundColor Cyan

$docs = [Environment]::GetFolderPath('MyDocuments')
$targetBase = Join-Path $docs "Image-Line\FL Studio\Audio\Packs"

if (-not (Test-Path -Path (Split-Path $targetBase -Parent))) {
    $oneDrive = Join-Path $env:USERPROFILE "OneDrive\Documents\Image-Line\FL Studio\Audio\Packs"
    if (Test-Path -Path (Split-Path $oneDrive -Parent)) {
        $targetBase = $oneDrive
    }
}

$targetDir = Join-Path $targetBase "Supreme Producer Drum Kit"
Write-Host "[*] Destino: $targetDir" -ForegroundColor Gray

if (-not (Test-Path -Path $targetDir)) {
    New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
}

$folders = @(
    "01_808s_&_Basses", "02_Kicks", "03_Snares_&_Rims", "04_Claps",
    "05_HiHats_&_Cymbals", "06_Percussion", "07_FX_&_Chants",
    "08_Melody_Samples_32_(Hit_Inspired_Auto_Tempo)",
    "09_Drum_Loops_62_(Genre_Beats_Auto_Tempo)",
    "10_MIDI_Patterns"
)

foreach ($f in $folders) {
    $src = Join-Path $PSScriptRoot $f
    if (Test-Path $src) {
        Copy-Item -Path $src -Destination $targetDir -Recurse -Force
        Write-Host "  [+] Copiado: $f" -ForegroundColor Green
    }
}

Copy-Item -Path (Join-Path $PSScriptRoot "cover.jpg") -Destination $targetDir -Force

Write-Host "`n[EXITO] Drum Kit Suite v2.0 instalado en FL Studio (Packs)!" -ForegroundColor Green
Write-Host "Presiona cualquier tecla para salir..."
[void][System.Console]::ReadKey()
