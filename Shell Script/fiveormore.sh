#!/bin/bash
#Autor:Manuel Lunar Cabeza
#Fecha: 29/01/2024

clear

if [ $# -lt 2 ]; then 
        echo "Salir"
        exit
fi
if [ -f $1 ]; then
        echo "Si existe "

fi
if [ ! -d $2 ];then
        echo "No existe"

fi
echo "Manuel Lunar Cabeza"
fich=$( ls $2 )

if [ -z $fich 2>/dev/null ];then
        echo "El directorio esta vacio"
fi
fichero=$( ls $2/*.txt)


for i in $fichero; do
        if [ -f $i ];then
        lineas=$(cat $i | wc -l)
        
if [ $lineas -ge 5 ]; then
        echo $i
        echo $i >> $1
fi
done

palabras=$(cat $1| wc -l)

echo "El fichero tiene $palabras" > $i.q
    cat $i > $i.q
fi
fi
done
numero=$(cat $1| wc -l)

echo $numero >> $1
