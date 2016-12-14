# Running CoreRoller

[CoreRoller](https://github.com/coreroller/coreroller) is a set of tools to control and monitor the rollout of your updates. It's aimed to be an open source alternative to CoreOS CoreUpdate.

## Features

- Dashboard to control and monitor your applications updates
- Manage updates for your own applications, not just for CoreOS
- Define your own groups and channels, even for the CoreOS application (pre-installed)
- Define roll-out policies per group, controlling how updates should be applied to a set of instances
- Pause/resume updates at any time at the group level
- Statistics about versions installed in your instances, updates progress status, etc
- Activity stream to get notified about important events or errors
- Manage updates for your CoreOS clusters out of the box
- HTTP Restful and Golang APIs
- Based on the [Omaha](https://code.google.com/p/omaha/wiki/ServerProtocol) protocol developed by Google
- Backend server built using Golang, dashboard built using React

## TL;DR;

```bash
$ helm install coreroller-x.x.x.tgz --name coreroller --namespace coreroller
```
