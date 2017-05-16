# S3 Proxy

[Reverse proxy for AWS S3](https://hub.docker.com/r/pottava/s3-proxy/)

## TL;DR;

Install:

```bash
$ helm install clearbit/s3proxy --name s3proxy-${APP} --namespace s3-proxy \
  --set aws.region="us-west-1",aws.s3Bucket="${BUCKET}",tls.certPem="$(cat cert.pem)",tls.keyPem="$(cat key.pem)"
```

Update certificates:

```bash
$ helm upgrade clearbit/s3proxy s3proxy-${APP} --namespace s3-proxy \
  --set aws.region="us-west-1",aws.s3Bucket="${BUCKET}",tls.certPem="$(cat cert.pem)",tls.keyPem="$(cat key.pem)"
```
