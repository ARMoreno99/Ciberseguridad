#!/bin/bash

IFS=' '


if [ $# -lt 1 ]; then
	echo "No has pasado los suficientes parametros."
else
	echo "$*"
fi

