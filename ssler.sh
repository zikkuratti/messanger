#!/bin/bash

openssl genrsa -out /etc/prosody/certs/XXX.key 2048
openssl req -new -x509 -key /etc/prosody/certs/XXX.key -out /etc/prosody/certs/XXX.crt -days 3650
chown root:prosody /etc/prosody/certs/XXX.{key,crt}
chmod 640 /etc/prosody/certs/XXX.{key,crt}
#prosodyctl adduser admin@XXX
#prosodyctl adduser client@XXX
prosodyctl register admin XXX 1
prosodyctl register client XXX 1
