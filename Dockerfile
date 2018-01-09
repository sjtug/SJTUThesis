FROM ubuntu:16.04
LABEL maintainer="Ce Gao(gaocegege) <gaocegege@hotmail.com>"

ARG VERSION=${version:-"2017"}
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

RUN mkdir -p ${INSTALL}

RUN curl -sSL $REMOTE/install-tl-unx.tar.gz | tar -xzv -C ${INSTALL} --strip-components=1

RUN echo "selected_scheme scheme-basic" >> ${INSTALL}/tl.profile \
    && echo "collection-basic 1" >> ${INSTALL}/tl.profile \
    && echo "collection-bibtexextra 1" >> ${INSTALL}/tl.profile \
    && echo "collection-fontsextra 1" >> ${INSTALL}/tl.profile \
    && echo "collection-fontsrecommended 1" >> ${INSTALL}/tl.profile \
    && echo "collection-langchinese 1" >> ${INSTALL}/tl.profile \
    && echo "collection-latex 1" >> ${INSTALL}/tl.profile \
    && echo "collection-latexextra 1" >> ${INSTALL}/tl.profile \
    && echo "collection-latexrecommended 1" >> ${INSTALL}/tl.profile \
    && echo "collection-mathscience 1" >> ${INSTALL}/tl.profile \
    && echo "collection-xetex 1" >> ${INSTALL}/tl.profile \
    && echo "tlpdbopt_autobackup 0" >> ${INSTALL}/tl.profile \
    && echo "tlpdbopt_install_docfiles 0" >> ${INSTALL}/tl.profile \
    && echo "tlpdbopt_install_srcfiles 0" >> ${INSTALL}/tl.profile

RUN ${INSTALL}/install-tl -profile ${INSTALL}/tl.profile

RUN tlmgr install latexmk ulem

WORKDIR /workdir

ENTRYPOINT make
CMD all
