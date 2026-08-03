@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo.
echo  LET Site — vista previa local
echo  =============================
echo.

REM Opcion 1: Python (recomendado)
where python >nul 2>&1
if %errorlevel%==0 (
    echo  Servidor: Python
    echo  URL:      http://localhost:8080
    echo.
    echo  Presiona Ctrl+C para detener el servidor.
    echo.
    start "" "http://localhost:8080"
    python -m http.server 8080
    goto :fin
)

where py >nul 2>&1
if %errorlevel%==0 (
    echo  Servidor: Python
    echo  URL:      http://localhost:8080
    echo.
    echo  Presiona Ctrl+C para detener el servidor.
    echo.
    start "" "http://localhost:8080"
    py -m http.server 8080
    goto :fin
)

REM Opcion 2: serve (Node.js, instalado globalmente)
where serve >nul 2>&1
if %errorlevel%==0 (
    echo  Servidor: serve
    echo  URL:      http://localhost:3000
    echo.
    echo  Presiona Ctrl+C para detener el servidor.
    echo.
    start "" "http://localhost:3000"
    serve -l 3000
    goto :fin
)

REM Sin servidor disponible
echo  No se encontro Python ni el comando "serve".
echo.
echo  Instala UNA de estas opciones y volve a ejecutar este archivo:
echo.
echo  [Recomendado] Python 3
echo    https://www.python.org/downloads/
echo    Al instalar, marca "Add python.exe to PATH".
echo.
echo  [Alternativa] Node.js + serve
echo    1. Instala Node.js: https://nodejs.org/
echo    2. En una terminal ejecuta: npm install -g serve
echo.
echo  Nota: el sitio usa la carpeta "assets" para imagenes.
echo        Si no existe, el sitio carga pero sin fotos/logos.
echo.
pause
goto :fin

:fin
