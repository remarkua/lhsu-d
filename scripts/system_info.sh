#!/bin/bash
echo "Информация о системе:"
echo "--------------------"
echo "Имя хоста: $(hostname)"
echo "Версия ядра: $(uname -r)"
echo "Операционная система: $(lsb_release -d)"
echo "Загруженные модули ядра: $(lsmod)"
echo "Список пользователей: $(cut -d: -f1 /etc/passwd)"
