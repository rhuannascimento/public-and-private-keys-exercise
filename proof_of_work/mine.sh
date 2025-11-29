#!/bin/bash

arquivo=$1
zeros=$2

if [ -z "$arquivo" ] || [ -z "$zeros" ]; then
    echo "Uso: ./mine.sh arquivo numero_de_zeros"
    exit 1
fi

prefix=$(printf "%0.s0" $(seq 1 $zeros))
nonce=0

while true; do
    echo -n "$nonce" > nonce.tmp
    cat "$arquivo" nonce.tmp > bloco.tmp

    hash=$(sha256sum bloco.tmp | awk '{print $1}')

    if [[ $hash == $prefix* ]]; then
        echo "Encontrado!"
        echo "Nonce: $nonce"
        echo "Hash:  $hash"
        break
    fi

    nonce=$((nonce+1))
done
