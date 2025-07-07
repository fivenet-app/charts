---
title: Iconify Helm Chart
---
{{ template "generatedDocsWarning" . }}

Installs [Iconify API](https://github.com/iconify/api).

## Prerequisites

* Kubernetes 1.19+
* Helm 3.x

See the [Helm support matrix](https://helm.sh/docs/topics/version_skew/) for more details.

## Installing

```console
helm repo add fivenet https://fivenet.app/charts
helm install fivenet/iconify -f values.yaml

# Or upgrade
helm upgrade --install iconify fivenet/iconify -f values.yaml
```

For example settings, see the next section or [values.yaml](/charts/iconify/values.yaml).

## Configuration

The following table lists the configurable parameters of the Iconify chart and their default values.

{{ template "chart.valuesTable" . }}

## Uninstalling the Chart

To see the currently installed Rook chart:

```console
helm ls
```

To uninstall/delete the `iconify` deployment:

```console
helm delete iconify
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## License

Apache 2.0 License, see [LICENSE](/LICENSE).
