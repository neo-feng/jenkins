FROM jenkins:2.46.2
#COPY plugins.txt /usr/share/jenkins/ref/
#RUN /usr/local/bin/install-plugins.sh ldap:1.11
ENV http_proxy=http://proxy.houston.hpecorp.net:8080 https_proxy=http://proxy.houston.hpecorp.net:8080
COPY plugins.txt /usr/share/jenkins/plugins.txt
#COPY plugins.sh /usr/local/bin/plugins.sh
#USER root
#RUN chmod +x /usr/local/bin/plugins.sh
#USER jenkins
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
#COPY proxy.xml /usr/share/jenkins/proxy.xml
#RUN cp /usr/share/jenkins/proxy.xml /var/jenkins_home/proxy.xml
#COPY credentials.xml /usr/share/jenkins/credentials.xml
#RUN cp /usr/share/jenkins/credentials.xml /var/jenkins_home/credentials.xml

