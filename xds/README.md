# XDS

## TL;DR;

```console
$ helm install xds
```

## Introduction

This chart bootstraps an xds deployment on a [Kubernetes](http://kubernetes.io) or [OpenShift](https://www.openshift.com/) cluster using the [Helm](https://helm.sh) package manager.

## Installing the Chart

To install the chart with the release name `<my-release>`:

```console
$ helm install xds --name <my-release>
```

The command deploys xds on the cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

## Uninstalling the Chart

To uninstall/delete the `<my-release>` deployment:

```console
$ helm delete <my-release>
```

The command removes all components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the xds chart and their default values.

| Perameters                        | Description       | Default                                                        |
| --------------------------------- | ----------------- | -------------------------------------------------------------- |
| xds.version                       |                   | 0.2.6                                                          |
| xds.image                         |                   | 'docker.production.deciphernow.com/deciphernow/gm-xds:0.2.6'   |
| xds.imagePullPolicy               |                   | Always                                                         |
| xds.cluster                       |                   | greymatter                                                     |
| xds.port                          |                   | 18000                                                          |
| xds.use_zk                        |                   | 'true'                                                         |
| xds.logging_level                 |                   | 'true'                                                         |
| xds.zk_base_path                  |                   | '/services'                                                    |
| xds.resources.limits.cpu          |                   | 250m                                                           |
| xds.resources.limits.memory       |                   | 512Mi                                                          |
| xds.resources.requests.cpu        |                   | 100m                                                           |
| xds.resources.requests.memory     |                   | 128Mi                                                          |
|                                   |                   |                                                                |
| sidecar.version                   | Proxy Version     | 0.7.1                                                          |
| sidecar.image                     | Proxy Image       | 'docker.production.deciphernow.com/deciphernow/gm-proxy:0.7.1' |
| sidecar.proxy_dynamic             |                   | 'true'                                                         |
| sidecar.metrics_key_function      |                   | depth                                                          |
| sidecar.ingress_use_tls           | Enable TLS        | 'true'                                                         |
| sidecar.imagePullPolicy           | Image pull policy | Always                                                         |
| sidecar.create_sidecar_secret     | Create Certs      | false                                                          |
| sidecar.certificates              |                   | {name:{ca: ... , cert: ... , key ...}}                         |
| sidecar.resources.limits.cpu      |                   | 200m                                                           |
| sidecar.resources.limits.memory   |                   | 512Mi                                                          |
| sidecar.resources.requests.cpu    |                   | 100m                                                           |
| sidecar.resources.requests.memory |                   | 128Mi                                                          |
|                                   |                   |                                                                |
| exhibitor.replicas                |                   | 1                                                              |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

- All the files listed under this variable will overwrite any existing files by the same name in the xds config directory.
- Files not mentioned under this variable will remain unaffected.

```console
$ helm install xds --name <my-release> \
  --set=jwt.version=v0.2.0, sidecar.ingress_use_tls='false'
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example :

```console
$ helm install xds --name <my-release> -f custom.yaml
```