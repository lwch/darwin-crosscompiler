FROM debian:stable-slim

# build from https://github.com/tpoechtrager/osxcross
ARG clang_download_url="https://www.dropbox.com/scl/fi/gow9a8o94sz2rd6i78d1g/clang.tar.gz?rlkey=zmr4ab1xmprfslngy2l0lh73p&dl=0"
ARG toolchain_download_url="https://www.dropbox.com/scl/fi/ds4r3dw25p0s7h9jwfr3b/toolchain.12.4.tar.gz?rlkey=qeux5ifie1r89tj9qa1pt6w00&dl=0"

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y curl libxml2 && \
    curl -L ${toolchain_download_url}|tar -xz -C /usr/local && \
    curl -L ${clang_download_url}|tar -xz -C /usr/local && \
    apt-get clean

ENV PATH=$PATH:/usr/local/clang/bin:/usr/local/toolchain/bin
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/clang/lib:/usr/local/toolchain/lib

CMD /bin/bash