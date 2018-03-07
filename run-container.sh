#!/bin/sh

#create the volumn folder and grant proper permission
rm -rf data
mkdir data
sudo chown 1000 data

#private key for container to access host to establish host as docker slave node, make sure the key is there before running
cp docker.host.key data/docker.host.key
#jenkins settings
cp -r jenkins-settings/* data/
chown hos:hos data/jobs --recursive


docker rm ghejenkins

docker run -it \
           --name ghejenkins \
           -p 8081:8080 -p 50000:50000 \
           --env JAVA_OPTS="-Djava.util.logging.config.file=/var/jenkins_home/log.properties" \
           --env http_proxy="http://web-proxy.corp.hpecorp.net:8080" \
           --env https_proxy="http://web-proxy.corp.hpecorp.net:8080" \
           --env no_proxy="localhost,127.0.0.1,.hp.com,.hpecorp.net" \
           -v `pwd`/data:/var/jenkins_home \
           github_jenkins
