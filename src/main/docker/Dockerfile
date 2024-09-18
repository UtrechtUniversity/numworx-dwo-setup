FROM tomcat:9.0-jdk11
MAINTAINER Wim van Velthoven
EXPOSE 80 8009
VOLUME /usr/local/tomcat/logs
RUN rm -rf /usr/local/tomcat/webapps/*
ADD setenv.sh /usr/local/tomcat/bin/setenv.sh
ADD server.xml /usr/local/tomcat/conf/server.xml
ADD web.xml /usr/local/tomcat/conf/web.xml
#Remove version string from HTTP error messages
#override ServerInfo.properties in catalina.jar
RUN mkdir -p /usr/local/tomcat/lib/org/apache/catalina/util
ADD ServerInfo.properties /usr/local/tomcat/lib/org/apache/catalina/util/ServerInfo.properties

ENV CATALINA_OPTS="-Xms768m -Xmx768m"

ENV DWO_ENV=app \
    CDN_HOST=cdn.dwo.nl \
    CDNURL=https://cdn.dwo.nl \
    DWO_REDIRECT=false \
    DWO_ELB=none \
    PROFILE_EXTENSION=

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
	ENV_ORGID=385 \
	UU_DESCRIPTION_TEMPLATE=168946 \
	ALLOW_ORIGIN=* \
	SEB_TOETS_MAC= \
	SEB_TOETS_WIN= \
	S3_BUCKET=cds-dev-dwo-nl \
	REDIS=redis:6379 \
	REDISS=redis \
	REDIS_PREFIX=
    
VOLUME /usr/local/tomcat/webapps
ADD maven/*.war /usr/local/tomcat/webapps/
ADD maven/*.jar /usr/local/tomcat/lib/
ADD context.xml /usr/local/tomcat/conf/
ADD logging.properties /usr/local/tomcat/conf/
ADD redisson.yaml /usr/local/tomcat/conf/
