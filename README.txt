We will deploy the jenkins environment.

Install:
- create the neccessary path: /srv/jenkins/data . The jenkins will contain the data here.
- create the necessary certificate keystore for https communication: for example:
 change the YourUniquePassword string to your password:
 keytool -genkey -keyalg RSA -alias awx-v9-pilot-jenkins -keystore jenkins_keystore.jks -storepass YourUniquePassword -keysize 4096 
 ps: You must intstall the necessary package, using this command: sudo yum install java-1.7.0-openjdk
- run the script: jenkins-ssl.sh and use the password that you set up in the previous step
- visit the jenkins UI: using the host IP where container is running, for example: if the host IP is 192.168.0.100, https://192.168.0.100/login
- you can use the default password here: /srv/jenkins/data/secrets/initialAdminPassword

If the container doesn't start, check the log: docker logs jenkins
