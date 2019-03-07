FROM tomcat:8.5-jre8
MAINTAINER Wim van Velthoven
EXPOSE 80 8009
VOLUME /usr/local/tomcat/logs
RUN rm -rf /usr/local/tomcat/webapps/*
ADD setenv.sh /usr/local/tomcat/bin/setenv.sh
ADD server.xml /usr/local/tomcat/conf/server.xml

ENV CATALINA_OPTS="-Xms512m -Xmx768m"

ENV DWO_ENV=app \
    CDN_HOST=cdn.dwo.nl \
    CDNURL=https://cdn.dwo.nl \
    DWO_REDIRECT=true \
    DWO_ELB=none

ENV RDS_DB_NAME=dwo_productie \
    RDS_HOSTNAME=mysql \
    RDS_PASSWORD=test \
    RDS_PORT=3306 \
    RDS_USERNAME=root

ENV SMTP_AUTH=false \
    SMTP_EMAIL=fi.wisweb-l@lists.science.uu.nl \
    SMTP_PASSWORD=none \
    SMTP_PORT=25 \
    SMTP_SERVER=smtp \
    SMTP_TLS=no \
    SMTP_SSL=false \
    SMTP_USER=root
    
ENV ENV_IPRANGE= \
	ENV_NOSEB=false \
	ENV_ORGID=385 
    
VOLUME /usr/local/tomcat/webapps
ADD maven/*.war /usr/local/tomcat/webapps/
