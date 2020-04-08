README.html : README.md
	pandoc README.md -s --smart --mathjax \
	 --css nrstyle.css \
         --highlight-style pygments \
         --columns=200 \
         --filter graphviz.py \
         -o README.html
