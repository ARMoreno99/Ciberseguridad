#!/bin/bash

if [ -d $1 ];then

	echo  "[+] El directorio existe"

else

	mkdir -p $1 && echo "[*] El directorio se ha creado correctamente"

fi
