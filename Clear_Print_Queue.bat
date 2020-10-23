::
:: Clear printer queue.
::

@echo off

echo.
echo  :: Provera Administratorskih privilegija... (Checking For Administrator Elevation...)
echo.
timeout /t 1 /nobreak > NUL
openfiles > NUL 2>&1
if %errorlevel%==0 (
        echo Privilegije OK. Nastavljam...
) else (
        echo  :: Niste pokrenuli skript kao Administrator.
        echo     Desni klik na ikonu pa odaberite ^'Run as Administrator^'.
        echo     Pritisnite bilo koje dugme za kraj...
        echo.
        echo  :: You are NOT running as Administrator.
        echo     Right-click and select ^'Run as Administrator^' and try again.
        echo     Press any key to exit...
        pause > NUL
        exit
)

:: Clear print queue
echo. 
echo Početak čišćenja. (Clearing print queue.)
echo.
net stop spooler
del %systemroot%\System32\spool\printers\* /Q /F /S
net start spooler
echo.
echo Završeno. (Finished.)
echo.

timeout 5
