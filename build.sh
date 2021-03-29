#!/bin/sh

today=$(date "+%Y-%m-%d%n")
pages=$(find pages/* | sed 's/pages\///g;s/.html//' | grep -v index)

print_page() (
  dir="components"
  cat "$dir/head.html" "$dir/nav.html" "$2" "$dir/foot.html" \
  | sed -e "s/{{ PAGE_TITLE }}/$1/"\
        -e "s/{{ LAST_UPDATE }}/$today/"
)

cp -r assets/ public/ && \
cp -r js/*    public/

for p in $pages; do
  print_page "| $p | " "pages/$p.html" > "public/$p.html"
done

print_page "|" "pages/index.html" > "public/index.html"
