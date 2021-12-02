#!/bin/bash

function data(){

	read -p " [!] Introduce un usuario: " user

	id $user &>>logs.txt

	if [ $(echo $?) == 0 ];then
		echo -e  "\n[*] USUARIO: $(cat /etc/passwd | grep "$user" | awk '{print $1}' FS=':')"
		echo "[*] UID: $(cat /etc/passwd | grep "$user" | awk '{print $3}' FS=':')"
		echo "[*] GUID: $(cat /etc/passwd | grep "$user" | awk '{print $4}' FS=':')"
		echo -e "[+] DIRECTORIOS del usuario $user.\n"
		ls -l /home/$user 2>>logs.txt

		echo -e "\n"
	    	read -p "¿Quieres mostrar otro usuario?(Y/y | N/n) " yn 
    		case $yn in
        		[Yy]* ) clear && data; break;;
	        	[Nn]* ) exit;;
		esac

	else
		echo -e "\n[!] El usuario no existe"
		echo -e "[*] Saliendo...\n"
		exit 1
	fi

	}


while true; do
	data 
done
