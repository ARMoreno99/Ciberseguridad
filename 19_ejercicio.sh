#!/bin/bash

if [ -d $1 ];then

	echo  "[+] El directorio existe"

else
	echo "Se ha creado el directorio:" $1

fi
