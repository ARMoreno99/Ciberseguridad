#!/bin/bash

if [ $# -ne 0 ];then

	echo "No introducir ningun parametro"
else

read -p "Introduce una fecha: " fecha

let chino=$fecha%12

if [ $chino == 0 ];then
	echo "El animal es MONO"
elif [ $chino == 1 ];then
	echo "El animal es GALLO"
elif [ $chino == 2 ];then
	echo "El animal es PERRO"
elif [ $chino == 3 ];then
	echo "El animal es CERDO"
elif [ $chino == 4 ];then
	echo "El animal es RATA"
elif [ $chino == 5 ];then
	echo "El animal es BUEY"
elif [ $chino == 6 ];then
	echo "El animal es TIGRE"
elif [ $chino == 7 ];then
	echo "El animal es CONEJO"
elif [ $chino == 8 ];then
	echo "El animal es DRAGON"
elif [ $chino == 9 ];then
	echo "El animal es SERPIENTE"
elif [ $chino == 10 ];then
	echo "El animal es CABALLO"
elif [ $chino == 11 ];then
	echo "El animal es CABRA"
else
	"No has introducido una fecha valida"
fi
fi
