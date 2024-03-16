#!/bin/sh
kubectl apply -f revisions/$1/rollback.yaml
kubectl apply -f revisions/$1/deploy.yaml