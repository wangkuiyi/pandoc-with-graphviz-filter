#!/bin/bash

if [[ $# == "0" ]]; then
    workspace=$PWD
elif [[ $# == "1" ]]; then
    workspace=$1
else
    echo "Usage: pandoc_all.bash <directory of .md files>"
    exit 1
fi

if [[ ! -d $workspace ]]; then
    echo "$workspace is not a directory"
    exit 2
fi

echo "Converting Markdown files in $workspace ..."
cd "$workspace"

cmd='pandoc -s -f markdown+smart
         --pdf-engine xelatex
         --filter /graphviz.py 
         -V papersize:a4 '

for i in $(du -a . | grep '\.md$' | cut -f 2); do
    target=$(echo $i | sed 's/md$/pdf/')
    echo $cmd $i -o $target # && echo "Done: $i -> $target" || echo "Failed to convert: $i"
    $cmd $i -o $target # && echo "Done: $i -> $target" || echo "Failed to convert: $i"
done
