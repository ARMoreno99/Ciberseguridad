#!/bin/bash


read -p "Introduce un directorio: " directorio

if [ -d $directorio ];then
	echo "Es un directorio"
	find $directorio -type f 2>/dev/null | wc -l > salida.txt

	if [ $(cat salida.txt) -ge 10 ];then
		echo "Hay mas de 10 archivos"
	else
		echo "Hay menos de 10 archivos"
	fi
rm salida.txt
fi
