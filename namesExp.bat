@echo off
rem chcp 850
setlocal enableDelayedExpansion
IF "%1"=="" GOTO helpstart
IF "%1"=="/?" GOTO helpstart
IF "%1"=="help" GOTO helpstart
copy NUL result.txt > NUL
:loop
IF "%1"=="" GOTO loopend
	copy NUL %temp%\names2.tmp > NUL
	copy NUL %temp%\names3.tmp > NUL	
	echo %1 >> result.txt
	net user %1 /domain > %temp%\names.tmp	
	findstr "Full" %temp%\names.tmp >> %temp%\names2.tmp
	findstr "Account expires" %temp%\names.tmp >> %temp%\names3.tmp	
	for /F "tokens=*" %%A in (%temp%\names2.tmp) do (
		set x=%%A	
		set trimmed=!x:~29!		
		echo ;!trimmed! >> result.txt
		type %temp%\names3.tmp >> result.txt		
	)
	SHIFT
	GOTO loop
:loopend
echo ----------
echo result.txt
type result.txt
echo.
echo use n.bat to open the file
GOTO end
:helpstart
echo.
echo namesExp [Username] [Username] [Username] etc.
echo.
echo Lists user names and their full names, password expiry dates and account enabled status.
echo Full name starts with a semicolon in order to process the text.
echo Example: namesexp mry kvn
echo.
echo Check readme.md or https://github.com/snjo/Domain-user-lookup for more information
GOTO end
:helpend
:end