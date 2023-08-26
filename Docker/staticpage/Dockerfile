FROM ubuntu:20.04
LABEL Author="Nikesh"
LABEL Project="StaticPageDeployment"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-install apache2 unzip zip wget -y
CMD [ "/usr/sbin/apache2","-D","FOREGROUND" ]
EXPOSE 80
WORKDIR /var/www/html
VOLUME /var/log/apache2
ADD /opt/docker/formpack.zip /var/www/html/