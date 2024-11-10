@echo off
:: Definir variables
SET FILE_URL=https://github.com/Bemen3M07/p2-xslt-lil-lee/archive/refs/heads/main.zip
SET DEST_PATH=C:\xampp\htdocs\MockUPTest

echo Descarregant fitxers des de GitHub...

:: Crear el directori de destinació si no existeix
IF NOT EXIST "%DEST_PATH%" (
    mkdir "%DEST_PATH%"
)

:: Descarregar el fitxer ZIP utilitzant PowerShell
powershell -command "& { iwr %FILE_URL% -OutFile MockUPTest.zip }"

:: Comprovar si la descàrrega ha tingut èxit
IF NOT EXIST "MockUPTest.zip" (
    echo La descàrrega ha fallat. Si us plau, comprova l'URL.
    pause
    exit /b
)

echo Extraient fitxers...

:: Extreure el fitxer ZIP utilitzant tar
tar -xf MockUPTest.zip -C "%DEST_PATH%" --strip-components=1

:: Netejar el fitxer ZIP descarregat
del MockUPTest.zip

echo Els fitxers s'han descarregat i desplegat correctament a %DEST_PATH%.

echo Redefinint configuració per la correcta funcionalitat.
cd C:\xampp\htdocs\MockUPTest\Deployment
java ConfigModifier


:: Re-Iniciar el servidor Apache
echo Re-Iniciant el servidor Apache...
cd C:\xampp
xampp_stop.exe

timeout /t 2 /nobreak >nul
echo Expera un moment.
xampp_start.exe

:: Comprovar si Apache s'ha iniciat correctament
IF %ERRORLEVEL% NEQ 0 (
    echo No s'ha pogut iniciar el servidor Apache. Si us plau, comprova la teva instal·lació de XAMPP.
    pause
    exit /b
)

echo El servidor Apache s'ha iniciat correctament.

:: Esperar uns segons per assegurar-se que Apache s'ha iniciat completament
timeout /t 5 /nobreak >nul

:: Obrir el navegador web predeterminat i navegar al lloc web local
echo Obrint el navegador per veure el lloc web...
start http://localhost/MockUPTest

pause
