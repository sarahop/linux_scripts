#!/bin/bash
if [ $# -eq 0 ]; then
	echo "Us:./ai.sh paquet1 paquet2 ..."
	exit 1
fi 
sudo apt update 
sudo apt upgrade -y 
sudo apt install -y $@
