# k8s-webhook

k8s-webhook is a Kubernetes webhook consumer, equipped and preconfigured to continuously integrate and deploy your Github and Gitlab projects.

## TL;DR

```console
$ helm repo add fbajo https://bajocode.github.io/helmcharts/
$ helm install fbajo/k8s-webhook
```

## Introduction

This chart bootstraps an adapted [webhook](https://github.com/adnanh/webhook) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager, while firing pipeline jobs, equipped with git for cloning, Uber's [makisu](https://github.com/uber/makisu) for image building / pushing and Helm for deploying.

Though preconfigured for CI/CD, custom webhook configurations can be integrated to webhookify anything you want.

## Prerequisites

- Kubernetes with Beta APIs enabled
- An (ingress) exposed public webhook endpoint

## Installing the Chart

### Required before installing
- [I want to create and deploy my own custom webhook](https://github.com/Bajocode/k8s-webhook/blob/master/docs/CUSTOM_WEBHOOK_TUTORIAL.md)
- [I want to make use of the integrated ci/cd pipeline](https://github.com/Bajocode/k8s-webhook/blob/master/docs/CICD_PIPELINE_TUTORIAL.md)

>Once configured; install the chart with the a release name `my-release`;

```bash
$ helm repo add fbajo https://bajocode.github.io/helmcharts/
$ helm upgrade --install my-release fbajo/k8s-webhook
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm delete my-release --purge
```

>The command removes all the Kubernetes components associated with the chart and deletes the release.

## Chart Values (Detailed explanations on the way)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | {} |  |
| customVolumeMounts | list | [] |  |
| fullnameOverride | string | "" |  |
| image.pullPolicy | string | "IfNotPresent" |  |
| image.repository | string | "gcr.io/fabijanbajo/k8s-webhook" |  |
| image.tag | string | "0.1.0" |  |
| imagePullSecrets | list | [] |  |
| ingress.annotations | object | {} |  |
| ingress.enabled | bool | false |  |
| ingress.hosts[0].host | string | "chart-example.local" |  |
| ingress.hosts[0].paths | list | [] |  |
| ingress.tls | list | [] |  |
| nameOverride | string | "" |  |
| nodeSelector | object | {} |  |
| pipelineJob.build.buildToolImage.makisuSecret | string | "" |  |
| pipelineJob.build.buildToolImage.pullPolicy | string | "Always" |  |
| pipelineJob.build.buildToolImage.repository | string | "gcr.io/makisu-project/makisu" |  |
| pipelineJob.build.buildToolImage.tag | string | "v0.1.11" |  |
| pipelineJob.build.targetImage.host | string | "" |  |
| pipelineJob.build.targetImage.repository | string | "" |  |
| pipelineJob.build.targetImage.tag | string | "<COMMIT_HASH_FROM_WEBHOOK_PAYLOAD>" |  |
| pipelineJob.clone.cloningRepositoryUrl | string | "<URL_FROM_WEBHOOK_PAYLOAD>" |  |
| pipelineJob.clone.sshSecret | string | "" |  |
| pipelineJob.deploy.helmChart.name | string | "" |  |
| pipelineJob.deploy.helmChart.namespace | string | "" |  |
| pipelineJob.deploy.helmChart.path | string | "" |  |
| pipelineJob.enabled | bool | true |  |
| replicaCount | int | 1 |  |
| resources | object | {} |  |
| scriptsPath | string | "/emptydir-volume/scripts" |  |
| service.port | int | 80 |  |
| service.type | string | "ClusterIP" |  |
| tolerations | list | [] |  |
| webhook.github.branch | string | "master" |  |
| webhook.github.commandArg | string | "" |  |
| webhook.github.endpoint | string | "github-webhook" |  |
| webhook.github.isScriptInline | bool | false |  |
| webhook.github.secret | string | "" |  |
| webhook.gitlab.branch | string | "master" |  |
| webhook.gitlab.commandArg | string | "" |  |
| webhook.gitlab.endpoint | string | "gitlab-webhook" |  |
| webhook.gitlab.isScriptInline | bool | false |  |
| webhook.gitlab.secret | string | "" |  |
| webhookFilePath | string | "/emptydir-volume/git-webhook.yaml" |  |
