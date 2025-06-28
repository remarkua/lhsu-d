#!/bin/bash
echo "Проверка основных пользователей..."
for user in $(cut -d: -f1 /etc/passwd); do
    home_dir=$(getent passwd "$user" | cut -d: -f6)
    password=$(getent passwd "$user" | cut -d: -f2)
    groups=$(id -Gn "$user")

    if [[ "$user" == "root" || "$home_dir" == /home/* ]]; then
        echo "Пользователь: $user"
        echo "Принадлежит к группам: $groups"
        echo "Домашний каталог: $home_dir"
        if [[ "$password" == "x" ]]; then
            echo "Наличие пароля: Да"
        else
            echo "Наличие пароля: Нет"
        fi
        echo ""
    fi
done

