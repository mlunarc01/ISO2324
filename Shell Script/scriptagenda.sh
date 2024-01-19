#!/bin/bash
#
#Autor:Manuel Lunar
#Fecha:17/01/2024

clear

while true ;do 

	echo "a-Añadir una entrada"
	echo "b-Buscar por dni"
	echo "c-Ver la agenda completa"
	echo "d-Eliminar todas las entradas de la agenda"
	echo "e-Finalizar"
	read -p "Selecciona una opcion: " option
	
	case $option in 
		
		a)
			read -p "Introduce el DNI: " dni
			if grep "^$dni:" agenda.txt 2>/dev/null ; then
				echo "Error, el usuario ya existe"
			else 
				read -p "Introduce un nombre: " nombre 
				read -p "Introduce un apellido: " apellido
				read -p "Introduce un localidad: " localidad 
				
				echo $dni:$nombre:$apellido:$localidad >> agenda.txt
			fi
		;;
		b)
			read -p "Introduce el DNI: " dni
    			if grep -q "^$dni:" agenda.txt -r > /dev/null ; then
        			nombre=$(grep "^$dni:" agenda.txt | cut -d':' -f2)
        			echo "La persona con DNI $dni es: $nombre"
    			else
        			echo "No se encontró ninguna entrada con el DNI $dni."
    			fi
		;;
		c)
			if [ -s agenda.txt ]; then
       			cat agenda.txt
       		else
        			echo "Agenda vacía"
    			fi
    		;;
		d)
			echo -n > agenda.txt
			echo "Has borrado el contenido"
		;;
		e)
			echo "Finalizar"
			exit
		;; 
		
	esac 
done
		

