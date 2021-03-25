#!/bin/sh

today=$(date "+%Y-%m-%d%n")
head=$(sed "s/{{ PAGE_TITLE }}//" head.html)
content=$(echo "$head" | cat - nav.html "index.html" foot.html)

cp -r assets public
cp style.css script.js public
echo "$content" \
  > "public/index.html"

pages="game blog logs gp sheep"

for p in $pages; do
  head=$(sed "s/{{ PAGE_TITLE }}/$p/" head.html)
  content=$(echo "$head" | cat - nav.html "$p.html" foot.html)

  echo "$content" \
    | sed "s/{{ LAST_UPDATE }}/$(printf '%-17s' "$today")/" \
    > "public/$p.html"
done
