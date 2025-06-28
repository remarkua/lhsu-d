#!/bin/bash
echo "Проверка обновлений..."
apt update
echo "Хотите установить обновления? (y/n)"
read answer
if [ "$answer" == "y" ]; then
    apt upgrade -y
fi
