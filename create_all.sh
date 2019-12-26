#!/bin/bash
set -e

for arch in "armv7" "armhf" "aarch64" "i386" "amd64"
do
    ./create_hassio_addon.sh -a $arch "$@" &
done
wait
