#!/bin/bash

function suma(){
	read -p "Introduce un valor: " valor1
	read -p "Introduce otro valor: " valor2

	let total=$valor1+$valor2

	echo -e "\nEl resultado es $total\n"

}

function resta(){
        read -p "Introduce un valor: " valor1
        read -p "Introduce otro valor: " valor2

	        let total=$valor1-$valor2

        	echo -e "\nEl resultado es $total\n"
}

function multiplicacion(){
        read -p "Introduce un valor: " valor1
        read -p "Introduce otro valor: " valor2

        let total=$valor1\*$valor2

        echo -e "\nEl resultado es $total\n"

}

function division(){

        read -p "Introduce un valor: " valor1
        read -p "Introduce otro valor: " valor2
if [ $valor2 == 0 ];then

	echo "No dividir entre 0"
else
        let total=$valor1/$valor2

        echo -e "\nEl resultado es $total\n"
fi
}

function menu(){


echo -e "\n~~ CALCULADORA EN BASH ~~\n"

echo "[*] 1) SUMA"
echo "[*] 2) RESTA"
echo "[*] 3) MULTIPLICACION"
echo "[*] 4) DIVISION"
echo -e "[*] 5) SALIDA\n"

read -p "Selecciona: " expresion

    case $expresion in
      1)
	echo -e "\n"
	suma
      ;;
      2)
        echo -e "\n"
	resta
      ;;
      3)
	echo -e "\n"
	multiplicacion
      ;;
      4)
	echo -e "\n"
	division
      ;;
      5)
        echo -e "\n[!] Saliendo de la calculadora...\n"
	exit 0
      ;;
      *)
	menu
    esac
}

if [ $# -ne 0 ];then

	echo "No introducir ningun parametro"
else

menu
while true; do
	menu
done
fi
