#!/bin/bash

if [ $# == 0 ];then
	echo "NO has introduccido ningun parametro"
else
	echo "EL numero de parametros recibido es:" $#
	echo "Los parametros introducidos son:" $@
fi
