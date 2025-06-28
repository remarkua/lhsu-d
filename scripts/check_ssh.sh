#!/bin/bash
echo "Проверка состояния разрешения root SSH..."
if grep -q "PermitRootLogin yes" /etc/ssh/sshd_config; then
 echo "Разрешение root SSH разрешено."
 echo "Хотите запретить? (y/n)"
 read answer
 if "$answer" == "y"; then
 sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
 systemctl restart sshd
 echo "Разрешение root SSH было запрещено."
 else
 echo "Изменение разрешения root SSH отменено."
 fi
else
 echo "Разрешение root SSH запрещено."
 echo "Хотите разрешить? (y/n)"
 read answer
 if "$answer" == "y"; then
 sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config
 systemctl restart sshd
 echo "Разрешение root SSH было разрешено."
 else
 echo "Изменение разрешения root SSH отменено."
 fi
fi

