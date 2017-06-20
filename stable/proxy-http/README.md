# Proxy-http app

## TL;DR;

```bash
$ helm install proxy-http-x.x.x.tgz --name proxy --namespace proxy
```

## Requirements

For any environment, you'll need to provide:

* proxyUrl: this URL should return a newline-delimited
  list of upstreaam proxies. See [proxy/update-proxies](https://github.com/clearbit/proxy/blob/master/update-proxies) for details.
* redisUrl: points to a dedicated redis DB. In dev, we deploy one
  using the stable/redis chart.

For production -- so that proxy-cronjob works properly -- you must
also provide:

* influxdbUrl: HTTP url for storing proxy-cronjob metrics.


## Deployment

See [proxy/README.md](https://github.com/clearbit/proxy/blob/master/README.md).
