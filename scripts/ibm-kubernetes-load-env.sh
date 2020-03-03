#!/usr/bin/env bash

# Check input arguments

ERROR_MESSAGE=$(cat <<-END
ERROR: No API key provided

Usage: deploy.sh <apikey-file> [profile-name]

apikey-file: (Mandatory) An API key from IBM Cloud is needed to deploy the application.
profile-name: (Optional) A value from 'staging' or 'production', if empty 'staging' is used instead.
END
)

if [ -z "$1" ]
  then
    echo "${ERROR_MESSAGE}"

    exit 128
fi

# Exit on errors

set -o nounset
set -o errexit

# Variables

APIKEY_PATH=$1
PROFILE=${2:-staging}

echo "Selected profile = ${PROFILE}"

# Build project

./gradlew clean build docker --console=plain

# Stop version validation

ibmcloud config --check-version=false

# Log in into IBM Cloud Container Service

ibmcloud login --apikey @${APIKEY_PATH}
ibmcloud target -g "IBM RESEARCH PRO"
ibmcloud cr login

# Push image to the registry

./gradlew dockerPush --console=plain

# Set Kubernetes cluster

STORE_KUBECONFIG=$(ibmcloud cs cluster-config debater-voting | tail -n 1)
eval $STORE_KUBECONFIG

# Deploy to Kubernetes

kubectl apply -f ./build/resources/deploy/${PROFILE}

# kubectl get services
# kubectl get deployments
# kubectl delete -f ./deploy