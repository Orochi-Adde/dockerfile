FROM python:alpine
LABEL maintainer="Evine Deng <evinedeng@foxmail.com>"
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.bfsu.edu.cn/g' /etc/apk/repositories \
    && apk update -f \
    && apk --no-cache add -f bash \
                             openssl \
                             coreutils \
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
    && pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U \
    && pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
WORKDIR /root
VOLUME /root
ENTRYPOINT /entrypoint.sh