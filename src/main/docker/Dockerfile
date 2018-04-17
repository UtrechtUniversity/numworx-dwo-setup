FROM tomcat:8.0-jre8
MAINTAINER Wim van Velthoven
EXPOSE 8080
VOLUME /usr/local/tomcat/logs
#RUN rm -rf /usr/local/tomcat/webapps/*
ADD setenv.sh /usr/local/tomcat/bin/setenv.sh
ADD server.xml /usr/local/tomcat/conf/server.xml

ENV DWO_ENV=app \
    CDN_HOST=cdn.dwo.nl \
    CDNURL=https://cdn.dwo.nl

ENV RDS_DB_NAME=dwo_productie \
    RDS_HOSTNAME=mysql \
    RDS_PASSWORD=test \
    RDS_PORT=3306 \
    RDS_USERNAME=root

ENV SMTP_AUTH=false \
    SMTP_EMAIL=wisweb@fi.uu.nl \
    SMTP_PASSWORD=none \
    SMTP_PORT=25 \
    SMTP_SERVER=smtp \
    SMTP_TLS=no \
    SMTP_USER=root
VOLUME /usr/local/tomcat/webapps
#ADD *.war /usr/local/tomcat/webapps/
