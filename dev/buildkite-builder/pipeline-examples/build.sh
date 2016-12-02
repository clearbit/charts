#!/bin/bash

# use buildkite commit hash as a TAG
TAG=${BUILDKITE_COMMIT::8}

# image name
IMAGE=my_image

# make tmp folder
mkdir /tmp
cd /tmp

#  clone repo
env SSH_AUTH_SOCK= GIT_SSH_COMMAND='ssh -v -i ./buildkite' git clone ${BUILDKITE_REPO}

# cd to pulled repo folder
cd ${BUILDKITE_PIPELINE_SLUG}

# checkout branch
git checkout ${BUILDKITE_BRANCH}

# build docker image
echo -e "\n--- Building :docker: image ${IMAGE}:${TAG}"
docker build -t ${IMAGE}:${TAG} .

# Cleaning up repo folder
echo "--- Cleaning up git repo folder ${BUILDKITE_PIPELINE_SLUG}"
rm -rf /tmp/${BUILDKITE_PIPELINE_SLUG}

# set ECR docker repository
if [[ "${BUILDKITE_BRANCH}" = "test" ]]
then
  DOCKER_REPO=123456789.dkr.ecr.us-west-2.amazonaws.com
else
  DOCKER_REPO=987654321.dkr.ecr.us-west-1.amazonaws.com
fi

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
echo "--- Pushing :docker: image ${DOCKER_REPO}/${IMAGE}:${TAG} to ECR"
docker push ${DOCKER_REPO}/${IMAGE}:${TAG}

# local clean up
echo "--- Cleaning up :docker: image ${DOCKER_REPO}/${IMAGE}:${TAG}"
docker rmi -f ${DOCKER_REPO}/${IMAGE}:${TAG}
