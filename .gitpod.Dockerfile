FROM gitpod/workspace-full:latest



RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1 && echo '. $HOME/.asdf/asdf.sh' >> $HOME/.bashrc
ENV PATH="/$HOME/.asdf/bin:${PATH}" 

# https://github.com/asdf-vm/asdf-plugins
RUN asdf plugin-add terraform https://github.com/asdf-community/asdf-hashicorp.git && \
    asdf plugin-add terragrunt https://github.com/ohmer/asdf-terragrunt && \
    asdf plugin-add kubectl https://github.com/asdf-community/asdf-kubectl.git && \
    asdf plugin-add helm https://github.com/Antiarchitect/asdf-helm.git && \
    asdf plugin-add helmfile https://github.com/feniix/asdf-helmfile.git && \
    asdf plugin add awscli

RUN asdf install kubectl 1.21.6 && asdf global kubectl 1.21.6 && \
    asdf install helm 3.7.1 && asdf global helm 3.7.1 && \
    asdf install helmfile 0.140.0 && asdf global helmfile 0.140.0 && \
    asdf install awscli 2.3.3 && asdf global awscli 2.3.3


RUN mkdir $HOME/.aws && printf '[default]\n\
sso_start_url = https://vlad-labs.awsapps.com/start\n\
sso_region = us-east-1\n\
sso_account_id = 894083195231\n\
sso_role_name = AdministratorAccess\n\
region = us-east-1' >> $HOME/.aws/config