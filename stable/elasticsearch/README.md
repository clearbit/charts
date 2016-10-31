# Elasticsearch

This Chart provides a basic [Elasticsearch](https://www.elastic.co/products/elasticsearch) search service.

## Introduction

This chart bootstraps a [Elasticsearch](https://hub.docker.com/_/elasticsearch/) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Installing the Chart

Install from remote URL with the release name `elasticsearch` and into namespace `backend-es`:

```bash
$ helm install --name elasticsearch --namespace backend-es https://clearbit.github.io/charts/elasticsearch-0.1.0.tgz

```

Alternatively, clone the repo if you wish so (it's very handy when developing a chart):

```bash
$ git clone https://github.com/bitnami/charts.git
```

Than install the chart from unpacked chart directory:

```bash
$ helm install --name elasticsearch --namespace backend-es ./elasticsearch
```

The command deploys Elasticsearch on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `elasticsearch` deployment:

```bash
$ helm delete elasticsearch
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following tables lists the configurable parameters of the PostgreSQL chart and their default values.

|      Parameter       |          Description           |                         Default                         |
|----------------------|--------------------------------|---------------------------------------------------------|
| `imageTag`           | `elasticsearch` image tag      | Elasticsearch image version                             |
| `storageSize`        | PVC storage size               | `25Gi`                                                  |

The above `imageTag` parameter maps to the env variable defined in [elasticsearch](https://hub.docker.com/_/elasticsearch/). For more information please refer to the [elasticsearch](https://github.com/docker-library/elasticsearch) image documentation.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm install --name elasticsearch --namespace backend-es \
  --set storageSize=100Gi \
  elasticsearch-0.1.0.tgz
```

The above command sets the elasticsearch `storageSize` to 100GB storage.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-release -f values.yaml elasticsearch-x.x.x.tgz
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Persistence

The [Elasticsearch](https://hub.docker.com/_/elasticsearch/) image stores it's index data at the `/usr/share/elasticsearch/data` path of the container.


> *"You must deploy [aws-ebs-standard.yaml](.../aws-ebs/aws-ebs-standard.yaml) first before running the chart install, that will create the `StorageClass` object for AWS EBS disks with a type `gp2`"*
