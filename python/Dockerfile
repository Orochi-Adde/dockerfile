FROM python:alpine
LABEL maintainer="Evine Deng <evinedeng@foxmail.com>"
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.bfsu.edu.cn/g' /etc/apk/repositories \
    && apk update -f \
    && apk --no-cache add -f bash \
                             openssl \
                             coreutils \
                             moreutils \
                             git \
                             wget \
                             curl \
                             nano \
                             tzdata \
                             perl \
    && rm -rf /var/cache/apk/*
ENV HOME=/root LANG=zh_CN.UTF-8 SHELL=/bin/bash PS1="\u@\h:\w \$ "
COPY python/entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && pip config set global.index-url https://mirrors.bfsu.edu.cn/pypi/web/simple \
    && python -m pip install --upgrade pip
WORKDIR /root
VOLUME /root
ENTRYPOINT /entrypoint.sh