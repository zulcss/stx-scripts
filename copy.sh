#!/bin/bash
# Copy scripts to the container

pod=`kubectl get pods | grep "stx-builder" | awk '{print $1}'`
kubectl cp init-build.sh $pod:/tmp/init-build.sh
