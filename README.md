# docker-aws-cli

[![CircleCI](https://circleci.com/gh/aegirops/docker-aws-cli.svg?style=svg)](https://circleci.com/gh/aegirops/docker-aws-cli)

## Description

Docker with aws cli and kubectl for CI/CD purpose

This image is based on debian buster slim and contains:

- Python 3.7
- Pip3 18.1
- Aws cli
- s3cmd
- Kubectl
- Curl
- Git
- Docker cli
- Jq
- YTT v0.44.0 (Yaml templating tool https://get-ytt.io)

This image is intended to be used in a kubernetes/aws CI/CD environment.

## Flavors

This build provides two flavors:

- aegirops/aws-cli:VERSION

Which include all tools from the `description`

- aegirops/aws-cli:VERSION-serverless

Which contains all tools from the `description` and serverless.com cli

## DockerHub

Available publicly on:

- https://hub.docker.com/r/aegirops/aws-cli
