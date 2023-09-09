#!/bin/bash

# Copy the new jar to the build location
cp -f simple-java-maven-app/target/*.jar jenkins/build/

echo "****************************"
echo "** Building Docker Image ***"
echo "****************************"

cd jenkins/build/ && docker-compose -f docker-compose-build.yaml build --no-cache
