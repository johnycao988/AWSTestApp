FROM centos
MAINTAINER johnnycao@chinasystems.com
#copy jdk and tomcat into image
ARG AWS_APP_VERSION
ADD /opt/jdk1.8.0_151 /
ADD /usr/share/tomcat /
ENV ./target/aws-test-${AWS_APP_VERSION}.war /usr/share/tomcat/webapps/aws-app1.war
#set environment variable
ENV JAVA_HOME /opt/jdk1.8.0_151 
ENV PATH $JAVA_HOME/bin:$PATH
#define entry point which will be run first when the container starts up
ENTRYPOINT /usr/share/tomcat/bin/startup.sh && tail -F /usr/share/tomcat/logs/catalina.out