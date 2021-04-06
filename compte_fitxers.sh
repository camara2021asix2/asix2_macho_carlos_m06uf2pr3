#!/bin/bash
comptador()
{
	local ncompt
	local fitxer
	
	ncompt=0
	for fitxer in $1/*
	do
		if [[ -s $fitxer ]] &&  [[ -x $fitxer ]]  
		then                                      
			(( ncompt++ ))	
		fi
	done
	echo "Número d' arxius: $ncompt"
}



clear
echo -n "Indica el PATH del directori a revisar: "
read directori
comptador $directori
exit 0
