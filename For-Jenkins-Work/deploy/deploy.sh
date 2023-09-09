#!/bin/bash

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp -i ../../../prod /tmp/.auth adil@192.168.1.15:/tmp/.auth
scp -i prod ./jenkins/deploy/publish adil@192.168.1.15:/tmp/publish
ssh -i prod adil@192.168.1.15 "/tmp/publish"
