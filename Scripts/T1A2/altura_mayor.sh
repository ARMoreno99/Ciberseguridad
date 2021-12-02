#!/bin/bash

read -p "Introduce la primera altura(cm): " primero
read -p "Introduce la segunda altura(cm): " segundo
read -p "Introduce la tercera altura(cm): " tercero

let T1=$primero/100
let T2=$primero%100

let T3=$segundo/100
let T4=$segundo%100

let T5=$tercero/100
let T6=$tercero%100



if [ $primero -gt $segundo ] && [ $primero -gt $tercero ];then
	echo  "La primera altura $T1.$T2 m es mayor que el resto." 
elif [ $segundo -gt $primero ] && [ $segundo -gt $tercero ];then
	echo "La segunda altura $T3.$T4 m es mayor que el resto."
else 
	echo "La tercera altura $T5.$T6 m es mayor que el resto."
fi




