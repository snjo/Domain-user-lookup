@echo off
rem chcp 850
setlocal enableDelayedExpansion
copy NUL result.txt > NUL
:loop
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
	GOTO loop
:end
echo result.txt
type result.txt