#! /bin/bash
IMAGE_NAME=calibre
podman build -t ${IMAGE_NAME}:latest . 
if [ $? ]; then
	VERSION=$(podman run --rm -it ${IMAGE_NAME}:latest /usr/bin/calibre --version | sed -e "s/^.* \([0-9.]*\).*$/\1/")
	podman tag ${IMAGE_NAME}:latest ${IMAGE_NAME}:$VERSION
fi
