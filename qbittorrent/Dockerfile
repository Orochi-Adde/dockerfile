FROM 80x86/qbittorrent:4.3.0-focal-20200925-amd64-nova
LABEL maintainer="Evine Deng <evinedeng@foxmail.com>"
RUN apt update \
    && apt upgrade -y \
    && apt install -y bc
ENV HOME=/config
WORKDIR /config