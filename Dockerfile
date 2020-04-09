FROM python:3.7

RUN apt-get update
RUN apt-get install -y pandoc graphviz

RUN pip install pygraphviz pandocfilters
COPY pandoc_all.bash /pandoc_all.bash

# Require -v $MARKDOWN_FILE_DIR:/work when docker run
CMD ["/pandoc_all.bash", "/work"]
