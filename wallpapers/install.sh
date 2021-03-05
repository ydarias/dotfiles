#!/bin/sh

set -e

DEST=~/Pictures/wallpapers

wget https://www.dropbox.com/s/9t9699vutrtejwi/wallpapers.zip
mkdir -p $DEST
cp wallpapers.zip $DEST/wallpapers.zip
unzip $DEST/wallpapers.zip -d $DEST
rm wallpapers.zip $DEST/wallpapers.zip