#!/bin/bash
#Calculadora
#Autor:Manuel Lunar
#Fecha: 12301/2024

clear

echo "Manuel Lunar Cabeza"

if [ $# -ne 2 ]; then

	echo "Numero de paramtros incorrecto"
	exit	
fi

if [ -f "$1" ]; then
	echo "Fichero existente"
	exit	
fi

for ((i=0;i<$2;i++)); do

read -p "Operacion: op1 op2" op op1 op2

	case $op in 
	
		S)
		
		suma=$((op1 + op2))
		echo $op $op1 $op2 >> $1
		echo "El resultado de la suma es $suma"
		;;
		
		R)
		
		resta=$((op1 - op2))
		echo "El resultado de la resta es $resta"
		echo $op $op1 $op2 >> $1
		;;
		
		M)
		
		multi=$((op1 * op2))
		echo "El resultado de la multiplicacion es $multi"
		echo $op $op1 $op2 >> $1
		
		
		;;
		
		D)
		
		div=$((op1 / op2))
		echo "El resultado de la division es $div"
		echo $op $op1 $op2 >> $1
		
		
		;;
		
		X)
		
		echo "Salir del script"
		break 
		;;
		
		*)
		
		echo "Operacion incorrecta"
		break
		;;
		
		
		
		
	esac
	done	
	a=$(pwd)
	echo "$a/$1"
	echo "El contenido del fichero"
	cat $1
