#!/bin/sh
echo Creating Image
cd nexus-blobstore-google-cloud
docker build -t nexus-osama:0.1 .
docker tag nexus-osama:0.1 gcr.io/nexuskubernetes/nexus-osama:0.1
docker push gcr.io/nexuskubernetes/nexus-osama:0.1
