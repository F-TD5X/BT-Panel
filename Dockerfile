FROM ftd5x/bt-panel:clear
MAINTAINER F_TD5X
    
RUN  bash /www/server/panel/install/install_soft.sh 0 install nginx 1.17 \
  && bash /www/server/panel/install/install_soft.sh 0 install php 7.3 || echo 'Ignore Error' \
  && echo '["linuxsys", "webssh", "nginx", "php-7.3"]' > /www/server/panel/config/index.json 

VOLUME ["/www","/www/wwwroot"]
