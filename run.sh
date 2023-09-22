#! /bin/sh
CALIBRE_LIB=/raid6/CalibreLibrary
CALIBRE_CONF=~/.config/calibre
IMPORT_DIR=$1

# thanks for [Huisin](https://nnt339es.hatenablog.com/entry/2022/04/30/013450)
CALIBRE_HOME=/root
#xhost +local:
EXT_OPTS=
if [ ! -z "${IMPORT_DIR}" ]; then
	EXT_OPTS="-v '${IMPORT_DIR}:/imports/"
fi
mkdir -p ${CALIBRE_CONF}
podman run --rm \
       -it \
       --net host \
       -v "${CALIBRE_LIB}":/CalibreLibrary/ \
       $EXT_OPTS \
       -v "${CALIBRE_CONF}":${CALIBRE_HOME}/.config/calibre/ \
       --mount type=bind,src=$HOME/.Xauthority,dst=/root/.Xauthority \
       -e DISPLAY=$DISPLAY \
       calibre \
       /usr/bin/calibre
