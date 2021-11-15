#!/bin/bash

#echo $@ | tr ' ' '-'

IFS='-'
echo "$*"

