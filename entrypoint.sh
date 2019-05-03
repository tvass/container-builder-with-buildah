#!/usr/bin/env bash

if [ -z "$NAME" ] || [ ! -f "/root/Dockerfile" ]
then
    echo "[error] No Dockerfile or target name."
    exit 1
else
    echo "Building ... $NAME"
    buildah bud  --storage-driver vfs --format=docker -f /root/Dockerfile -t $NAME .
    buildah tag --storage-driver vfs localhost/$NAME:latest $REGISTRY/$LOGIN/$NAME:latest
    buildah images --storage-driver vfs
    buildah push --creds=$LOGIN:$PASSWORD --storage-driver vfs docker://$REGISTRY/$LOGIN/$NAME:latest
fi