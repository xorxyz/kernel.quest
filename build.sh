#!/bin/sh

mkdir -p public       && \
cp -r assets/ public/ && \
cp -r js/*    public/

head="components/head.html"
nav="components/nav.html"
foot="components/foot.html"

print_page() (
  sed "s/{{ PAGE_TITLE }}/$1/" "$head" | cat - "$nav" "$2" "$foot"
)

set_var() ( 
  next=$(printf "%-${#1}s" "$2")
  echo "s/$1/$next/"
)

pages="game blog wiki edit logs gp sheep herbs"
today=$(date "+%Y-%m-%d%n")

print_page " " "pages/index.html" > "public/index.html"

for p in $pages; do
  print_page "$p" "pages/$p.html" \
    | sed "$(set_var 'LAST_UPDATE' "$today")" \
    > "public/$p.html"
done
