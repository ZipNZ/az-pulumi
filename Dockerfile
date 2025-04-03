FROM mcr.microsoft.com/azure-cli:2.54.0

ENV PULUMI_VERSION=3.94.2

# Install Pulumi and dependencies
RUN apk update && \
    apk add --update jq nodejs go npm g++ gnupg curl git && \
    # Include libc6-compat as a dependency https://github.com/pulumi/pulumi/issues/1986
    apk add libc6-compat && \
    curl -fsSL https://get.pulumi.com | bash -s -- --version $PULUMI_VERSION && \
    mv ~/.pulumi/bin/* /usr/bin

ENV GOROOT=/usr/lib/go
ENV GOPATH=/go
ENV PATH=/go/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
