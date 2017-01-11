

all:
	mkdir -p logs
	PATH=/usr/local/openresty/nginx/sbin:$PATH
	export PATH
	nginx -p `pwd`/ -c conf/nginx.conf