# 👷🏻‍♀️ gitpod-cloud-engineer-helper 👷

It is a GitPod Custom Docker image which contains a list of tools required for cloud engineering.

Currently it includes:
* terraform 1.0.10
* terragrunt 0.35.6
* kubectl 1.21.6
* helm 3.7.1
* helmfile 0.140.0
* awscli 2.3.3

And a custom script to make AWS SSO login using the [GitPod Environment Variables](https://www.gitpod.io/docs/environment-variables) as a source for `~/.aws/config` rendering.

## Usage

To use the latest version of image, [set it in `.gitpod.yml`](https://www.gitpod.io/docs/42_config_docker/):

```yaml
image: public.ecr.aws/vlad-labs/gitpod-cloud-engineer-helper:latest
```

Alternatively one might use a commit SHA as an image tag to pin to a particular versions.

Or one can use this repository as a quick starter to experiment and build your own image:

[![Open in GitPod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io#https://github.com/vlad-labs/gitpod-cloud-engineer-helper)


In order to use AWS SSO following environment varaibles should be set in your GitPod account:
* AWS_SSO_START_URL
* AWS_SSO_REGION
* AWS_SSO_ACCOUNT_ID
* AWS_SSO_ROLE_NAME
* AWS_REGION

Run `aws_sso_login` in started workspace


