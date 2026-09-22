@echo off
chcp 65001 >nul
title Supreme Producer Drum Kit v2.0 - Auto-Installer
cls
echo =====================================================================
echo    🔥 SUPREME PRODUCER SUITE v2.0 — AUTO-INSTALLER PARA FL STUDIO
echo    (32 Melodias + 62 Drum Loops de Hits + One-Shots + MIDIs)
echo =====================================================================
echo.

set "TARGET_BASE=%USERPROFILE%\Documents\Image-Line\FL Studio\Audio\Packs"

if not exist "%USERPROFILE%\Documents\Image-Line" (
    if exist "%USERPROFILE%\OneDrive\Documents\Image-Line" (
        set "TARGET_BASE=%USERPROFILE%\OneDrive\Documents\Image-Line\FL Studio\Audio\Packs"
    )
)

set "TARGET_DIR=%TARGET_BASE%\Supreme Producer Drum Kit"

echo [*] Carpeta de destino en FL Studio:
echo     "%TARGET_DIR%"
echo.

if not exist "%TARGET_DIR%" (
    echo [*] Creando directorio en Packs de FL Studio...
    mkdir "%TARGET_DIR%"
)

echo [*] Copiando librerias completas (150+ archivos)...
xcopy /E /I /Y /Q "%~dp001_808s_&_Basses" "%TARGET_DIR%\01_808s_&_Basses" >nul
xcopy /E /I /Y /Q "%~dp002_Kicks" "%TARGET_DIR%\02_Kicks" >nul
xcopy /E /I /Y /Q "%~dp003_Snares_&_Rims" "%TARGET_DIR%\03_Snares_&_Rims" >nul
xcopy /E /I /Y /Q "%~dp004_Claps" "%TARGET_DIR%\04_Claps" >nul
xcopy /E /I /Y /Q "%~dp005_HiHats_&_Cymbals" "%TARGET_DIR%\05_HiHats_&_Cymbals" >nul
xcopy /E /I /Y /Q "%~dp006_Percussion" "%TARGET_DIR%\06_Percussion" >nul
xcopy /E /I /Y /Q "%~dp007_FX_&_Chants" "%TARGET_DIR%\07_FX_&_Chants" >nul
xcopy /E /I /Y /Q "%~dp008_Melody_Samples_32_(Hit_Inspired_Auto_Tempo)" "%TARGET_DIR%\08_Melody_Samples_32_(Hit_Inspired_Auto_Tempo)" >nul
xcopy /E /I /Y /Q "%~dp009_Drum_Loops_62_(Genre_Beats_Auto_Tempo)" "%TARGET_DIR%\09_Drum_Loops_62_(Genre_Beats_Auto_Tempo)" >nul
xcopy /E /I /Y /Q "%~dp010_MIDI_Patterns" "%TARGET_DIR%\10_MIDI_Patterns" >nul
copy /Y "%~dp0cover.jpg" "%TARGET_DIR%\" >nul

if %errorlevel% equ 0 (
    echo.
    echo =====================================================================
    echo   [EXITO] Supreme Producer Suite v2.0 instalado en FL Studio!
    echo =====================================================================
    echo.
    echo   COMO USAR EN FL STUDIO:
    echo   1. Abre FL Studio.
    echo   2. En el navegador izquierdo (Browser), ve a la carpeta 'Packs'.
    echo   3. Abre 'Supreme Producer Drum Kit'.
    echo   4. Arrastra cualquier muestra, loop o MIDI a la Playlist o Channel Rack.
    echo.
    echo   AUTO-TEMPO:
    echo   Los 32 samples de melodias y los 62 drum loops contienen cabeceras
    echo   ACID WAV que se sincronizan automaticamente al BPM de tu proyecto!
    echo.
) else (
    echo [AVISO] Puedes arrastrar la carpeta directamente al navegador de FL Studio.
)

pause
