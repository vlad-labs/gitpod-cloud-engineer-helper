# 👷 gitpod-cloud-engineer-helper 👷‍♂️

It is a GitPod Custom Docker image which contains a list of tools required for cloud engineering.

It is based on official `gitpod/workspace-full:latest` plus it includes:
* awscli 2.9.19
* aws-sam-cli 1.71.0
* terraform 1.3.7
* terragrunt 0.43.0
* kubectl 1.25.6
* helm 3.11.0
* kustomize 4.5.7
* helm-diff 3.1.3
* helmfile 0.144.0
* k9s 0.27.0
* stern 1.22.0
* eksctl 0.127.0
* quarkus-cli 2.16.0.Final

And a custom script to provide the ability to perform AWS SSO login in the workspace context. It relies on the [GitPod Environment Variables](https://www.gitpod.io/docs/environment-variables) as a source for `~/.aws/config` file generation.

## Usage

To use the latest version of image, [set it in `.gitpod.yml`](https://www.gitpod.io/docs/42_config_docker/):

```yaml
image: public.ecr.aws/k5x7f0j8/gitpod-cloud-engineer-helper
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

To test you image build and verify that tools works as expected run:
```bash
docker build -t gitpod . -f .gitpod/Dockerfile && docker run -it gitpod
```