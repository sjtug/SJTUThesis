FROM ubuntu:16.04
LABEL maintainer="Ce Gao(gaocegege) <gaocegege@hotmail.com>"

ENV REMOTE="https://mirrors.sjtug.sjtu.edu.cn/ctan/systems/texlive/tlnet"
ENV INSTALL="/tmp/install-texlive"

VOLUME ["/workdir"]

RUN apt-get update && apt-get install -y \
    curl \
    perl \
    wget \
    xzdec \
    make \
    libfontconfig1 \
    fonts-arphic-bkai00mp \
    fonts-arphic-bsmi00lp \
    fonts-arphic-gbsn00lp \
    fonts-arphic-gkai00mp \
    fonts-arphic-ukai \
    fonts-arphic-uming \
    ttf-wqy-microhei \
    ttf-wqy-zenhei \
    xfonts-intl-chinese \
    xfonts-intl-chinese-big

RUN mkdir -p ${INSTALL} \
    && curl -sSL $REMOTE/install-tl-unx.tar.gz | tar -xzv -C ${INSTALL} --strip-components=1

COPY .ci/tl.profile /etc/tl.profile

# RUN ${INSTALL}/install-tl -profile /etc/tl.profile -repository https://mirrors.sjtug.sjtu.edu.cn/ctan/systems/texlive/tlnet

RUN export VERSION=$($INSTALL/install-tl --version | grep 'version' | grep -o '[0-9]\{4\}')
RUN export PLATFORM=$($INSTALL/install-tl --print-platform)
RUN export TEXBIN="/usr/local/texlive/${VERSION}/bin/${PLATFORM}"
RUN export "PATH=$TEXBIN:$PATH"

RUN tlmgr install latexmk ulem

WORKDIR /workdir

ENTRYPOINT ["make"]
CMD ["all"]
