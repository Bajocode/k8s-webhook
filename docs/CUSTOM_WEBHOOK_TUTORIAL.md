# Custom Webhook

## Create a webhook configmap
k8s-webhook uses [webhook]() for consuming webhooks. webhook is a lightweight configurable tool written in Go, that allows you to easily create HTTP endpoints (hooks) on your server, which you can use to execute configured commands.

1. Create a webhook with your own trigger rules as defined [here](https://github.com/adnanh/webhook) and [here](https://github.com/adnanh/webhook/blob/master/docs/Hook-Definition.md)
2. Wrap that hook definition in a Kubernetes [ConfigMap](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/)
3. Create an execution `script.sh` and optionally make use of [routed request variables](https://github.com/adnanh/webhook/blob/master/docs/Referencing-Request-Values.md)
4. Wrap the and mount the script in a ConfigMap as well or just add it to the previous ConfigMap as in the example below
5. Mount the ConfigMap(s) through the Helm values.yaml under `customVolumeMounts: []`
6. The webhook id field becomes the endpoint, exposed at `yourdomain/hooks/id`
7. Create a webhook somewhere, for instance at GitHub and point it to `yourdomain/hooks/id`

## Example webhook config
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: "webhook"
data:
  webhook.yaml: |-
    ---
    - id: webhook
      execute-command": /var/scripts/execute.sh
      command-working-directory: /var/webhook
  
  execute.sh: |-
    ---
    #!/bin/bash
    echo "hello world"
```
