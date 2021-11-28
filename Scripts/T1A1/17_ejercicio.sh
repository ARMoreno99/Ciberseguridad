#!/bin/bash


if [ $# == 0 ];then
	echo " [*] Example:" $0 "archivo/directorio"

elif [ -d $1 ];then

	echo "[!] SI existe el directorio."

elif [ -f $1 ];then

	echo " [*] SI existe el archivo."
else
	echo " [!] NO existe ni archivos ni directorios."
fi


