@echo off
setlocal enableDelayedExpansion
IF "%1"=="" GOTO helpstart
IF "%1"=="/?" GOTO helpstart
IF "%1"=="help" GOTO helpstart

net user %1% /domain

GOTO end
:helpstart
echo.
echo Gives information on the specified Active Directory user
echo. 
echo   U [Username]
echo.
echo Example: u mry
echo.
echo Check readme.md or https://github.com/snjo/Domain-user-lookup for more information
GOTO end
:helpend
:end
