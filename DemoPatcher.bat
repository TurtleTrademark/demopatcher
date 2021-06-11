@ECHO OFF

IF EXIST "root" (
ECHO Please remove "root" folder.
PAUSE
EXIT
)

IF EXIST "%1" ( GOTO :HASFILE ) ELSE ( GOTO :NOFILE )

:HASFILE
GOTO :MAIN

:NOFILE
ECHO Please drag a Pikmin 2 Disk Image (*.iso or *.gcm) onto the .bat file.
PAUSE
EXIT


:MAIN
ECHO Welcome to the Pikmin 2 Demo Patcher!
ECHO Extracting Pikmin 2 Disk Image... (this may take a while)
gcr.exe %1 "root" e "."
ECHO Disk extracted...

CHOICE /C "UPJ" /M "What Demo Disk Version would you like? (U = USA Demo 1 | P = PAL Demo | J = JPN Demo)"

If %errorlevel% == 1 (XCOPY /E/I/Y "dp\&&systemdataUS"       "root\&&systemdata"
XCOPY /E/I/Y "dp\openingUS.bnr" 		"root\opening.bnr" 
XCOPY /E/I/Y "dp\pikmin2UP.map" 		"root\pikmin2UP.map
XCOPY /E/I/Y "dp\thpUS"                  "root\thp"
XCOPY /E/I/Y "dp\titleUS.szs"             "root\user\Ebisawa\title\title.szs")

If %errorlevel% == 2 (XCOPY /E/I/Y "dp\&&systemdataPAL"       "root\&&systemdata"
XCOPY /E/I/Y "dp\openingPAL.bnr" 		"root\opening.bnr"
XCOPY /E/I/Y "dp\boot_pal.szs" "root\user\Yamashita\arc\boot_pal.szs")

If %errorlevel% == 3 (XCOPY /E/I/Y "dp\&&systemdataJPN"       "root\&&systemdata"
XCOPY /E/I/Y "dp\openingJPN.bnr" 		"root\opening.bnr"
XCOPY /E/I/Y "dp\boot_jp.szs" "root\user\Yamashita\arc\boot_jp.szs")

ECHO Now building new disk image file...
gcr.exe "root" "Pikmin 2 [Patched]%~x1"
rd /s /q "root"
ECHO Done! Enjoy! :3
pause
