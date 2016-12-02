# Running CloudWatch Log Driver

[Log Driver](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/using_awslogs.html) You can configure the containers in your tasks to send log information to CloudWatch Logs. This enables you to view different logs from your containers in one convenient location, and it prevents your container logs from taking up disk space on your container instances. This topic helps you get started using the awslogs log driver in your task definitions.

## TL;DR;

```bash
$ helm install cloudwatchlogs-x.x.x.tgz --name syslog --namespace cloudwatch
```
