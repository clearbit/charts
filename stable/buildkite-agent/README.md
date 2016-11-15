# Running Buildkite agent

The [buildkite agent](https://buildkite.com/docs/agent) is a small, reliable and cross-platform build runner that makes it easy to run automated builds on your own infrastructure. Its main responsibilities are polling buildkite.com for work, running build jobs, reporting back the status code and output log of the job, and uploading the job's artifacts.

## TL;DR;

```bash
$ helm install clearbit/buildkite-agent --name bk-agent --namespace buildkite \
  --set agentToken="$(cat token)",agentMeta="role=deploy-staging",privateSshKey="$(cat buildkite.key)",workflowUserToken="$(cat client.json | base64)",workflowApiUrl="deis.my-domain.com"
```

## Introduction

This chart bootstraps a [buildkite agent](https://github.com/buildkite/docker-buildkite-agent) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Get this chart

Clone the repo if you wish to use the development snapshot:

```bash
$ git clone https://github.com/clearbit/charts.git
```

## Installing the Chart

To install the chart with the release name `deploy`:

```bash
$ helm install --name bk-deploy buildkite-agent-x.x.x.tgz
```

*Replace the `x.x.x` placeholder with the chart release version.*

The command deploys buildkite agent on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `deploy` deployment:

```bash
$ helm delete bk-deploy
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the `buildkite-agent` chart and their default values.

|     Parameter       |        Description             |               Default              |
|---------------------|--------------------------------|------------------------------------|
| `image`             | `buildkite/agent:latest` image | buildkite image latest tag         |
| `imagePullPolicy`   | Image pull policy              | `Always` if `imageTag` is `latest` |
| `replicasCount`     | Replicas count                 | 1                                  |
| `agentTag`          | Agent release tag              | Must be specified                  |
| `agentToken`        | Agent token                    | Must be specified                  |
| `agentMeta`         | Agent role                     | `role=deploy`                      |
| `privateSshKey`     | agent ssh key                  | Must be specified                  |
| `cpu`               | CPU resource limit             | `100m`                             |
| `memory`            | Memory resource limit          | `200Mi`                            |
| `workflowUserToken` | Deis Workflow user token       | `nil`                                |
| `workflowApiUrl`    | Deis Workflow API URL          | `nil`                                |
