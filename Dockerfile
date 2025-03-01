FROM ubuntu:disco

FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
        git \
        jq \
        wget \
        curl \
        xz-utils

RUN wget "http://releases.llvm.org/9.0.0/clang+llvm-9.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz" -o clang.tar.xz >/dev/null && \
    tar -xvJf clang.tar.xz && \
    cd clang* && \
    cp -R * /usr/local

COPY LICENSE README.md /

# COPY .clang-format /.clang-format

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
