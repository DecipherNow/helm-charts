# Dashboard

## TL;DR;

```console
$ helm install dashboard
```

## Introduction

This chart bootstraps a dashboard deployment on a [Kubernetes](http://kubernetes.io) or [OpenShift](https://www.openshift.com/) cluser using the [Helm](https://helm.sh) package manager.

## Installing the Chart

To install the chart with the release name `<my-release>`:

```console
$ helm install dashboard --name <my-release>
```

The command deploys dashboard on the cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

## Uninstalling the Chart

To uninstall/delete the `<my-release>` deployment:

```console
$ helm delete <my-release>
```

The command removes all components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the gm-catalog chart and their default values.

| Parameter                           | Description           | Default                                                            |
| ----------------------------------- | --------------------- | ------------------------------------------------------------------ |
| environment                         |                       | openshift                                                          |
| dashboard.image                     | Docker Image          | 'docker.production.deciphernow.com/deciphernow/gm-dashboard:2.5.0' |
| dashboard.fabric_server             | Path to fabric server | '/services/catalog/0.3.6/'                                         |
| dashboard.use_prometheus            |                       | 'true'                                                             |
| dashboard.prometheus_server         |                       | '/services/prometheus/2.7.1/api/v1/'                               |
| dashboard.objectives_server         |                       | '/services/slo/0.4.0/'                                             |
| dashboard.base_path                 |                       | '/services/dashboard/2.5.0'                                        |
| dashboard.version                   |                       | 2.5.0                                                              |
| dashboard.imagePullPolicy           |                       | Always                                                             |
| dashboard.resources.limits.cpu      |                       | 200m                                                               |
| dashboard.resources.limits.memory   |                       | 1Gi                                                                |
| dashboard.resources.requests.cpu    |                       | 100m                                                               |
| dashboard.resources.requests.memory |                       | 128Mi                                                              |
| prometheus.image                    |                       | 'prom/prometheus:v2.7.1'                                           |
| prometheus.imagePullPolicy          |                       | Always                                                             |
| prometheus.metrics_key_function     |                       | 'depth'                                                            |
| prometheus.zk_announce_path         |                       | '/services/prometheus/2.7.1'                                       |
| prometheus.replica_count            |                       | 1                                                                  |
| prometheus.data_mount_point         |                       | /var/lib/prometheus/data                                           |
| prometheus.config_mount_point       |                       | /etc/prometheus                                                    |
| prometheus.start_cmd                |                       | /bin/prometheus                                                    |
| prometheus.limit.cpu                |                       | 1                                                                  |
| prometheus.limit.memory             |                       | 2Gi                                                                |
| prometheus.request.cpu              |                       | 500m                                                               |
| prometheus.request.memory           |                       | 256Mi                                                              |
|                                     |                       |                                                                    |
|                                     |                       |                                                                    |
| sidecar.version                     | Proxy Version         | 0.7.1                                                              |
| sidecar.image                       | Proxy Image           | 'docker.production.deciphernow.com/deciphernow/gm-proxy:0.7.1'     |
| sidecar.proxy_dynamic               |                       | 'true'                                                             |
| sidecar.metrics_key_function        |                       | depth                                                              |
| sidecar.ingress_use_tls             | Enable TLS            | 'true'                                                             |
| sidecar.imagePullPolicy             | Image pull policy     | Always                                                             |
| sidecar.create_sidecar_secret       | Create Certs          | false                                                              |
| sidecar.certificates.ca             |                       | '...'                                                              |
| sidecar.certificates.cert           |                       | '...'                                                              |
| sidecar.certificates.key            |                       | '...'                                                              |
|                                     |                       |                                                                    |
| xds.port                            | Xds Port              | 18000                                                              |
| xds.cluster                         | XDS Cluster           | greymatter                                                         |
|                                     |                       |                                                                    |
| exhibitor.replicas                  | Exhibitor Replicas    | 1                                                                  |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

- All the files listed under this variable will overwrite any existing files by the same name in dashboard config directory.
- Files not mentioned under this variable will remain unaffected.

```console
$ helm install dashboard --name <my-release> \
  --set=jwt.version=v0.2.0, sidecar.ingress_use_tls='false'
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example :

```console
$ helm install dashboard --name <my-release> -f custom.yaml
```