#!/bin/bash

# Запуск сервиса i2pd в фоновом режиме
/usr/sbin/i2pd --conf /etc/i2pd/i2pd.conf --tunconf /etc/i2pd/tunnels.conf &

# Ожидание 5 секунд
sleep 5 &

# Запуск скрипта ожидания и сохранения креденшалов
./etc/i2pd/wait_for_key.sh
