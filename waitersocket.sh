#!/bin/bash

# Запуск сервиса в фоновом режиме
#"$@" &

# Ждем, пока сервис запустится и выдаст креденшалы
#while true; do
   # if grep "New private keys file" /var/log/i2pd/i2pd.log | grep -Eo "([a-z0-9]+).b32.i2p" | tail -n1; then
        # Креденшалы найдены, сохраняем их в файл или переменную окружения
     #   grep "New private keys file" /var/log/i2pd/i2pd.log | grep -Eo "([a-z0-9]+).b32.i2p" | tail -n1 > /etc/i2pd/NEO.txt; then
    #    export NEW=$(< /etc/i2pd/NEO.txt)
   #     break
  #  fi
 #   sleep 1
#done

# Запуск сервиса в фоновом режиме с переданными аргументами
"$@" &

# Ждем, пока сервис запустится и выдаст креденшалы
while true; do
    if credentials=$(grep "New private keys file" /var/log/i2pd/i2pd.log | grep -Eo "([a-z0-9]+).b32.i2p" | tail -n1); then
        # Креденшалы найдены, сохраняем их в файл или переменную окружения
        echo "$credentials" > /etc/i2pd/NEO.txt
        export NEW="$credentials"
        break
    fi
    sleep 1
export NEW="$credentials"
done

export NEW="$credentials"
