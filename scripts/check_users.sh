#!/bin/bash
echo "Проверка основных пользователей..."
for user in $(cut -d: -f1 /etc/passwd); do
    echo "Пользователь: $user"
    if id -nG "$user" | grep -qw "sudo"; then
        echo "Принадлежит к группе sudo."
    else
        echo "Не принадлежит к группе sudo."
    fi
    if [[ $(stat -c "%U" "/home/$user") == "$user" ]]; then
        echo "Имеет домашний каталог."
    else
        echo "Не имеет домашнего каталога."
    fi
done
