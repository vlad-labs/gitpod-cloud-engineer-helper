FROM gitpod/workspace-full:latest



RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1 && echo '. $HOME/.asdf/asdf.sh' >> $HOME/.bashrc
ENV PATH="$HOME/.asdf/bin:${PATH}" 

# https://github.com/asdf-vm/asdf-plugins
RUN asdf plugin-add terraform https://github.com/asdf-community/asdf-hashicorp.git && \
    asdf plugin-add terragrunt https://github.com/ohmer/asdf-terragrunt && \
    asdf plugin-add kubectl https://github.com/asdf-community/asdf-kubectl.git && \
    asdf plugin-add helm https://github.com/Antiarchitect/asdf-helm.git && \
    asdf plugin-add helmfile https://github.com/feniix/asdf-helmfile.git && \
    asdf plugin add awscli && \
    asdf plugin-add k9s && \
    asdf plugin-add stern && \
    asdf plugin-add kustomize && \
    asdf plugin-add eksctl


RUN asdf install terraform 1.0.10 && asdf global terraform 1.0.10 && \
    asdf install terragrunt 0.35.6 && asdf global terragrunt 0.35.6 && \
    asdf install kubectl 1.21.6 && asdf global kubectl 1.21.6 && \
    asdf install helm 3.7.1 && asdf global helm 3.7.1 && \
    asdf install helmfile 0.140.0 && asdf global helmfile 0.140.0 && \
    asdf install awscli 2.3.3 && asdf global awscli 2.3.3 && \ 
    asdf install k9s 0.24.15 && asdf global k9s 0.24.15 && \
    asdf install stern 1.20.1 && asdf global stern 1.20.1 && \
    asdf install kustomize 4.4.0 && asdf global kustomize 4.4.0 && \
    asdf install eksctl 0.82.0 && asdf global eksctl 0.82.0

RUN asdf exec helm plugin install https://github.com/databus23/helm-diff --version 3.1.3


COPY --chown=gitpod:gitpod .gitpod/aws_sso_login $HOME/bin/aws_sso_login
ENV PATH="$HOME/bin:${PATH}"