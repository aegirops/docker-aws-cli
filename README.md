# docker-aws-cli

[![CircleCI](https://circleci.com/gh/aegirops/docker-aws-cli.svg?style=svg)](https://circleci.com/gh/aegirops/docker-aws-cli)

## Description

Docker with aws cli and kubectl for CI/CD purpose

This image is based on debian stretch slim and contains:
 - Python3
 - Pip3
 - Aws cli
 - Kubectl
 - Curl
 - Git
 - Docker cli
 - Jq
 - YTT (Yaml templating tool)

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

