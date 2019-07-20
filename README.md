# k8s-webhook

k8s-webhook is a Kubernetes webhook consumer, equipped and preconfigured to continuously integrate and deploy your Github and Gitlab projects.

<img src="docs/k8s-webhook.png" alt="logo" width="150"/>

## TL;DR

```console
$ helm repo add fbajo https://bajocode.github.io/helmcharts/
$ helm install fbajo/k8s-webhook
```

>Extra Helm Chart [details and values](https://github.com/Bajocode/k8s-webhook/blob/master/docs/CHART_CONFIG.md)

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