FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Expose necessary ports
EXPOSE 4444 4447 7070 9439 7656 5269 5222

# Install i2pd dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends software-properties-common \
    && add-apt-repository ppa:purplei2p/i2pd \
    && apt-get update \
    && apt-get -y install  nano lsb-release wget apt-transport-https ca-certificates curl htop prosody nginx lua-bit32 i2pd\
    && rm -rf /var/lib/apt/lists/*
#RUN cd /tmp && wget https://github.com/PurpleI2P/i2pd/releases/download/2.48.0/i2pd_2.48.0-1focal1_amd64.deb
#RUN dpkg -i /tmp/i2pd_2.48.0-1focal1_amd64.deb || true
#RUN rm /tmp/i2pd_2.48.0-1focal1_amd64.deb
# Make i2pd user accessible
#RUN usermod -s /bin/bash i2pd

# Copy i2pd configuration files
COPY mod_darknet.lua /usr/lib/prosody/modules/mod_darknet.lua
COPY tunnels.conf /etc/i2pd/tunnels.conf
COPY i2pd.conf /etc/i2pd/i2pd.conf
COPY waitersocket.sh /etc/i2pd/waitersocket.sh
COPY NEO.txt /etc/i2pd/NEO.txt
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
COPY phonker.sh /etc/i2pd/phonker.sh
COPY ssler.sh /etc/i2pd/ssler.sh

RUN chmod +x /usr/local/bin/entrypoint.sh
RUN chmod +x /etc/i2pd/waitersocket.sh && chmod +x /etc/i2pd/NEO.txt
RUN chmod +x /etc/i2pd/phonker.sh
#VOLUME ["/etc/i2pd"]


ENTRYPOINT ["/etc/i2pd/phonker.sh"]
COPY prosody.cfg.lua /etc/prosody/prosody.cfg.lua
