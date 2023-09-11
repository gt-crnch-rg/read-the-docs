#!/bin/bash
#This script shows how to build and look at the docs locally.
#Assumes Ubuntu 20.04 or 22.04 as the base OS; tested on Mac OSX 13

#Uncomment this line if you need to debug this script
#set -x

#Global variable to point to your Python venv for compiling docs
venv_dir="$HOME/crnchrg-rtd-venv"

#Create and update Python venv, if needed 
setup_venv()
{

	# Check if the venv directory exists
	if [ -d "$venv_dir" ]; 
	then
    		echo "Virtual environment is already set up at $venv_dir"
	else    		
		echo "Creating virtual environment at $venv_dir and updating pip packages"
		python3 -m venv $venv_dir
		python -m pip install --upgrade --no-cache-dir pip setuptools
		python -m pip install --upgrade --no-cache-dir pillow mock alabaster commonmark recommonmark sphinx sphinx-rtd-theme readthedocs-sphinx-ext jinja2

		##Update the packages using a requirements.txt file
		python -m pip install --exists-action=w --no-cache-dir -r requirements.txt
	fi
}

build_docs(){
	source $venv_dir/bin/activate
	#Build the docs as HTML
	#Note that the SPHINXOPTS line treats all warnings as errors.
	#The tee statement writes output both to the terminal and a logfile
	make html SPHINXOPTS="-W" 2>&1 | tee crnchrg-rtd-build.log
	#python -m sphinx -T -E -b html -d _build/doctrees -D language=en . $READTHEDOCS_OUTPUT/html
}

### Run selected functions ###
setup_venv
build_docs
