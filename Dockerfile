FROM docker.io/ubuntu:22.04
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y calibre && \
    apt-get autoremove --yes && apt-get clean autoclean && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/
WORKDIR /root
CMD ["/usr/bin/calibre"]

