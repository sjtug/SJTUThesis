FROM ubuntu:16.04
LABEL maintainer="Ce Gao(gaocegege) <gaocegege@hotmail.com>"

ARG VERSION=${version:-"2018"}
ARG PLATFORM=${platform:-"x86_64-linux"}

ENV PATH=${PATH}:"/usr/local/texlive/${VERSION}/bin/${PLATFORM}"
ENV REMOTE="http://mirror.ctan.org/systems/texlive/tlnet"
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

COPY .ci/ /etc/
RUN ${INSTALL}/install-tl -profile /etc/tl.profile

RUN tlmgr install latexmk ulem

WORKDIR /workdir

ENTRYPOINT ["make"]
CMD ["all"]
