#!/bin/bash

# Функция для вывода списка доступных скриптов с номерами
list_scripts() {
    scripts=($(ls scripts/*.sh))
    for i in "${!scripts[@]}"; do
        echo "$((i + 1)). $(basename ${scripts[$i]})"
    done
}

# Функция для запуска выбранного скрипта
run_script() {
    script_name=$1
    script_path="scripts/$script_name.sh"
    if [[ -f "$script_path" ]]; then
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

read -p "Введите номер скрипта для запуска: " script_number

# Проверка корректности ввода
if [[ $script_number =~ ^[0-9]+$ ]] && ((script_number >= 1)) && ((script_number <= ${#scripts[@]})); then
    script_name=$(basename "${scripts[$((script_number - 1))]}" .sh)
    run_script "$script_name"
else
    echo "Некорректный номер скрипта."
fi
