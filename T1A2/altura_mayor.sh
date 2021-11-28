#!/bin/bash

read -p "Introduce la primera altura(cm): " primero
read -p "Introduce la segunda altura(cm): " segundo
read -p "Introduce la tercera altura(cm): " tercero

let T1=$primero/100


if [ $primero -gt $segundo ] && [ $primero -gt $tercero ];then
	echo  "La primera altura ($T1) es mayor que el resto." 
elif [ $segundo -gt $primero ] && [ $segundo -gt $tercero ];then
	echo "La segunda altura ($segundo) es mayor que el resto."
else 
	echo "La tercera altura ($tercero) es mayor que el resto."
fi




