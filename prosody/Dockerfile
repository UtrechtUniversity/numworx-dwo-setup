FROM prosodyim/prosody:13.0
RUN apt-get update -qq  && apt-get install -qy mercurial
RUN hg clone https://hg.prosody.im/prosody-modules/ /usr/lib/prosody/modules-extra
ENV PROSODY_PLUGIN_PATHS=/etc/prosody/modules,/usr/lib/prosody/modules-extra
ENV PROSODY_ENABLE_MODULES=sasl_oauthbearer,http,bosh,websocket,conversejs,admin_shell
ENV PROSODY_ARCHIVE_EXPIRY_DAYS=70
# override these
ENV PROSODY_VIRTUAL_HOSTS=localhost,chat.numworx
ENV PROSODY_ADMINS=admin@localhost
COPY conf.d/* /etc/prosody/conf.d/
