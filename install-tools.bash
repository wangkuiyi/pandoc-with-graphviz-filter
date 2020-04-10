#!/bin/bash
set -e
apt-get update
apt-get install -y pandoc graphviz libgraphviz-dev
pip install --upgrade pip
pip install pygraphviz pandocfilters
