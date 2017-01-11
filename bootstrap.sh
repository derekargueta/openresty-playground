#!/usr/bin/env bash

apt-get update
apt-get upgrade -y

# system dependencies
apt-get install libreadline-dev \
                libncurses5-dev \
                libpcre3-dev \
                libssl-dev \
                perl \
                make \
                build-essential \
                 -y

##################### install OpenResty #####################

wget https://openresty.org/download/openresty-1.11.2.1.tar.gz
tar -xvf openresty-1.11.2.1.tar.gz
cd openresty-1.11.2.1/

./configure --with-pcre-jit --with-ipv6 -j2

make -j2
sudo make install

echo "export PATH=/usr/local/openresty/bin:$PATH" >> /home/ubuntu/.bashrc
echo "export PATH=/usr/local/openresty/bin:/usr/local/openresty/nginx/sbin:$PATH" >> /home/ubuntu/.bashrc

source /home/ubuntu/.bashrc

sudo service nginx start
