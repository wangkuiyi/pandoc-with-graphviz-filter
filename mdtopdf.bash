#!/bin/bash

set -e

cmd='pandoc -s -f markdown+smart
         --pdf-engine xelatex
         --filter /graphviz.py 
         -V papersize:a4 '

convert_dir() {
    (
	cd $1
	for i in $(du -a . | grep '\.md$' | cut -f 2); do
	    target=$(echo $i | sed 's/md$/pdf/')
	    echo $cmd $i -o $target
	    $cmd $i -o $target
	done
    )
}

convert_file() {
    (
	cd $(dirname $1)
	target=$(echo $1 | sed 's/md$/pdf/')
	echo $cmd $1 -o $target
	$cmd $1 -o $target
    )
}

if [[ $# == "0" ]]; then
    echo "Usage: $0 markdown_file_or_dir_list"
    convert_dir $PWD
else
    while (( "$#" )); do
	if [[ -d $1 ]]; then
	    convert_dir $1
	else
	    convert_file $1
	fi
	shift
    done
fi
