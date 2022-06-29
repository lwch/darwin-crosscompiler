ARG toolchain_version="11.3"

FROM debian:stable-slim

# build from https://github.com/tpoechtrager/osxcross
ARG toolchain_version
ARG clang_download_url="https://www.dropbox.com/s/t2mc6x7yabt57jz/clang.tar.gz"
ARG toolchain_download_url="https://www.dropbox.com/s/yl3h8i1lwwr0u5u/toolchain.${toolchain_version}.tar.gz"

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y curl && \
    curl -L ${toolchain_download_url}|tar -xz -C /usr/local

ENV PATH=$PATH:/usr/local/clang/bin:/usr/local/toolchain/bin

ENTRYPOINT /bin/bash