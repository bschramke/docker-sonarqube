FROM sonarqube:latest
MAINTAINER Björn Schramke <bjoern@schramke-online.com>

#ENV SONAR_PLUGINS_DIR=$SONARQUBE_HOME/extensions/plugins
ENV SONAR_PLUGINS_DIR=$SONARQUBE_HOME/lib/bundled-plugins

# install plugins
ADD     build/install_plugins.sh /dockerbuild/
RUN     /dockerbuild/install_plugins.sh
