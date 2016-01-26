FROM ubuntu:15.10

MAINTAINER Cristóbal Ganter

RUN echo "deb http://archive.ubuntu.com/ubuntu/ wily multiverse" >> /etc/apt/sources.list
RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
RUN apt-get update && apt-get install --no-install-recommends -y \
    ca-certificates \
    git \
    inkscape \
    make \
    pandoc \
    texlive \
    texlive-generic-extra \
    texlive-xetex \
    ttf-mscorefonts-installer \
    xindy

RUN adduser --disabled-password --gecos "" mtemplate
USER mtemplate
WORKDIR /home/mtemplate

COPY start.sh .
CMD ["./start.sh"]
