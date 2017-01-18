#!/bin/bash


FILE=$1
echo "
export DISPLAY=:0
[[ ! -z \`ps axf | grep midori | grep -v grep \` ]] && killall midori
midori -e Fullscreen -a ${FILE}

"> /tmp/execute



