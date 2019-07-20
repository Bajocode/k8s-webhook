# k8s-webhook
A Kubernetes webhook consumer with a preconfigured CI CD webhook set for Github and Gitlab.

## Usage
* gifs

## Prerequisites
* helm
* kubernetes
* helm repo add fb https://bajocode.github.io/helmcharts/

### Configuring the predefined CI CD hooks

### Adding an entirely new webhook

## Components
* predefined git webhooks
* custom webhooks and actions: https://github.com/adnanh/webhook

## Be aware of
* RBAC permission to pull, push

### Dockerfile
```Dockerfile
FROM        golang:alpine3.10 AS builder
LABEL       maintainer="Fabijan Bajo <bajo09@gmail.com>"
ARG         WEBHOOK_VERSION="2.6.9"
ARG         K8S_VERSION="v1.13.4"
ARG         HELM_VERSION="v2.14.1"
WORKDIR     /go/src/github.com/adnanh/webhook
RUN         apk add --update -t build-deps curl libc-dev gcc libgcc
RUN         curl -L --silent -o webhook.tar.gz https://github.com/adnanh/webhook/archive/${WEBHOOK_VERSION}.tar.gz && \
              tar -xzf webhook.tar.gz --strip 1 && \
              go get -d && go build -o /usr/local/bin/webhook && \
              wget -q https://storage.googleapis.com/kubernetes-release/release/${K8S_VERSION}/bin/linux/amd64/kubectl \
                -O /usr/local/bin/kubectl && \
              chmod +x /usr/local/bin/kubectl && \
              wget -q https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz \
                -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm && \
              chmod +x /usr/local/bin/helm

FROM        alpine:3.10
RUN         apk add --no-cache ca-certificates bash git openssh curl && \
            addgroup -S appgroup && adduser -S appuser -G appgroup
SHELL       ["/bin/bash", "-c"]
USER        appuser
WORKDIR     /usr/local/bin
COPY        --chown=appuser:appgroup --from=builder /usr/local/bin/ .
EXPOSE      9000/tcp
ENTRYPOINT  ["./webhook"]
```

## Out of the box

### Git Webhooks
* github
  * webhook secret
* gitlab
  *  

### Pipeline
* clone with alpine/git: https://hub.docker.com/r/alpine/git/
* build with Makisu 🍣: https://github.com/uber/makisu
  * or kaniko, or buildkit
* deploy with Helm: https://helm.sh/

### Or Tekton pipelines

## Custom Webhooks
* webhook yaml configmap
* script inline or file
