# docker-aws-cli

[![CircleCI](https://circleci.com/gh/aegirops/docker-aws-cli.svg?style=svg)](https://circleci.com/gh/aegirops/docker-aws-cli)

## Description

Docker with aws cli and kubectl for CI/CD purpose

This image is based on debian buster slim and contains:

- Python 3.9
- Pip3 20.3
- Aws cli 1.27
- s3cmd 2.3
- Kubectl 1.25
- Curl
- Git
- Docker cli 20.10
- Jq 1.6
- YTT v0.45.3 (Yaml templating tool https://github.com/vmware-tanzu/carvel-ytt)

This image is intended to be used in an AWS, Kubernetes CI/CD environment.

## Flavors

This build provides two flavors:

- aegirops/aws-cli:VERSION

Which include all tools from the `description`

- aegirops/aws-cli:VERSION-serverless

Which contains all tools from the `description` and serverless.com cli

## DockerHub

Available publicly on:

- https://hub.docker.com/r/aegirops/aws-cli
