#!/bin/sh

mkdir -p public
cp style.css public/style.css

files="index start blog"

for f in $files; do
  head=$(sed "s/{{ PAGE_TITLE }}/$f/" head.html)
  echo "$head" | cat - nav.html "$f.html" foot.html > "public/$f.html"
done
