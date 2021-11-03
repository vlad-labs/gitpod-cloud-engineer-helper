# 👷 gitpod-cloud-engineer-helper 👷‍♂️

It is a GitPod Custom Docker image which contains a list of tools required for cloud engineering.

It is based on official `gitpod/workspace-full:latest` plus it includes:
* awscli 2.3.3
* terraform 1.0.10
* terragrunt 0.35.6
* kubectl 1.21.6
* helm 3.7.1
* helm-diff 3.1.3
* helmfile 0.140.0
* k9s 0.24.15
* stern 1.20.1

And a custom script to provide the ability to perform AWS SSO login in the workspace context. It relies on the [GitPod Environment Variables](https://www.gitpod.io/docs/environment-variables) as a source for `~/.aws/config` file generation.

## Usage

To use the latest version of image, [set it in `.gitpod.yml`](https://www.gitpod.io/docs/42_config_docker/):

```yaml
image: public.ecr.aws/vlad-labs/gitpod-cloud-engineer-helper:latest
```

Alternatively one might use a commit SHA as an image tag to pin to a particular version.


In order to use AWS SSO following environment varaibles should be set in your GitPod account (Settings -> Variables):
* AWS_SSO_START_URL
* AWS_SSO_REGION
* AWS_SSO_ACCOUNT_ID
* AWS_SSO_ROLE_NAME
* AWS_REGION

Run `aws_sso_login` in started workspace. VSCode will try open the SSO authorization page in editor but it will fail to load because no external web sites are allowed in GitPod, it is just for local web development. So you need to copy the URL and open it as regular site.


## Contributing

One can use this repository as a quick starter to experiment and build your own Cloud Engineering image

[![Open in GitPod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io#https://github.com/vlad-labs/gitpod-cloud-engineer-helper)

Alternatively if you'd like to contribute to this code just make a fork and open a Pull Request back after.