#!/bin/bash
#-----------------FUNCIONES--------------#
function mostrar_menu(){
	clear
	echo "1 Ingresar numero entero y conocer sucesion de Fibonacci"
	echo "2 Ingresar numero entero y conocer el numero en forma invertida"
	echo "3 Ingresar cadena de caracteres y saber si es palindromo"
	echo "4 Ingresar path de archivo de texto y ver su cantidad de lineas"
	echo "5 Ingresar 5 numeros enteros y ordenarlos"
	echo "6 Salir"
}


#--------PROGRAMA PRINCIPAL------#
OPCION=0
mostrar_menu
while true
do
	read -p "Ingrese una opcion: " OPCION
	case $OPCION in
		1) if [ $# -eq 1 ]
			then
				Num=$1
			else
				echo -n "Ingresar numero: "
				read Num
		   fi
		   f1=0
		   f2=1
			echo "La secuencia de Fibonacci para $Num es: "

		for (( i=0; i<=Num; i++ ))
		do
			echo -n "$f1 "
			fn=$(( f1 + f2 ))
			f1=$f2
			f2=$fn
		done
		echo
		;;
		2)echo -n "Introduzca un numero: "
			read n
			sd=0
			rev=0
			while [ $n -gt 0 ]
			do
				sd=$(( $n % 10 ))
				rev=`expr $rev \* 10 + $sd`
				n=$(( $n / 10 ))
			done
		echo "El reverso del numero introducido es $rev"
		;;
		3)echo "Introduzca una frase, palabra para evaluar si es capicua"
			read VAR

			#CONFIGURO TAMAÑO REAL DE LA VARIABLE A EVALUAR
			CAPTAM=$(echo $VAR | wc -c)
			TAM=$(($CAPTAM-1))
			STR=$VAR

			#Quito espacios por si existen
			for j in $(seq 1 1 $TAM)
			do
				CONCAT=$CONCAT$(echo $VAR | cut -f$j -d" ")
			done

			#Vuelvo a configurar tamaño real
			CAPTAM1=$(echo $CONCAT | wc -c)
			TAM1=$(( $CAPTAM1-1 ))

			#Divido la lectura hacia delante y hacia atras de la frase en dos para 
			#luego compararlas
			for i in $(seq 1 1 $TAM1)
			do
				ESP=$ESP$(echo $CONCAT | cut -c $TAM1)
				FRENTE=$FRENTE$(echo $CONCAT | cut -c $i)
				TAM1=$(($TAM1-1))
			done

			#Comparo las variables
			if [ "$ESP" != "$FRENTE" ]; then
				echo "No es palindromo o capicua"
			else
				echo "Si es palindromo o capicua"
			fi
			;;

		4) if [ $# -eq 1 ]
			then
				Nombre=$1
			else
				echo -n "Ingresar un nombre de archivo: "
				read Nombre
			fi
			if [ -f "$Nombre" ]
			then
				count=0
				while read
				do 
					((count=$count+1))
				done < $Nombre
			echo "Numero de lineas del archivo ${Nombre} es: $count"
			else
				echo "el archivo ${Nombre} no existe"
			fi
			;;

		5)IFS=' ' read -ra arr -p "Introduzca 5 numeros separados por espacios: "
			sort -n <(printf "%s\n " "${arr[@]}")
			;;

		6)echo "Adios $(whoami) !"
			exit 0
			;;
		*)echo "Opcion incorrecta";;
	esac
done
