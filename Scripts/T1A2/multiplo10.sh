#!/bin/bash

read -p "Introduce un numero: " numero

let op=$numero%10

if [ $op == 0 ];then
	echo "El $numero es multiplo."
else
	echo "El $numero no es multiplo."
fi
