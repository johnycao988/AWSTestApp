FROM johnnycao/tomcat-jdk8:2.0
MAINTAINER johnnycao@chinasystems.com
#copy jdk and tomcat into image
ARG AWS_APP_VERSION
ADD ./target/aws-test-${AWS_APP_VERSION}.war /usr/share/tomcat/webapps/awsTestApp1.war
#set environment variable
ENV JAVA_HOME /opt/jdk1.8.0_151
ENV PATH $JAVA_HOME/bin:$PATH
EXPOSE 8080
ENTRYPOINT ["/usr/share/tomcat/bin/catalina.sh","run"]