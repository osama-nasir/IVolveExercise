#!/bin/sh
echo Kubernetes Deploy
gcloud config set compute/zone asia-south1-a
gcloud container clusters create nexusKuber
gcloud container clusters create nexus-kuber
gcloud container clusters get-credentials nexus-kuber
kubectl run nexus-kubernetes --image=nexus-osama:0.1 --port 8080
kubectl expose deployment nexus-kubernetes --type="LoadBalancer"
kubectl get service nexus-kubernetes

