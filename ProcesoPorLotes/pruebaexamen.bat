@echo off
REM Script pruebaexamen.bat3
REM
REM Manuel Lunar Cabeza  
REM Fecha:21/11/2023

:menu
cls
echo Menu rincipal
echo 1. Crear o verificar archivo
echo 2. Mover archivo al escritorio
echo 3. Crear archivo con nombre de usuario y fecha/hora
echo 4. Salir
set /p opcion=Seleccione una opcion

if %opcion% == 1 (
    call :crear_o_verificar_archivo
) else if %opcion% == 2 (
    call :mover_archivo_al_escritorio
) else if %opcion% == 3 (
    call :crear_archivo_usuario_fecha_hora
) else if %opcion% == 4 (
    exit
) else (
    echo Opcio no vaida. Intaealo de nuevo.
    pause
    goto menu
)

exit /b

:crear_o_verificar_archivo
set /p nombre_archivo=Introduce el nombre del archivo (sin extensión): 
set /p extension=Introduce la extension el archivo:
set archivo=%nombre_archivo%.%extension%

if exist %archivo% (
    echo El archivo ya existe. Introduce otro nombre y extension.
    pause
    goto crear_o_verificar_archivo
) else (
    type nul > %archivo%
    echo Archivo creado: %archivo%
    pause
    goto menu
)

exit /b

:mover_archivo_al_escritorio
set /p archivo_a_mover=Introduce el nombre del archivo a mover (con extension)
set escritorio=%userprofile%\Desktop
if exist %archivo_a_mover% (
    move %archivo_a_mover% %escritorio%
    echo Archivo movido al escritorio.
) else (
    echo El archivo no existe.
)
pause
goto menu

exit /b

:crear_archivo_usuario_fecha_hora
set hora=%TIME%
set fecha=%DATE%
echo %TIME%;%DATE%>%USERNAME%.txt

pause
goto menu

exit /b