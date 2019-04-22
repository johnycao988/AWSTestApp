#! /bin/sh

export AWS_APP_VERSION="1.0"

echo "build aws test app war.."

mvn package

docker build --build-arg AWS_APP_VERSION=${AWS_APP_VERSION}  -t docker.registry.cscloud.com/aws/test/app1:${AWS_APP_VERSION} .

docker push docker.registry.cscloud.com/aws/test/app1:${AWS_APP_VERSION}