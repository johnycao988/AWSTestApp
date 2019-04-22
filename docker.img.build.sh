#! /bin/sh

export AWS_APP_VERSION="1.0"

echo "build aws test app war.."

mvn package

ls ./target/aws-test-${AWS_APP_VERSION}.war