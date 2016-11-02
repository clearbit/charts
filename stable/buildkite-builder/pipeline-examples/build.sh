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
echo -e "\n--- Building ${IMAGE}:${TAG}"
docker build -t ${IMAGE}:${TAG} .

# Cleaning up repo folder
echo "--- Cleaning up repo folder ${BUILDKITE_PIPELINE_SLUG}"
rm -rf /tmp/${BUILDKITE_PIPELINE_SLUG}
