#!/bin/bash


read -p "Introduce una edad (15-60): " edad

if [ $# -ne 0 ];then

	echo "No introduccir nada"

else

let decada=$(date +%Y)-$edad

num=$(echo $decada | head -c3 |tail -c1)

	case $num in
	6)
		echo "Naciste en la decada de los 60"
	;;
	7)
		echo "Naciste en la decada de los 70"
	;;
	8)
		echo "Naciste en la decada de los 80"
	;;
	9)
		echo "Naciste en la decada de los 90"
	;;
	0)
		echo "Naciste en la decada de los 2000"
	;;
	*)
		#echo "Introduce una edad entre 15 y 60 años."
	;;
	esac

fi
