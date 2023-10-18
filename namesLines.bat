@echo off
rem    Lists user names and their full names. Full name starts with a semicolon in order to process the text
rem    Example: nameslines mry kvn
rem chcp 850
setlocal enableDelayedExpansion
copy NUL result.txt > NUL
:loop
IF "%1"=="" GOTO end
	copy NUL %temp%\names2.tmp > NUL
	echo %1 >> result.txt
	net user %1 /domain > %temp%\names.tmp
	findstr "Full" %temp%\names.tmp >> %temp%\names2.tmp
	for /F "tokens=*" %%A in (%temp%\names2.tmp) do (
		set x=%%A	
		set trimmed=!x:~29!		
		echo ;!trimmed! >> result.txt
	)
	SHIFT
	GOTO loop
:end
echo result.txt
type result.txt
echo.
echo use n.bat to open the file