#!/bin/bash

# You can run this with `screen -dm -S kick8444` forever ( or until dev fixes the blockchain )
# 
COIN_NAME="cactus";
COIN_SRC_PATH="~/Documents/cactus-blockchain"

echo Remove Chia nodes from connecting...

pushd $COIN_SRC_PATH;
. ./activate;

while true; do
for i in `$COIN_NAME show -c | grep 8444 | awk '{ print $4 }' | sed 's/\.\.\.//'`; do $COIN_NAME show -r $i;done
done