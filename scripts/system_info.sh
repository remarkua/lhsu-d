#!/bin/bash
echo "Информация о системе:"
echo "--------------------"
echo "Имя хоста: $(hostname)"
echo "Версия ядра: $(uname -r)"
echo "Операционная система:"
cat /etc/os-release | grep -E 'NAME|VERSION'

