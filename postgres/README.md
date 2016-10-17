# PostgreSQL

[PostgreSQL](https://www.postgresql.org/) is an object-relational database management system (ORDBMS) with an emphasis on extensibility and on standards-compliance.


## Introduction

This chart bootstraps a [PostgreSQL](https://hub.docker.com/_/postgres/) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Installing the Chart

Install from remote URL with the release name `postgress` and into namespace `backend-pg`:

```bash
$ helm install --name postgres --namespace backend-pg https://clearbit.github.io/charts/postgres-0.1.0.tgz

```

Alternatively, clone the repo if you wish so:

```bash
$ git clone https://github.com/bitnami/charts.git
```

Than install the chart from unpacked chart directory:

```bash
$ helm install --name postgres --namespace backend-pg ./postgres
```

*Replace the `x.x.x` placeholder with the chart release version.*

The command deploys PostgreSQL on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `postgres` deployment:

```bash
$ helm delete postgres
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following tables lists the configurable parameters of the PostgreSQL chart and their default values.

|      Parameter       |          Description           |                         Default                         |
|----------------------|--------------------------------|---------------------------------------------------------|
| `imageTag`           | `postgres` image tag           | PostgreSQL image version                                |
| `imagePullPolicy`    | Image pull policy              | `Always` if `imageTag` is `latest`, else `IfNotPresent` |
| `postgresqlUsername` | PostgreSQL admin user          | `postgres`                                              |
| `postgresqlPassword` | PostgreSQL password            | `nil`                                                   |
| `postgresqlDatabase` | Database to create             | `nil`                                                   |

The above parameters map to the env variables defined in [postgres](https://hub.docker.com/_/postgres/). For more information please refer to the [postgres](https://github.com/docker-library/postgres) image documentation.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm install --name postgres --namespace backend-pg \
  --set postgresqlUsername=myuser,postgresPassword=secretpassword,\
    postgresDatabase=my-database \
    postgres-0.1.0.tgz
```

The above command sets the PostgreSQL account `myuser`, sets `myuser` account password to `secretpassword`, and it creates a database named `my-database` and 

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-release -f values.yaml postgres-x.x.x.tgz
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Persistence

The [PostgreSQL](https://hub.docker.com/_/postgres/) image stores the PostgreSQL data and configurations at the `/var/lib/postgresql/data/pgdata` path of the container.


> *"You must deploy [aws-ebs.yaml](.../aws-ebs/aws-ebs.yaml) first before running the chart install, that will create the `StorageClass` object for AWS EBS disks with a type `gp2`"*




