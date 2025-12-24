# DevOps lab

- ORIGINAL REPOSITORY: [GitLab](https://gitlab.com/zamasulolmeme123/devops_lab/).
GitLab = source of truth, GitHub = mirror

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

## Scripts start

```
    chmod +x scripts/*.sh
    make up # start up.sh script
    make addons # start addons.sh script
    make status # проверка nodes, ingress, pods -A
    make demo # apply app.yaml и ingress.yaml
    make check #  status + test nginx
    make destroy #  delete cluster
    make logs-ingress # ingress-nginx logs
    make events # check last 30 events
```

