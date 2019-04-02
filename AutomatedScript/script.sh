#!/bin/sh
echo Creating Image
cd nexus-blobstore-google-cloud
docker build -t nexus-osama:0.1 .
