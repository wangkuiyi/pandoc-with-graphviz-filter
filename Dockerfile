FROM python:3.7

RUN apt-get update
RUN apt-get install -y pandoc graphviz

RUN pip install pygraphviz pandocfilters
COPY graphviz.py /graphviz.py
