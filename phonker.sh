#!/bin/sh

# Execute the first command in the background
/usr/sbin/i2pd --conf /etc/i2pd/i2pd.conf --tunconf /etc/i2pd/tunnels.conf "$@" &

# Wait for 5 seconds
sleep 5

# Execute the second command
./etc/i2pd/waitersocket.sh
sleep 5

DNS=$(cat /etc/i2pd/NEO.txt)
sed -i "s/XXX/$DNS/g" /etc/prosody/prosody.cfg.lua
sed -i "s/XXX/$DNS/g" /etc/i2pd/ssler.sh
./etc/i2pd/ssler.sh
sleep 5000
