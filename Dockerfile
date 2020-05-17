FROM mcr.microsoft.com/azure-cli:latest

LABEL maintainer="Scott Murray <scottam.coder@gmail.com>"

ENV PULUMI_VERSION=2.2.1

#Install Pulumi
RUN apk update && \
    apk add --update jq nodejs npm g++ && \
    #include libc6-compat as a dep https://github.com/pulumi/pulumi/issues/1986
    apk add libc6-compat && \
    curl -fsSL https://get.pulumi.com | bash -s -- --version $PULUMI_VERSION && \
    mv ~/.pulumi/bin/* /usr/bin

