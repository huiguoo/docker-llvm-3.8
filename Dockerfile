FROM ubuntu:14.04

COPY build.sh /tmp/

RUN useradd -m llvm && \
    echo llvm:llvm | chpasswd && \
    cp /etc/sudoers /etc/sudoers.bak && \
    echo 'llvm  ALL=(root) NOPASSWD: ALL' >> /etc/sudoers
USER llvm
WORKDIR /home/llvm
RUN bash /tmp/build.sh 

USER root
RUN rm /tmp/build.sh

USER llvm
