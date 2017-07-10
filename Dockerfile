FROM debian:jessie

MAINTAINER Valentino Lauciani <valentino.lauciani@ingv.it>

#ENV SC_VERSION=seiscomp3-jakarta-2017.124.01-debian8-x86_64.tar 
#ENV INSTALL_DIR=/home/sysop/seiscomp3
#ENV PATH=$PATH:$INSTALL_DIR/bin
#ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$INSTALL_DIR/lib

ENV DEBIAN_FRONTEND=noninteractive
ENV INITRD No
ENV FAKE_CHROOT 1

#COPY environment /etc/environment


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

# Change root password
RUN echo "root:toor" | chpasswd
        
# Set .bashrc
RUN echo "" >> /root/.bashrc \
     && echo "alias ll='ls -l --color'" >> /root/.bashrc \
     #&& echo "export CLASSPATH=/opt/SeisGram2K70.jar" >> /root/.bashrc \
     && . /root/.bashrc

# Install SeisGram2K
WORKDIR /opt
RUN wget "http://alomax.free.fr/seisgram/beta/SeisGram2K70.jar" \
     && chmod +x /opt/SeisGram2K70.jar 

ENV CLASSPATH=/opt/SeisGram2K70.jar

ENTRYPOINT ["java", "net.alomax.seisgram2k.SeisGram2K"]
