#!/bin/bash
PAQUETS="vim git curl"
sudo apt update 
sudo apt upgrade -y
sudo apt install -y  $PAQUETS
