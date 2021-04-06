#!/bin/bash
#CARLOS MACHO RAMOS
#   '^(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'
regex='(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'


echo -n "Ingresa la URL a comprovar: "
read URL

if [[ $URL =~ $regex ]] 
then
    echo "Link valid, opening Firefox."
    echo $URL
    firefox -new-tab "$URL"
else
    echo "Link not valid, please check the URL is written correctly."
    exit 1
fi

exit 0
