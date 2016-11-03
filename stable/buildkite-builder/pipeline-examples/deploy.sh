#!/bin/bash

# set ECR docker repository
if [[ "${BUILDKITE_BRANCH}" = "test" ]]
then
  DOCKER_REPO=123456789.dkr.ecr.us-west-2.amazonaws.com
else
  DOCKER_REPO=987654321.dkr.ecr.us-west-1.amazonaws.com
fi

# App name
APP=my_app

# use buildkite commit hash as a TAG
TAG=${BUILDKITE_COMMIT::8}

# App image name
IMAGE=${DOCKER_REPO}/${APP}:${TAG}

# pull image on remote Deis Workflow PaaS
echo "--- Deploying :docker: image ${IMAGE} to app ${APP}"
curl -H "Authorization: Token ${WORKFLOW_USER_TOKEN}" -H "Content-Type: application/json" -X POST https://${WORKFLOW_API_URL}/v2/apps/${APP}/builds -d '{"image": "'"${IMAGE}"'"}'
