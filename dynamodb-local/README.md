# Running DynamoDB local

[DynamoDB-local](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.html) In addition to the Amazon DynamoDB web service, AWS provides a downloadable version of DynamoDB that you can run locally. This edition of DynamoDB lets you write applications without accessing the actual Amazon DynamoDB web service. Instead, the database is self-contained on your computer.

This local version of DynamoDB can help you save on provisioned throughput, data storage, and data transfer fees. In addition, you do not need to have an Internet connection while you are developing your application. When you are ready to deploy your application in production, you can make some minor changes to your code so that it uses the Amazon DynamoDB web service.

## TL;DR;

```bash
$ helm install dynamodb-local-x.x.x.tgz
```

## Introduction

This chart bootstraps a [DynamoDB local](https://github.com/trayio/dynamodb-local) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Get this chart

Clone the repo if you wish to use the development snapshot:

```bash
$ git clone https://github.com/clearbit/charts.git
```

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install --name my-release dynamodb-local-x.x.x.tgz
```

*Replace the `x.x.x` placeholder with the chart release version.*

The command deploys dynamodb-local on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following tables lists the configurable parameters of the dynamo-local chart and their default values.

|     Parameter     |        Description        |                         Default                         |
|-------------------|---------------------------|---------------------------------------------------------|
| `imageTag`        | `clearbit/dynamodb-local` image tag | dynamodb-local image version                                     |
| `imagePullPolicy` | Image pull policy         | `Always` if `imageTag` is `latest`, else `IfNotPresent` |
