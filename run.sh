#! /bin/sh
CALIBRE_LIB=/raid6/CalibreLibrary
CALIBRE_CONF=~/.config/calibre

# thanks for [Huisin](https://nnt339es.hatenablog.com/entry/2022/04/30/013450)
CALIBRE_HOME=/root
#xhost +local:
mkdir -p ${CALIBRE_CONF}
podman run --rm \
       -it \
       --net host \
       -v "${CALIBRE_LIB}":/CalibreLibrary/ \
       -v "${CALIBRE_CONF}":${CALIBRE_HOME}/.config/calibre/ \
       --mount type=bind,src=$HOME/.Xauthority,dst=/root/.Xauthority.copy \
       -e DISPLAY=$DISPLAY \
       calibre \
       /bin/bash -c " \
       cp /root/.Xauthority.copy ${CALIBRE_HOME}/.Xauthority;  # ここがポイント2
       chown root:root ${CALIBRE_HOME}/.Xauthority; # ここがポイント3
       /usr/bin/calibre
       "
