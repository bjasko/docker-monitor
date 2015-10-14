#!/bin/sh

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

VOLUME_BASE=/data/monitor
S_HOST=monitor
S_DEV=eth0
S_DOMAIN=bring.out.ba
S_HOST_IP=${smtp_ip:-192.168.168.46}
S_DNS_HOST_IP=${dns_lan_ip:-192.168.45.7}


sudo ip addr show | grep $S_HOST_IP || \
  sudo ip addr add $S_HOST_IP/24 dev $S_DEV

docker rm -f $S_HOST.$S_DOMAIN

     
docker run -d \
     -v $VOLUME_BASE/$S_HOST.$S_DOMAIN/ruby:/root/ruby \
     -v $VOLUME_BASE/$S_HOST.$S_DOMAIN/log:/var/log \
     --name $S_HOST.$S_DOMAIN \
     --hostname $S_HOST.$S_DOMAIN \
     --dns $S_DNS_HOST_IP \
     -p $S_HOST_IP:9010:9010  \
     monitor
