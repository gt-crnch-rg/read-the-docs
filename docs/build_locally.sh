#!/bin/bash
#This script shows how to build and look at the docs locally.
#Assumes Ubuntu 20.04 or 22.04 as the base OS

sudo apt install python3.10 python3.10-venv

python3.10 -m venv rtd-project
source rtd-project/bin/activate
python -m pip install --upgrade --no-cache-dir pip setuptools
python -m pip install --upgrade --no-cache-dir pillow mock alabaster commonmark recommonmark sphinx sphinx-rtd-theme readthedocs-sphinx-ext jinja2

##Update the packages using a requirements.txt file
python -m pip install --exists-action=w --no-cache-dir -r docs/requirements.txt

#Clone the repo
git clone --depth 1 https://github.com/gt-crnch-rg/read-the-docs
cd read-the-docs/docs

#Build the docs as HTML
make html
#python -m sphinx -T -E -b html -d _build/doctrees -D language=en . $READTHEDOCS_OUTPUT/html
