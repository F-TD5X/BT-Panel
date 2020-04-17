FROM centos:7
MAINTAINER F_TD5X

COPY entrypoint.sh /entrypoint.sh

RUN mkdir -p /www/letsencrypt \
    && ln -s /www/letsencrypt /etc/letsencrypt \
    && rm -f /etc/init.d \
    && mkdir /www/init.d \
    && ln -s /www/init.d /etc/init.d \
    && chmod +x /entrypoint.sh \
    && mkdir /www/wwwroot \
    # Install BT-Panel
    && cd /home \
    && yum -y update \
    && yum -y install wget openssh-server e2fsprogs \
    && wget -O install.sh https://download.ccspump.com/install/install_6.0.sh \
    && echo y | bash install.sh \
    && echo '["linuxsys", "webssh"]' > /www/server/panel/config/index.json \
    && yum clean all

WORKDIR /www/wwwroot
CMD /entrypoint.sh
EXPOSE 20 21 25 80 110 143 443 465 993 995 888 8888
# FTP: 20 21 
# SSH: 22
# Email: 25 110 143 465 993 995
# BT-Panel: 888 8888

HEALTHCHECK --interval=5s --timeout=3s CMD curl -fs http://localhost:8888/ && curl -fs http://localhost/ || exit 1 