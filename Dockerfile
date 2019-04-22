FROM centos
MAINTAINER johnnycao@chinasystems.com
#copy jdk and tomcat into image
ARG AWS_APP_VERSION
RUN mkdir -p /opt/jdk1.8.0_151
RUN mkdir -p /usr/share/tomcat
WORKDIR /
COPY /opt/jdk1.8.0_151 /opt/jdk1.8.0_151
COPY /usr/share/tomcat /usr/share/tomcat
ENV ./target/aws-test-${AWS_APP_VERSION}.war /usr/share/tomcat/webapps/awsTestApp1.war
#set environment variable
ENV JAVA_HOME /opt/jdk1.8.0_151
ENV PATH $JAVA_HOME/bin:$PATH
EXPOSE 8080
ENTRYPOINT ["/usr/share/tomcat/bin/catalina.sh","run"]