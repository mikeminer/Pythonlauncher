@echo off
setlocal EnableExtensions EnableDelayedExpansion
title Python Launcher (Numeri)

set "PYTHON=python"

:MENU
cls
echo ======================================
echo        PYTHON LAUNCHER
echo ======================================
echo.
call :HELP

:: Carica/ricarica lista file
set "n=0"
for %%f in (*.py) do (
    set /a n+=1
    set "FILE[!n!]=%%f"
)

echo.
if !n! EQU 0 (
    echo [ERRORE] Nessun file .py trovato nella cartella.
    echo Premi un tasto per riprovare...
    pause >nul
    goto MENU
)

echo File trovati:
echo.
for /L %%i in (1,1,!n!) do (
    echo   %%i^) !FILE[%%i]!
)

echo.
echo ======================================
echo Scrivi cosa avviare
echo ======================================
echo Esempi: 1   ^|  1 3 4   ^|  2x3   ^|  2*3
echo.
echo.

set /p "SCELTA=>>> "

if /I "%SCELTA%"=="Q" goto END
if /I "%SCELTA%"=="R" goto MENU
if /I "%SCELTA%"=="HELP" goto MENU

if "%SCELTA%"=="" (
    echo.
    echo [ERRORE] Nessun comando inserito.
    pause >nul
    goto MENU
)

echo.
echo ========= AVVIO =========

for %%x in (%SCELTA%) do (
    set "IDX="
    set "QTY="

    :: Parsing robusto: "2x3" / "2*3" / "1"
    for /f "tokens=1,2 delims=x*" %%a in ("%%x") do (
        set "IDX=%%a"
        set "QTY=%%b"
    )

    if not defined IDX (
        echo [ERRORE] Input non valido: %%x
        goto AFTER
    )
    if not defined QTY set "QTY=1"

    call :RUN "!IDX!" "!QTY!" !n!
)

:AFTER
echo.
echo Operazione completata. Premi un tasto per tornare al menu...
pause >nul
goto MENU


:RUN
set "IDX=%~1"
set "QTY=%~2"
set "MAX=%~3"

:: Controlli numerici
for /f "delims=0123456789" %%z in ("%IDX%") do (
    if not "%%z"=="" (
        echo [ERRORE] Numero non valido: %IDX%
        goto :eof
    )
)
for /f "delims=0123456789" %%z in ("%QTY%") do (
    if not "%%z"=="" (
        echo [ERRORE] Quantita' non valida: %QTY%
        goto :eof
    )
)

if %IDX% LSS 1 (
    echo [ERRORE] Numero fuori range: %IDX%
    goto :eof
)
if %IDX% GTR %MAX% (
    echo [ERRORE] Numero fuori range: %IDX%
    goto :eof
)

set "SCRIPT=!FILE[%IDX%]!"

for /L %%k in (1,1,%QTY%) do (
    echo Avvio !SCRIPT! (istanza %%k)
    start "PY:!SCRIPT!" cmd /k %PYTHON% "!SCRIPT!"
)
goto :eof


:HELP
echo ISTRUZIONI:
echo --------------------------------------
echo - Il launcher trova tutti i file .py nella cartella
echo - Ogni file viene numerato (1, 2, 3...)
echo - Puoi avviare uno o piu' script
echo.
echo FORMATI:
echo   1       = avvia script 1
echo   1 3 4   = avvia 1, 3 e 4
echo   2x3     = 3 istanze dello script 2
echo   2*3     = uguale a 2x3
echo --------------------------------------
goto :eof


:END
echo.
echo Uscita. Premi un tasto...
pause >nul
exit /b
