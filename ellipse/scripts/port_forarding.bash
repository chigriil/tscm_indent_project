#!/bin/bash
id=$3
node=$1
port=$2


mv ~/slurm-$id.out ~/ellipse/scripts

token=$(cat slurm-$id.out | tail -n 2 | head -n 1 | sed 's/.*token=//')

echo "The token is: $token"

ssh -NL localhost:$port:localhost:$port $node

