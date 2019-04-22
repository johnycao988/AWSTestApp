FROM centos
MAINTAINER johnnycao@chinasystems.com
#copy jdk and tomcat into image
ARG AWS_APP_VERSION
WORKDIR /
RUN mkdir jdk
RUN mkdir tomcat
ADD /opt/jdk1.8.0_151 /jdk
ADD /usr/share/tomcat /tomcat
ENV ./target/aws-test-${AWS_APP_VERSION}.war /usr/share/tomcat/webapps/awsTestApp1.war
#set environment variable
ENV JAVA_HOME /jdk 
ENV PATH $JAVA_HOME/bin:$PATH
#define entry point which will be run first when the container starts up
ENTRYPOINT /tomcat/bin/startup.sh && tail -F /tomcat/logs/catalina.out