#!/bin/bash
docker network create jenkins

read -s -p "Keystore Password:" password
echo
sudo cp jenkins_keystore.jks /srv/jenkins/data
docker run -d -v /srv/jenkins/data:/var/jenkins_home -p 50000:50000 -p 443:8443 --name jenkins --env JAVA_OPTS="-Djava.util.logging.config.file=/var/jenkins_home/log.properties" --network jenkins --network-alias jenkins-docker jenkins/jenkins:2.222.4 --httpPort=-1 --httpsPort=8443 --httpsKeyStore=/var/jenkins_home/jenkins_keystore.jks --httpsKeyStorePassword=$password
