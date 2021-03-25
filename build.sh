#!/bin/sh

mkdir -p public
cp style.css public/style.css

# index is a special case
cat head.html "index.html" foot.html > "public/index.html"

files="start"

for f in $files; do 
  cat head.html nav.html "$f.html" foot.html > "public/$f.html"
done
