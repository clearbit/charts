#!/bin/bash

# ECR docker repository
if [[ "${BUILDKITE_BRANCH}" = "test" ]]
then
  DOCKER_REPO=123456789.dkr.ecr.us-west-2.amazonaws.com
else
  DOCKER_REPO=987654321.dkr.ecr.us-west-1.amazonaws.com
fi

# image name
IMAGE=my_image

# download aws cli
echo "--- Installing aws cli"
apt-get update
apt-get -y install python-pip
pip install awscli
# login to ECR
if [[ "${BUILDKITE_BRANCH}" = "test" ]]
then
  $(aws ecr get-login --region us-west-2)
else
  $(aws ecr get-login --region us-west-1)
fi

# use buildkite commit hash as a TAG
TAG=${BUILDKITE_COMMIT::8}

# tag docker image
docker tag ${IMAGE}:${TAG} ${DOCKER_REPO}/${IMAGE}:${TAG}

# push to ECR
echo "--- Pushing ${DOCKER_REPO}/${IMAGE}:${TAG}"
docker push ${DOCKER_REPO}/${IMAGE}:${TAG}

# local clean up
echo "--- Cleaning up image ${DOCKER_REPO}/${IMAGE}:${TAG}"
docker rmi -f ${DOCKER_REPO}/${IMAGE}:${TAG}
