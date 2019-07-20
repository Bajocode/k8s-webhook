k8s-webhook
===========
A Helm chart for Kubernetes

Current chart version is `0.1.0`





## Chart Values

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
