FROM ubuntu:16.04

MAINTAINER fchalub@br.ibm.com

WORKDIR /root/

RUN apt-get update -y && apt-get install -y git libgmp-dev libmpfr-dev cmake build-essential emacs libgl1-mesa-glx openssh-server && apt-get clean

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

RUN cd /root && \
    git clone https://github.com/leanprover/lean.git && \
    cd /root/lean && \
    mkdir -p build/release && cd build/release && cmake ../../src && make

RUN mkdir -p /var/run/sshd && mkdir -p /root/.ssh && chmod 0700 /var/run/sshd /root/.ssh
COPY id_rsa.pub /root/.ssh/authorized_keys

CMD ["/usr/sbin/sshd", "-D"]
