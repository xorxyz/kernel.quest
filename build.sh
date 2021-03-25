#!/bin/sh

mkdir -p public
cp style.css public/style.css
cp script.js public/script.js

for src in assets/*; do
  dest=$(echo "$src" | sed "s/assets/public/")
  cp "$src" "$dest"
done

pages="index game blog logs"
today=$(date "+%Y-%m-%d%n")

for p in $pages; do
  head=$(sed "s/{{ PAGE_TITLE }}/$p/" head.html)
  content=$(echo "$head" | cat - nav.html "$p.html" foot.html)

  echo "$content" \
    | sed "s/{{ LAST_UPDATE }}/$(printf '%-17s' "$today")/" \
    > "public/$p.html"
done
