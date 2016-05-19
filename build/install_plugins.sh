#!/bin/bash
install_sonar_plugin() {
    SONARSOURCE_BINTRAY_URL="https://sonarsource.bintray.com/Distribution"
    
    if [[ $# > 2 ]] ; then
        echo "Try to install $1:$2 from $3"
        curl --create-dirs -sLo ${SONAR_PLUGINS_DIR}/$1-$2.jar $3
    else
        echo "Try to install $1:$2 from $SONARSOURCE_BINTRAY_URL/$1/$1-$2.jar"
        curl --create-dirs -sLo ${SONAR_PLUGINS_DIR}/$1-$2.jar ${SONARSOURCE_BINTRAY_URL}/$1/$1-$2.jar
    fi
}

# remove bundled plugins
ls -la $SONARQUBE_HOME/lib/bundled-plugins
rm -rf $SONARQUBE_HOME/lib/bundled-plugins/sonar-*-plugin-*.jar

#SCM plugins
install_sonar_plugin sonar-scm-git-plugin 1.2 
install_sonar_plugin sonar-github-plugin 1.2 
install_sonar_plugin sonar-stash-plugin 1.1.0 https://github.com/AmadeusITGroup/sonar-stash/releases/download/1.1.0/sonar-stash-plugin-1.1.0.jar 

#Language plugins
install_sonar_plugin sonar-java-plugin 3.13.1
install_sonar_plugin sonar-csharp-plugin 5.2
install_sonar_plugin sonar-groovy-plugin 1.3.1
install_sonar_plugin sonar-php-plugin 2.8
install_sonar_plugin sonar-javascript-plugin 2.12
install_sonar_plugin sonar-web-plugin 2.4
#install_sonar_plugin sonar-xml-plugin 2.4
install_sonar_plugin sonar-python-plugin 1.5 http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/python/sonar-python-plugin/1.5/sonar-python-plugin-1.5.jar
install_sonar_plugin sonar-android-plugin 1.1 http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/android/sonar-android-plugin/1.1/sonar-android-plugin-1.1.jar
install_sonar_plugin sonar-json-plugin 1.4 https://github.com/racodond/sonar-json-plugin/releases/download/1.4/sonar-json-plugin-1.4.jar

#Metric plugins
install_sonar_plugin sonar-findbugs-plugin 3.3
install_sonar_plugin sonar-checkstyle-plugin 2.4
install_sonar_plugin sonar-pmd-plugin 2.5
install_sonar_plugin sonar-generic-coverage 1.2 https://sonarsource.bintray.com/Distribution/sonar-generic-coverage/sonar-generic-coverage-plugin-1.2.jar
install_sonar_plugin qualinsight-plugins-sonarqube-smell 3.0.0 https://github.com/QualInsight/qualinsight-plugins-sonarqube-smell/releases/download/qualinsight-plugins-sonarqube-smell-3.0.0/qualinsight-plugins-sonarqube-smell-plugin-3.0.0.jar

#other plugins
#install_sonar_plugin sonar-jira-plugin 1.2 http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-jira-plugin/1.2/sonar-jira-plugin-1.2.jar
install_sonar_plugin qualinsight-plugins-sonarqube-badges 2.0.1 https://github.com/QualInsight/qualinsight-plugins-sonarqube-badges/releases/download/qualinsight-plugins-sonarqube-badges-2.0.1/qualinsight-sonarqube-badges-2.0.1.jar
install_sonar_plugin sonar-build-breaker 2.1 https://github.com/SonarQubeCommunity/sonar-build-breaker/releases/download/2.1/sonar-build-breaker-plugin-2.1.jar

ls -la  ${SONAR_PLUGINS_DIR}
