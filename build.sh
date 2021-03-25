#!/bin/sh

mkdir -p public
cp style.css public/style.css
cp script.js public/script.js

assets="favicon.ico"

for a in $assets; do
  cp "assets/$a" "public/$a"
done

pages="index start blog"

for p in $pages; do
  head=$(sed "s/{{ PAGE_TITLE }}/$p/" head.html)
  echo "$head" | cat - nav.html "$p.html" foot.html > "public/$p.html"
done
