---
title: FiveNet Helm Chart
---
{{ template "generatedDocsWarning" . }}

Installs [FiveNet](https://github.com/fivenet-app/fivenet).

## Prerequisites

* Kubernetes 1.19+
* Helm 3.x

See the [Helm support matrix](https://helm.sh/docs/topics/version_skew/) for more details.

## Installing

```console
helm repo add fivenet https://fivenet.app/charts
helm install fivenet/fivenet -f values.yaml

# Or upgrade
helm upgrade --install fivenet/fivenet -f values.yaml
```

For example settings, see the next section or [values.yaml](/charts/fivenet/values.yaml).

### Must Change Values

The following values must be changed before installing the chart:

- `fivenet.config.secret`: The secret key used to encrypt certain data in the database. This should be exactly a 32 characters long, random string.
- `fivenet.config.database.dsn`: The database connection string. This should be in the format `user:password@host:port/database`. Make sure to replace `user`, `password`, `host`, `port`, and `database` with your actual database credentials.
- `fivenet.config.jwt.secret`: The secret key used to sign JSON Web Tokens (JWT). This should be a random string of at least 32 characters.
- `fivenet.config.http.sessions.cookieSecret`: The secret key used to sign session cookies. This should be a random string of at least 32 characters.

## Configuration

The following table lists the configurable parameters of the FiveNet chart and their default values.

{{ template "chart.valuesTable" . }}

## Uninstalling the Chart

To see the currently installed Rook chart:

```console
helm ls
```

To uninstall/delete the `fivenet` deployment:

```console
helm delete fivenet
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## License

Apache 2.0 License, see [LICENSE](/LICENSE).
