@echo off
rem chcp 850
setlocal enableDelayedExpansion
copy NUL result.txt > NUL
:loop
IF "%1"=="" GOTO end	
	echo 1 loop empty names2
	copy NUL %temp%\names2.tmp > NUL
	echo 2
	net user %1 /domain > %temp%\names.tmp
	echo 3
	findstr "Full" %temp%\names.tmp >> %temp%\names2.tmp
	echo 4
	dir %temp%\names2.tmp
	echo ::::::::::::::::::::::::::::::::
	type %temp%\names2.tmp
	echo 5 ///%newname%///
	set /p newname= < %temp%\names2.tmp
	echo 5 ---%newname%---
	for /F "tokens=*" %%A in (%temp%\names2.tmp) do (
		echo 6
		set x=%%A	
		set trimmed=!x:~25!		
		echo %1 !trimmed! >> result.txt
	)
	SHIFT
	GOTO loop
:end
echo result.txt
type result.txt