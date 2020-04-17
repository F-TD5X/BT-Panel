FROM ftd5x/bt-panel:clear
MAINTAINER F_TD5X
    
RUN  chattr -i /www/server/panel/install/check.sh \
  && chattr -i /www/server/panel/install/public.sh \
  && wget -O waf.sh https://download.ccspump.com/install/waf.sh && bash waf.sh \
  && bash /www/server/panel/install/install_soft.sh 0 install nginx 1.17 \
  && wget -O waf.sh https://download.ccspump.com/install/waf.sh && bash waf.sh \ 
  && bash /www/server/panel/install/install_soft.sh 0 install php 7.3 || echo 'Ignore Error' \
  && wget -O waf.sh https://download.ccspump.com/install/waf.sh && bash waf.sh \
  && echo '["linuxsys", "webssh", "nginx", "php-7.3"]' > /www/server/panel/config/index.json 

VOLUME ["/www","/www/wwwroot"]