#
# Terraform image
#

FROM 1science/alpine:3.3

# Terraform version
ENV TERRAFORM_VERSION=0.7.6

# Install Terraform
RUN curl -Ls https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform.zip && \
    unzip terraform.zip -d /usr/local/bin && \
    rm -f terraform.zip && \
    echo -ne "- with `terraform version`\n" >> /root/.built

CMD [ "bash" ]