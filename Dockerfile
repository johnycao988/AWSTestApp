FROM johnnycao/tomcat-jdk8
MAINTAINER johnnycao@chinasystems.com
#copy jdk and tomcat into image
ARG AWS_APP_VERSION
ADD ./target/aws-test-${AWS_APP_VERSION}.war /usr/share/tomcat/webapps/awsTestApp1.war
#set environment variable
EXPOSE 8080
ENTRYPOINT ["/usr/share/tomcat/bin/catalina.sh","run"]