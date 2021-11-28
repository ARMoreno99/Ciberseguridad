#!/bin/bash


read -p "Introduce un mes: " mes


if [ $mes == "Enero" ] || [ $mes == "Marzo" ] || [ $mes == "Mayo" ] || [ $mes == "Julio" ] || [ $mes == "Agosto" ] || [ $mes == "Octubre" ] || [ $mes == "Diciembre" ];then

	echo "$mes tiene 31 dias"

elif [ $mes == "Abril" ] || [ $mes == "Junio" ] || [ $mes == "Septiembre" ] || [ $mes == "Noviembre" ];then

	echo "$mes tiene 30 dias"

elif [ $mes == "Febrero" ];then
	echo "$mes tiene 28 dias"

else

	echo "No has introducido un mes correcto"
fi
