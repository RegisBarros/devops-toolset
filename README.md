# DevOps Toolset

A lightweight Docker image with essential DevOps tools, designed to run as a pod in Kubernetes or as a standalone container for troubleshooting, automation, and development tasks.

## Included Tools
- bash
- curl
- redis-cli (redis-tools)
- git
- iputils-ping
- dnsutils (dig, nslookup)
- net-tools (ifconfig, netstat)
- vim
- htop
- unzip
- jq
- openssh-client
- less
- procps (ps, top)

## Usage

### Build the Image
```
docker build -t devops-toolset .
```

### Run Interactively (Local)
```
docker run -it --rm devops-toolset
```

### Example: Run in Kubernetes
Create a pod using this image for troubleshooting or on-demand DevOps tasks:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: devops-toolset
spec:
  containers:
  - name: devops-toolset
    image: devops-toolset:latest
    command: ["/bin/bash"]
    tty: true
    stdin: true
```

Then, exec into the pod:
```
kubectl exec -it devops-toolset -- bash
```

### Run with kubectl run
You can also start a temporary pod using `kubectl run` and access bash directly:

```
kubectl run devops-toolset --rm -it --image=devops-toolset:latest --restart=Never -- bash
```

- `--rm`: Automatically delete the pod when you exit.
- `-it`: Interactive terminal.
- `--restart=Never`: Run as a one-off pod.
- `-- bash`: Start with a bash shell.

This will give you an interactive bash shell with all the included DevOps tools, without needing to create a manifest file.

## Customization
Feel free to extend the Dockerfile to add more tools as needed for your environment.
