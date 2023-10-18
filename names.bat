@echo off
rem chcp 850
setlocal enableDelayedExpansion
IF "%1"=="" GOTO helpstart
IF "%1"=="/?" GOTO helpstart
IF "%1"=="help" GOTO helpstart
copy NUL result.txt > NUL
:loopend
IF "%1"=="" GOTO end
	copy NUL %temp%\names2.tmp > NUL	
	net user %1 /domain > %temp%\names.tmp
	findstr "Full" %temp%\names.tmp >> %temp%\names2.tmp
	for /F "tokens=*" %%A in (%temp%\names2.tmp) do (
		set x=%%A	
		set trimmed=!x:~25!		
		echo %1 !trimmed! >> result.txt
	)
	SHIFT
	GOTO loopend
:end
echo result.txt
type result.txt
GOTO end
:helpstart
echo.
echo names [Username] [Username] [Username] etc.
echo.
echo Lists the full names of the user names
echo Example: names mry kvn joe
echo.
echo Check readme.md or https://github.com/snjo/Domain-user-lookup for more information
GOTO end
:helpend
:end