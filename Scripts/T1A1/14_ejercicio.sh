#!/bin/bash

if [ $# == 0 ];then
	echo "NO has introduccido ningun parametro"
	exit 1
else
	echo "EL numero de parametros recibido es:" $#
	echo "Los parametros introducidos son:" $@
	exit 0
fi
