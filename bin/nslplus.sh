#!/bin/bash
# Lookup a domain's name servers across major providers

if [ $# -eq 0 ]; then
    echo "No domain supplied."
    exit 1
fi

DOMAIN=$1

VERIZON=4.2.2.1
GOOGLE=8.8.8.8
OPENDNS=208.67.222.222

PROVIDERS=( $VERIZON $GOOGLE $OPENDNS )

for ((i=0; i < ${#PROVIDERS[@]}; i++))
do
    dig @${PROVIDERS[$i]} +short SOA $DOMAIN | cut -d ' ' -f1 | xargs -n 1 -I {} echo ${PROVIDERS[$i]}: {}
done
