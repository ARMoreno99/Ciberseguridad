#!/bin/bash

# Fecha 14/12/2021
# Autor: Alejandro Rodriguez
# Curso de Especalizacion de Ciberseguridad 


tput civis # Ocultar Cursos

	## Funciones ##

# Ctrl+C

function ctrl_c(){
	
	echo -e "\n[!] Saliendo...\n"
	tput cnorm;exit 1

}

trap ctrl_c INT




# Funcion copia (1)

function copia(){

	clear

	comprobar=`ls -l . | grep copia_ | wc -l`
	limite=1
	
	if [ $comprobar -le $limite ];then
		
		echo -e "[*] Creando copia de seguridad"
	        zip -r copia_$(whoami)_$(date +%d%m%Y_%H:%M:%S).zip usuarios.csv &>/dev/null
		echo -e "[!] Copia de seguridad creada el $(date +%d%m%Y_%H:%M:%S)" >> logs.log 
	else
	
		echo "[!] Dos copias en el sistema, BORRANDO la mas antigua."
		elimina=`ls -tr copia_* | head -n1 | xargs rm -R`
		$elimina
		echo "[+] Creando backup"
	        zip -r copia_$(whoami)_$(date +%d%m%Y_%H:%M:%S).zip usuarios.csv &>/dev/null
                echo -e "[!] Copia de seguridad creada el $(date +%d%m%Y_%H:%M:%S)" >> logs.log 

	fi

	repetir
}

# Funcion alta (2)
function alta(){

	clear
	echo -e "\n[*] Alta de usuario\n"
	read -p "Introduce el nombre del usuario: " nombre
	read -p "Introduce el apellido del usuario: " apellido1
	read -p "Introduce el segundo apellido del usuario: " apellido2
	read -p "Introduce el DNI del usuario: " dni

	existe
	#INSERTADO Nombre:Apellido:Apellido_Usuario el 05/12/2021 a las 16:52h
	echo "[+] INSERTADO: $nombre:$apellido1:$apellido2:$dni:$(echo $nombre | head -c1 | tr '[:upper:]' '[:lower:]' ; echo $apellido1 | head -c3 | tr '[:upper:]' '[:lower:]' ; echo $apellido2 | head -c3 | tr '[:upper:]' '[:lower:]' ; echo $dni | tail -c5 | head -c3) a las $(date +%H:%M:%S_%d/%m/%Y)" >> logs.log

	repetir
}

# Funcion baja (3)

function baja(){
	
	clear
	echo -e "\n[*] Baja de usuario\n"	
	read -p "Introduce un usuario: " user
	
	#BORRADO Nombre:Apellido:Apellido_Usuario el 05/12/2021 a las 16:52h
	echo "[!] BORRADO: $(grep $user usuarios.csv) a las $(date +%H:%M:%S_%d/%m/%Y)" >> logs.log
	grep -wv $user usuarios.csv 2>/dev/null | sponge usuarios.csv
	echo -e "\n[!] Usuario $user borrado\n"

	repetir
}

# Funcion Generacion Usuario

function generauser(){
	
	clear
	echo -e "\n[+] Creando usuario..."
	user=$(echo $nombre:$apellido1:$apellido2:$dni:$(echo $nombre | head -c1 | tr '[:upper:]' '[:lower:]' ; echo $apellido1 | head -c3 | tr '[:upper:]' '[:lower:]' ; echo $apellido2 | head -c3 | tr '[:upper:]' '[:lower:]' ; echo $dni | tail -c5 | head -c3))
	echo $user >> usuarios.csv
	echo -e "\n[*]" $user
	echo -e "\n"
}

# Funcion mostrar usuarios (4)

function mostrar_usuarios(){
	
	clear
	echo -e "[*] Mostrando usuarios\n"
	echo -e "\t"
	cat usuarios.csv | awk '{print $NF}' FS=":" | sort -u

	repetir
}

# Funcion mostrar logs (5)

function mostrar_logs(){

	clear
	control_log
	cat logs.log
	
	repetir

}

# Funcion comprobacion usuario

function existe(){

	if grep -w $nombre usuarios.csv &>/dev/null; then # Verificacion de la existencia usuario
		echo -e "\n[!] El usuario $nombre existe\n"
	else
		generauser
	fi
}

# Funcion verificar existencia archivos

function  control(){
	
	clear
	if [ $(find / -name usuarios.csv 2>/dev/null | tr '/' ' ' | awk '{print $NF}') -a usuarios.csv ];then
		echo -e "\n[+] El archivo usuarios.csv existe"
	else
		echo -e "\n[!] No existe el archivo usuarios.csv"
		echo "[+] Creando archivo usuario.csv"
		touch "usuarios.csv"

	fi
}

# Funcion verificar existencia logs.log

function  control_log(){
        
        if [ $(find / -name logs.log 2>/dev/null | tr '/' ' ' | awk '{print $NF}') -a logs.log ];then
                echo -e "\n[+] El archivo logs.log existe"
        else
                echo -e "\n[!] No existe el archivo logs.log"
                echo "[+] Creando archivo logs.log"
                touch "logs.log"

        fi
}

# Funcion Repetir

function repetir(){

# Funcion para preguntar si quiere realizar otra operacion

	echo -e "\n"
	read -p "¿Quieres hacer otra operacion?: " operacion

	case $operacion in
	
	[Yy]) menu
	;;
	[Nn]) salir
        ;;
	*) repetir
	;;
	esac


}


# Funcion salir (6)

function salir(){

	echo -e "\n[!] Saliendo....\n"
	exit 0

}

# Funcion menu

function menu(){
	
	sleep 1
	clear
	echo -e "\n[+] ~~~~~ MENU ~~~~~ "
	echo "[*] 1) Ejecutar copia de seguridad"
	echo "[*] 2) Dar alta usuario"
	echo "[*] 3) Dar baja usuario"
	echo "[*] 4) Mostrar usuario"
	echo "[*] 5) Mostrar log del sistema"
	echo -e "[*] 6) Salir \n"

	read -p "Selecciona una opcion: " opcion

	case $opcion in

		1)
			copia
		;;
		2)
			alta
		;;	
		3)
			baja
		;;
		4)
			mostrar_usuarios
		;;
		5)
			mostrar_logs
		;;	
		6)
			salir
		;;


	esac


}

# Core del programa

control
control_log

function login(){

	if [ $# -ne 0 ];then
		echo -e "\n[!] No introduccir ningun parametro.\n"
	else
		echo -e "\n~~~~~~~~~~$(date +%H:%M:%S_%d/%m/%Y)~~~~~~~~~~\n" >> logs.log

		echo -e "\n"
		sleep 1
		clear	
		read -p "Introduce el nombre usuario: " usuario

		if grep -wq $usuario usuarios.csv 2>/dev/null;then # Verificacion de usuario
			menu
		fi
		if [ $usuario == "admin" ];then # Verificacion de usuario admin
        		menu
		fi
	fi
}

# Bucle para mostrar login y verificar.

while true;do

	login

done
