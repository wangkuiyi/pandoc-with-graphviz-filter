FROM python:3.7

COPY install-tools.bash /install-tools.bash
RUN /install-tools.bash

COPY pandoc_all.bash /pandoc_all.bash
# Require -v $MARKDOWN_FILE_DIR:/work when docker run
CMD ["/pandoc_all.bash", "/work"]
