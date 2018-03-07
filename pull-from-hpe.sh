#!/bin/sh

git checkout build-image.sh
git checkout run-container.sh
git pull hpe master
chmod +x build-image.sh
chmod +x run-container.sh
