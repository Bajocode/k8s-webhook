FROM        alpine:3.10
LABEL       maintainer="Fabijan Bajo <bajo09@gmail.com>"
ARG         K8S_VERSION="v1.13.4"
ARG         HELM_VERSION="v2.14.1"
RUN         apk add --update -t build-deps git bash openssh ca-certificates libgcc ca-certificates && \
            addgroup -S appgroup && adduser -S appuser -G appgroup
RUN         wget -q https://storage.googleapis.com/kubernetes-release/release/${K8S_VERSION}/bin/linux/amd64/kubectl \
              -O /usr/local/bin/kubectl && \
            chmod +x /usr/local/bin/kubectl && \
            wget -q https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz \
              -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm && \
            chmod +x /usr/local/bin/helm && \
            wget -q https://s3.amazonaws.com/chartmuseum/release/latest/bin/linux/amd64/chartmuseum \
              -O /usr/local/bin/chartmuseum && \
            chmod +x /usr/local/bin/chartmuseum
SHELL       ["/bin/bash", "-c"]
ENTRYPOINT  ["kubectl"]
CMD         ["-h"]
