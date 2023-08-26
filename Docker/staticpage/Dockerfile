FROM ubuntu:20.04
LABEL Author="Nikesh"
LABEL Project="StaticPageDeployment"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt install apache2 unzip zip wget -y
CMD [ "/usr/sbin/apache2ctl","-D","FOREGROUND" ]
EXPOSE 80
WORKDIR /var/www/html
VOLUME /var/log/apache2
ADD formpack.zip /var/www/html/
RUN unzip /var/www/html/formpack.zip -d /var/www/html/
RUN mv /var/www/html/formpack/* /var/www/html/