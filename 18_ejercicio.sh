#!/bin/bash


if [ $# == 0 ];then
	echo " [*] Example:" $0 "archivo/directorio"

elif [ -d $1 ];then

	echo "[+] Es un directorio."

elif [ -f $1 ];then

	echo "[*] Es un archivo"
else
	echo "[!] NO existe"
fi


