
#!/bin/sh
echo Automated Script
gcloud config set compute/zone asia-south1-a
gcloud container clusters create nexus-kuber
git clone https://github.com/sonatype-nexus-community/nexus-blobstore-google-cloud.git --recursive
cd nexus-blobstore-google-cloud
docker build -t nexus-osama:0.1 .
docker tag nexus-osama:0.1 gcr.io/nexuskubernetes/nexus-osama:0.1
docker push gcr.io/nexuskubernetes/nexus-osama:0.1

kubectl run nexus-kubernetes --image=gcr.io/nexuskubernetes/nexus-osama:0.1	 --port 8080
kubectl expose deployment nexus-kubernetes --type="LoadBalancer"

#After editing the the necessary files for Upgrade

kubectl edit deployment nexus-kubernetes
#Make chnages in the descriptor.yml
