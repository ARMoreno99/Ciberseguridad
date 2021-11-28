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

else
	echo -e "\n[!] El usuario no existe"
fi

}

function salida(){ 
	echo -e "\nEl usuario no esta en el sistema"
	exit 1

}

data

while true; do
    echo -e "\n"
    read -p "¿Quieres mostrar otro usuario?(Y/y | N/n) " yn
    case $yn in
        [Yy]* ) data; break;;
        [Nn]* ) exit;;
        * ) echo "Por favor, elige 'Y/y' o 'N/n'.";;
    esac
done
