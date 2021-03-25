#!/bin/sh

files="index test"

mkdir -p public
cp style.css public/style.css

for f in $files; do 
  cat head.html "$f.html" foot.html > "public/$f.html"
done
