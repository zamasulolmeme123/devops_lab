## DevOps lab

- ORIGINAL REPOSITROY: [GitLab](https://gitlab.com/zamasulolmeme123/devops_lab/).

- Practicing DevOps tools like: kubernetes, grafana, prometheus, CI/CD, and others.

## Download

- Kubectl download
```
    curl -L -o kubectl "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod +x kubectl
    sudo mv kubectl /usr/local/bin/
    kubectl version --client
```

- Kind download
```
    curl -Lo kind https://kind.sigs.k8s.io/dl/v0.23.0/kind-linux-amd64
    chmod +x kind
    sudo mv kind /usr/local/bin/
    kind version
```

# Scripts start

```
    chmod +x scripts/*.sh
```