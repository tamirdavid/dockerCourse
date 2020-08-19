FROM centos

#Local Vars for downloads - IUS repo + php packages
ENV IUS=https://repo.ius.io/ius-release-el7.rpm \
    EPEL=https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    PHP_COMMON=https://dl.iuscommunity.org/pub/ius/stable/CentOS/7/x86_64/php71u-common-7.1.28-1.ius.centos7.x86_64.rpm\
    PHP_CLI=https://dl.iuscommunity.org/pub/ius/stable/CentOS/7/x86_64/php71u-cli-7.1.28-1.ius.centos7.x86_64.rpm \ 
    PHP_FPM=https://dl.iuscommunity.org/pub/ius/stable/CentOS/7/x86_64/php71u-fpm-7.1.28-1.ius.centos7.x86_64.rpm 

#Make nginx.repo configuration you can find it here - https://www.cyberciti.biz/faq/how-to-install-and-use-nginx-on-centos-7-rhel-7/ and then copy it 
#to image
COPY conf/nginx.repo /etc/yum.repos.d/nginx.repo

#Install nginx and IUS and php packages
RUN \
   yum install -y nginx && \
   yum install -y $IUS $EPEL &&\
   yum install -y &PHP_COMMON \ 
   &PHP_CLI \
   &PHP_FPM \
   --enablerepo=ius && \
   yum clean all

#Make dir that going to use as root directory
RUN mkdir /nginx_php

#Copy nginx conf file that I make include root dir location logs locations and more
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

#Copy local script that run php and nginx services
COPY conf/servicesrun.sh /start.sh

#Give executable permissions to the file I copied
RUN chmod +x /start.sh

#Run the script
CMD /start.sh
