#!/usr/bin/env bash
set -euo pipefail

CLUSTER_NAME="${CLUSTER_NAME:-lab}"
REGISTRY_NAME="${REGISTRY_NAME:-kind-registry}"
REGISTRY_PORT="${REGISTRY_PORT:-5001}"

# 1) local registry container
if [ -z "$(docker ps -aq -f name=^${REGISTRY_NAME}$)" ]; then
  docker run -d --restart=always \
    -p "127.0.0.1:${REGISTRY_PORT}:5000" \
    --name "${REGISTRY_NAME}" registry:2
fi

# 2) create cluster
kind create cluster --name "${CLUSTER_NAME}" --config kind/cluster.yaml

# 3) connect registry to kind network
docker network connect "kind" "${REGISTRY_NAME}" 2>/dev/null || true

# 4) publish registry info to cluster (не обязательно, но красиво)
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: ConfigMap
metadata:
  name: local-registry-hosting
  namespace: kube-public
data:
  localRegistryHosting.v1: |
    host: "localhost:${REGISTRY_PORT}"
    help: "https://kind.sigs.k8s.io/docs/user/local-registry/"
EOF

echo "OK: kind cluster '${CLUSTER_NAME}' up. Ingress will be on http://localhost:8080"
