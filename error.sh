#!/bin/bash
#CARLOS MACHO RAMOS


echo "Descarreguem el fitxer error.logs:"
wget https://www.collados.org/asix2/m06/uf2/error.logs > /dev/null 2>&1

if [[ -e error.logs ]]
then
	echo "S'ha descarregat el fitxer"
else
	echo "ERROR: file not downloaded"
	exit 2
fi

echo -n "Cerca avançada del fitxer error.logs: "
echo -n "Year [YYYY]: "
read year

echo -n "Month [MM]: "
read month

month_num=$month

echo -n "DAY [DD]: "
read day



  case $month in
     01)
        month="Gen"
     ;;
     02)
        month="Feb"
     ;;
     03)
        month="Mar"
     ;;
     04)
        month="Apr"
     ;;
     05)
        month="May"
     ;;
     06)
        month="Jun"
     ;;
     07)
        month="Jul"
     ;;
     08)
        month="Aug"
     ;;
     09)
        month="Sep"
     ;;
     10)
        month="Oct"
     ;;
     11)
        month="Nov"
     ;;
     12)
        month="Dec"
     ;;
     *)
        echo "Expressió mal escrita"
        exit 3
     ;;
  esac

#echo -n $year
#echo -n $month
#echo -n $day


if [[ -e /home/FitxConfBackup ]]
then
	rm /home/FitxConfBackup/err*
	echo -n ""
	touch /home/FitxConfBackup/err$year$month_num$day.log
	echo -n  "S'ha natejat el fitxer"
else
	mkdir /home/FitxConfBackup
	echo -n ""
	touch /home/FitxConfBackup/err$year$month_num$day.log
	echo -n  "S'ha creat el fitxer"
fi


echo -n ""
grep -E "($month $day.*$year.*error)" error.logs >> /home/FitxConfBackup/err$year$month_num$day.log


exit 0
