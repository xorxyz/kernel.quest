#!/bin/sh

mkdir -p public
cp style.css public/style.css
cp script.js public/script.js

for src in assets/*; do
  dest=$(echo "$src" | sed "s/assets/public/")
  cp "$src" "$dest"
done

pages="index start blog"

for p in $pages; do
  head=$(sed "s/{{ PAGE_TITLE }}/$p/" head.html)
  echo "$head" | cat - nav.html "$p.html" foot.html > "public/$p.html"
done
