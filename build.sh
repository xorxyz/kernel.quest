#!/bin/sh

mkdir -p public && \
cat head.html body.html foot.html > public/index.html && \
cp style.css public/style.css
