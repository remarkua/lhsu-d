#!/bin/bash
sudo apt update
echo "Хотите установить обновления? (y/n)"
read answer
if "$answer" == "y" ; then
 sudo apt upgrade -y
fi

