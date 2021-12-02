#!/bin/bash

if [ $# == 1 ];then

if [ -d $1 ];then
	echo "Es un directorio"
	find $1 -type f 2>/dev/null | wc -l > salida.txt

	if [ $(cat salida.txt) -gt 10 ];then
		echo "Hay mas de 10 archivos"
	else
		echo "Hay menos de 10 archivos"
	fi
else
	echo "No es un directorio"
fi


rm salida.txt

else

	echo "Introduce solo un parametro"
fi
