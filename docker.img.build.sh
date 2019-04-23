#! /bin/sh

export AWS_APP_VERSION="1.0"

echo "build aws test app war.."

mvn package

docker build --build-arg AWS_APP_VERSION=${AWS_APP_VERSION}  -t johnnycao/aws-test-app1:${AWS_APP_VERSION} .

docker push johnnycao/aws-test-app1:${AWS_APP_VERSION}

#docker run -d -p 8087:8080 --name aws-test-app1 --restart=always johnnycao/aws-test-app1:1.0