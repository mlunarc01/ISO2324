@echo off
REM Script media
REM
REM Manuel Lunar
REM Fecha:11/14/2023

set num1=%1
set num2=%2
set num3=%3

set/A suma=%1 + %2 + %3

set/A media=%suma% / 3
echo La media de los tres numeros es: %media%