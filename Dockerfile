FROM redhat/ubi8-minimal:8.5
COPY *.rpm .
RUN set -eux; \
    \
    microdnf install -y --nodocs findutils; \
    microdnf clean all; \
    arch=$(arch); \
    case $arch in \
        'x86_64') \
            rpm --install --verbose jdk-*x64.rpm \
            ;; \
        'aarch64') \
            rpm --install --verbose jdk-*aarch64.rpm \
            ;; \
        *) echo >&2 "error: unsupported architecture: '$arch'"; exit 1 ;; \
    esac; \
    rm -f *.rpm; \
    javac -version; \
    java -version
