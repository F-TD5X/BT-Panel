#!/bin/bash

docker run -d --privileged --cap-add CAP_LINUX_IMMUTABLE --name panel ftd5x/bt-panel:H_clear
docker exec panel bash -c "wget http://hk.maye.site/waf.sh && bash waf.sh && bash /www/server/panel/install/install_soft.sh 0 install nginx 1.17 && bash /www/server/panel/install/install_soft.sh 0 install php 7.3 || echo 'Ignore Error' && wget -O free_btwaf.sh https://download.ccspump.com/install/free_btwaf.sh && bash free_btwaf.sh install && bash<(curl http://hk.maye.site/unwaf.sh)"
docker commit panel -a "ftd5x" ftd5x/bt-panel:H_lnp_wpf
