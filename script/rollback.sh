#!/bin/sh
cd revisions/$1
cat <<-EOF > kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
- rollback.yaml
EOF
kustomize edit set namesuffix $(uuidgen | tr -d '-' | tr '[:upper:]' '[:lower:]')
kustomize build . | kubectl create -f -
kubectl apply -f deploy.yaml
rm kustomization.yaml
