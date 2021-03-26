#!/bin/sh

today=$(date "+%Y-%m-%d%n")

cp -r assets public
cp ./*.css ./*.js public

nav=$(cat nav.html)
foot=$(cat foot.html)
txt=$(git count-objects)

head=$(sed "s/{{ PAGE_TITLE }}//" head.html)
content=$(echo "$head" | cat - nav.html "index.html" foot.html)
echo "$content" > "public/index.html"

head=$(sed "s/{{ PAGE_TITLE }}/logs/" head.html)
logs=$(sed "s/{{ LOGS }}/$txt/" logs.html )
content=$(printf "%s\n%s\n%s\n%s\n" "$head" "$nav" "$logs" "$foot")
echo "$content" > "public/logs.html"

pages="game blog wiki gp sheep herbs"

for p in $pages; do
  head=$(sed "s/{{ PAGE_TITLE }}/$p/" head.html)
  content=$(echo "$head" | cat - nav.html "$p.html" foot.html)

  echo "$content" \
    | sed "s/{{ LAST_UPDATE }}/$(printf '%-17s' "$today")/" \
    > "public/$p.html"
done
