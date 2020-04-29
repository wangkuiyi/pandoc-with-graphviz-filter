# The GraphViz filter for Pandoc is in Python.
FROM python:3.8

# Pandoc calls XeLaTex to generate PDF files.
RUN apt-get update && apt-get install -y texlive-xetex

# Install the most recent version of Pandoc.
RUN curl -s -L https://github.com/jgm/pandoc/releases/download/2.9.2.1/pandoc-2.9.2.1-linux-amd64.tar.gz | tar -C /usr/local -xz
ENV PATH=/usr/local/pandoc-2.9.2.1/bin:$PATH

# Install GraphViz and its Pyton binding, which depends on libgrpahviz-dev.
RUN apt-get install -y graphviz libgraphviz-dev
RUN python -m pip install pygraphviz pandocfilters

# Install CJK fonts.
RUN curl -s -L https://noto-website-2.storage.googleapis.com/pkgs/NotoSansSC.zip > f.zip && \
	unzip f.zip && \
	mv *.otf  /usr/local/share/fonts/

COPY graphviz.py /graphviz.py
COPY pandoc_all.bash /pandoc_all.bash
# Require -v $MARKDOWN_FILE_DIR:/work when docker run
CMD ["/pandoc_all.bash", "/work"]
