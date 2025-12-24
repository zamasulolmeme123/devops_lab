SHELL := /bin/bash
CLUSTER_NAME ?= lab

.PHONY: up addons demo check destroy status

up:
	CLUSTER_NAME=$(CLUSTER_NAME) ./scripts/up.sh

addons:
	./scripts/addons.sh

demo:
	kubectl apply -f k8s/demo/app.yaml
	kubectl apply -f k8s/demo/ingress.yaml

status:
	kubectl get nodes
	kubectl get pods -A
	kubectl get ingress

check: status
	@echo "Try: http://echo.localtest.me:8080"
	@curl -fsS http://echo.localtest.me:8080/ | head -n 5 || true
	@kubectl top nodes || true

destroy:
	kind delete cluster --name $(CLUSTER_NAME) || true
