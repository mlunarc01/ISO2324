@echo off
REM createFiles.bat
REM
REM Manuel Lunar Cabeza
REM Fecha:15/11/2023

title User Input
echo Pulsa 1 si quieres guardar el archivo en .txt
echo Pulsa 2 si quieres guardar el archivo en .bat

set /P num=
if %num% == 1 goto archivotxt
if %num% == 2 goto archivobat

:archivotxt
echo Ha seleccionado .txt
set /P nombre="Introduzca el nombre de su archivo"
type nul > %nombre%.txt

:archivobat
echo Ha seleccionado .bat
set /P nombre="Introduzca el nombre de su archivo"
type nul > %nombre%.bat
exit