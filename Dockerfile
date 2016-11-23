FROM resin/rpi-raspbian:jessie

RUN apt-get update


##################################################
# Set environment variables                      #
##################################################

# Ensure UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm


##################################################
# Install tools                                  #
##################################################

RUN apt-get install -y curl wget git apt-transport-https python build-essential make g++ libavahi-compat-libdnssd-dev libkrb5-dev vim net-tools
RUN alias ll='ls -alG'

Dockerfile

##################################################
# Install homebridge                             #
##################################################

RUN npm install -g homebridge
RUN npm install -g homebridge-openhab

##################################################
# Start                                          #
##################################################

RUN mkdir -p /var/run/dbus

EXPOSE 5353 51826

ADD run.sh /root/run.sh

RUN mkdir /root/.homebridge
ADD config.json /root/.homebridge/config.json

##################################################
# Install node on pi                             #
##################################################

RUN echo "deb http://apt.adafruit.com/raspbian/ jessie main" >> /etc/apt/sources.list
RUN wget --no-check-certificate -O - -q https://apt.adafruit.com/apt.adafruit.com.gpg.key | apt-key add -
RUN apt-get update
RUN apt-get install -y node

CMD ["/root/run.sh"]