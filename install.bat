@echo off
chcp 65001 >nul
title Supreme Producer Drum Kit - Auto-Installer
cls
echo =====================================================================
echo    🔥 SUPREME PRODUCER DRUM KIT — AUTO-INSTALLER PARA FL STUDIO
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

echo [*] Copiando carpetas de sonidos, loops y midis...
xcopy /E /I /Y /Q "%~dp001_808s_&_Basses" "%TARGET_DIR%\01_808s_&_Basses" >nul
xcopy /E /I /Y /Q "%~dp002_Kicks" "%TARGET_DIR%\02_Kicks" >nul
xcopy /E /I /Y /Q "%~dp003_Snares_&_Rims" "%TARGET_DIR%\03_Snares_&_Rims" >nul
xcopy /E /I /Y /Q "%~dp004_Claps" "%TARGET_DIR%\04_Claps" >nul
xcopy /E /I /Y /Q "%~dp005_HiHats_&_Cymbals" "%TARGET_DIR%\05_HiHats_&_Cymbals" >nul
xcopy /E /I /Y /Q "%~dp006_Percussion" "%TARGET_DIR%\06_Percussion" >nul
xcopy /E /I /Y /Q "%~dp007_FX_&_Chants" "%TARGET_DIR%\07_FX_&_Chants" >nul
xcopy /E /I /Y /Q "%~dp008_Melody_Loops_(Auto_Tempo)" "%TARGET_DIR%\08_Melody_Loops_(Auto_Tempo)" >nul
xcopy /E /I /Y /Q "%~dp009_Drum_Loops_(Auto_Tempo)" "%TARGET_DIR%\09_Drum_Loops_(Auto_Tempo)" >nul
xcopy /E /I /Y /Q "%~dp010_MIDI_Patterns" "%TARGET_DIR%\10_MIDI_Patterns" >nul
copy /Y "%~dp0cover.jpg" "%TARGET_DIR%\" >nul

if %errorlevel% equ 0 (
    echo.
    echo =====================================================================
    echo   [EXITO] Drum Kit instalado correctamente en FL Studio!
    echo =====================================================================
    echo.
    echo   COMO USAR EN FL STUDIO:
    echo   1. Abre FL Studio.
    echo   2. En el navegador izquierdo (Browser), ve a la carpeta 'Packs'.
    echo   3. Veras la carpeta 'Supreme Producer Drum Kit' con todos los sonidos.
    echo   4. Arrastra cualquier sonido, loop o patron MIDI al Channel Rack
    echo      o a la Playlist.
    echo.
    echo   NOTA AUTO-TEMPO:
    echo   Los loops de melodia y bateria contienen etiquetas ACID WAV internas.
    echo   Al arrastrarlos a la Playlist, FL Studio los sincroniza
    echo   automaticamente al tempo de tu proyecto!
    echo.
) else (
    echo [AVISO] Puedes arrastrar la carpeta directamente al navegador de FL Studio.
)

pause
