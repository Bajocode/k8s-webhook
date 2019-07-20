# CI/CD Pipeline

## Requirements
- Makisu config: https://github.com/uber/makisu/blob/master/docs/REGISTRY.md
- Custom values for the k8s-webhook chart as per below

```yaml
ingress:
  enabled: true
  annotations:
    kubernetes.io/ingress.class: nginx
    certmanager.k8s.io/cluster-issuer: "letsencrypt-prod"
    certmanager.k8s.io/acme-challenge-type: http01
  hosts:
  - host: devops.fabijanbajo.com
    paths:
    - /hooks/github-webhook
    - /hooks/gitlab-webhook
  tls:
  - secretName: fabijanbajo-tls-secret
    hosts:
    - devops.fabijanbajo.com

webhook:
  github:
    endpoint: github-webhook  
    secret: "github-webhook-secret"
    branch: master
    isScriptInline: false
  gitlab:
    endpoint: gitlab-webhook  
    secret: "gitlab-webhook-secret"
    branch: master
    isScriptInline: true
    commandArg: |-
      #!/bin/bash
      export GITHUB_EVENT=$0 COMMIT_HASH=$1 REPO_HTTPS=$1 REPO_SSH=$2
      kubectl version && helm version

pipelineJob:
  enabled: true
  clone:
    cloningRepositoryUrl: <URL_FROM_WEBHOOK_PAYLOAD>
    sshSecret: ssh-secret # optional
  build:
    buildToolImage:
      makisuSecret: docker-registry-config
    targetImage:
      host: gcr.io
      repository: fabijanbajo/k8s-webhook
      tag: <COMMIT_HASH_FROM_WEBHOOK_PAYLOAD>
  deploy:
    helmChart:
      name: k8s-webhook
      namespace: ops
      path: kubernetes
```
