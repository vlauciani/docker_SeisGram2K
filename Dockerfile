FROM debian:jessie

MAINTAINER Valentino Lauciani <valentino.lauciani@ingv.it>

ENV DEBIAN_FRONTEND=noninteractive
ENV INITRD No
ENV FAKE_CHROOT 1

RUN apt-get update \
    && apt-get dist-upgrade -y --no-install-recommends \
    && apt-get install -y \
        build-essential \
        vim \
	git \
	telnet \
        dnsutils \
        wget \
	default-jre

# Set .bashrc
RUN echo "" >> /root/.bashrc \
     && echo "alias ll='ls -l --color'" >> /root/.bashrc \
     && . /root/.bashrc

# Install SeisGram2K
WORKDIR /opt
RUN wget "http://alomax.free.fr/seisgram/beta/SeisGram2K70.jar" \
     && chmod +x /opt/SeisGram2K70.jar 

ENV CLASSPATH=/opt/SeisGram2K70.jar

ENTRYPOINT ["java", "net.alomax.seisgram2k.SeisGram2K"]
