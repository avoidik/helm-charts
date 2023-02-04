#!/bin/bash

helm lint charts/*
helm package charts/*
mv ./*.tgz install/

if [[ -f index.yaml ]]; then
  helm repo index --url https://avoidik.github.io/helm-charts/ --merge index.yaml .
else
  helm repo index --url https://avoidik.github.io/helm-charts/ .
fi
