#!/bin/bash

# Функция для вывода списка доступных скриптов
list_scripts() {
    scripts=$(ls scripts/*.sh)
    for script in $scripts; do
        echo "$(basename $script .sh)"
    done
}

# Функция для запуска выбранного скрипта
run_script() {
    script_name=$1
    script_path="scripts/$script_name.sh"
    if [ -f "$script_path" ]; then
        echo "Запускаю скрипт $script_name..."
        bash "$script_path"
    else
        echo "Скрипт $script_name не найден."
    fi
}

# Главная часть скрипта
echo "Доступные скрипты:"
echo "------------------"
list_scripts
echo "------------------"

read -p "Введите название скрипта для запуска: " script_name
run_script "$script_name"
