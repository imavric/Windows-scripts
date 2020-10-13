echo off

echo.
echo  :: Provera Administratorskih privilegija... (Checking For Administrator Elevation...)
echo.
timeout /t 1 /nobreak > NUL
openfiles > NUL 2>&1
if %errorlevel%==0 (
        echo Privilegije OK. Nastavljam... (Elevation found! Proceeding...)
) else (
        echo  :: Niste pokrenuli skript kao Administrator. (You are NOT running as Administrator)
        echo.
        echo     Desni klik na ikonu pa odaberite ^'Run as Administrator^'. (Right-click and select ^'Run as Administrator^' and try again.)
        echo     Pritisnite bilo koje dugme za kraj... (Press any key to exit...)
        pause > NUL
        exit
)

rem Clear print queue
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
