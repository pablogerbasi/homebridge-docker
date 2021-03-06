FROM resin/rpi-raspbian:jessie

RUN apt-get update
RUN apt-get clean

# Set environment variables
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

# Install tools
RUN apt-get install -y curl wget git apt-transport-https python build-essential make g++ libavahi-compat-libdnssd-dev libkrb5-dev vim net-tools


# RUN apt-get install npm

# Install homebridge
# RUN npm install -g homebridge
# RUN npm install -g homebridge-http


# Start
RUN alias ll='ls -alG'
RUN mkdir -p /var/run/dbus

EXPOSE 5353 51826

# ADD run.sh /root/run.sh

RUN mkdir /root/.homebridge
ADD config.json /root/.homebridge/config.json

# Install node and etc. on pi
# RUN apt-get install -y node
RUN apt-get install avahi-daemon avahi-discover libnss-mdns libavahi-compat-libdnssd-dev

# CMD ["/root/run.sh"]
