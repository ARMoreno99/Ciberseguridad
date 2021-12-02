#!/bin/bash

if [ $# -ne 0 ];then

	echo "No introduccir ningun parametro:"
else

	read -p "Introduce un numero: " num1
	read -p "Introduce otro numero: " num2

cont=0

#for i in $(seq $num1 $num2)
#do
#	let cont=$i+cont

#done
#echo $cont


for (( i=$num1; i<=$num2; i++ ))
do
	let cont=$i+cont
done
echo $cont
fi

