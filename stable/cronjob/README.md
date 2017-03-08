# Kubernetes Cron Job

This chart will schedule [Kubernetes Cron Job](https://kubernetes.io/docs/user-guide/cron-jobs/)

## TL;DR;

```bash
$ helm install cronjob-x.x.x.tgz --name my-cron-job --namespace my-cron-job \
  --set image="alpine:3.4",commandShell="/bin/ash",schedule="*/1 * * * *",args="{a,b,c}"
```
