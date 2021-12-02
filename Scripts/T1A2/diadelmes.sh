#!/bin/bash

if [ $# -ne 0 ];then

	echo "No introduccir ningun parametro"
else

read -p "Introduce un mes: " mes


if [ $mes == "Enero" ] || [ $mes == "Marzo" ] || [ $mes == "Mayo" ] || [ $mes == "Julio" ] || [ $mes == "Agosto" ] || [ $mes == "Octubre" ] || [ $mes == "Diciembre" ];then

	echo "$mes tiene 31 dias"
	echo "Estamos en $mes,un mes con 31 días"

elif [ $mes == "Abril" ] || [ $mes == "Junio" ] || [ $mes == "Septiembre" ] || [ $mes == "Noviembre" ];then

	echo "$mes tiene 30 dias"
	echo "Estamos en $mes,un mes con 30 días"

elif [ $mes == "Febrero" ];then
	echo "$mes tiene 28 dias"
	echo "Estamos en $mes,un mes con 28 días"

else

	echo "No has introducido un mes correcto"
fi

fi
