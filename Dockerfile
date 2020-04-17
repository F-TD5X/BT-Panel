FROM ftd5x/bt-panel:clear
MAINTAINER F_TD5X
    
RUN  bash /www/server/panel/install/install_soft.sh 0 install nginx 1.17 \ 
  && wget -O free_btwaf.sh https://download.ccspump.com/install/free_btwaf.sh \ 
  && bash free_btwaf.sh install \
  && bash /www/server/panel/install/install_soft.sh 0 install php 7.3 || echo 'Ignore Error' \
  && echo '["linuxsys", "webssh", "nginx", "php-7.3"]' > /www/server/panel/config/index.json 

VOLUME ["/www","/www/wwwroot"]