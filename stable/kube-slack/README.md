# kube-slack

[kube-slack](https://github.com/whs/kube-slack) is a monitoring service for Kubernetes.
When a pod has failed, it will publish a message in Slack channel.


## Installing the Chart

Install from remote URL with the release name `kube-slack` and into namespace `my-app` and set which namespace to watch `namespace=my-app`:

```bash
$ helm install --name kube-slack --namespace my-app --set namespace=my-app https://clearbit.github.io/charts/kube-slack-0.1.0.tgz
```
