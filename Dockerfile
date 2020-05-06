# The GraphViz filter for Pandoc is in Python.
FROM python:3.8-slim-buster

# Pandoc calls XeLaTex to generate PDF files.  Our Pandoc filter
# requires GraphViz and its Python binding, which depends on
# libgrpahviz-dev.
RUN apt-get -qq update && \
        apt-get -qq install -y texlive-xetex graphviz libgraphviz-dev curl build-essential && \
        apt-get -qq clean && \
        apt-get -qq autoremove && \
        rm -rf /var/lib/apt/lists/* /tmp/*

# Install the most recent version of Pandoc.
RUN curl -s -L https://github.com/jgm/pandoc/releases/download/2.9.2.1/pandoc-2.9.2.1-linux-amd64.tar.gz | tar -C /usr/local -xz
ENV PATH=/usr/local/pandoc-2.9.2.1/bin:$PATH

RUN python -m pip --quiet install --upgrade pip && \
        python -m pip --quiet install pygraphviz pandocfilters

# Install CJK fonts.
RUN curl -s -L https://noto-website-2.storage.googleapis.com/pkgs/NotoSansSC.zip > f.zip && \
        unzip -qq f.zip && \
        mv *.otf  /usr/local/share/fonts/ && \
        rm f.zip

COPY graphviz.py /graphviz.py
COPY mdtopdf.bash /mdtopdf.bash
# Require -v $MARKDOWN_FILE_DIR:/work when docker run
CMD ["/mdtopdf.bash", "/work"]
