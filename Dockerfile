# A basic Apache Tomcat server to showcase the CI/CD flow using Jenkins/Docker
# Based on http://developers.redhat.com/blog/2014/05/05/running-systemd-within-docker-container/ to circumvent the SystemD inside Docker known issue
FROM 172.17.0.2:5000/centos_systemd:latest
MAINTAINER Subodh Pachghare version: 0.1 <subodh.cyber@gmail.com>

RUN yum install -y tomcat tomcat-webapps tomcat-admin-webapps wget
RUN systemctl enable tomcat
RUN cd /usr/share/tomcat/webapps && wget https://tomcat.apache.org/tomcat-6.0-doc/appdev/sample/sample.war
EXPOSE 8080
CMD ["/usr/sbin/init"]
