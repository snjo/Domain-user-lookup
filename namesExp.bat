@echo off
rem chcp 850
setlocal enableDelayedExpansion
copy NUL result.txt > NUL
:loop
IF "%1"=="" GOTO end
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
:end
echo ----------
echo result.txt
type result.txt
echo.
echo use n.bat to open the file