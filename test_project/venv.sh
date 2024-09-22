#!/bin/bash

# Recreate the python virtual environment and reinstall libs on mac/linux.
# Chris Joakim

# delete previous venv directory
mkdir -p venv 
rm -rf venv 

echo 'upgrading pip ...'
python3 -m pip install --upgrade pip

echo 'creating new python3 virtual environment in the venv directory ...'
python3 -m venv venv

echo 'activating new venv ...'
source venv/bin/activate

echo 'displaying python location and version'
which python
python --version

echo 'displaying pip location and version'
which pip
pip --version

echo 'pip-compile requirements.in ...'
pip-compile --output-file requirements.txt requirements.in

echo 'pip install requirements.txt ...'
pip install -q -r requirements.txt

echo 'installing m26 from test.pypi.org ...'
python3 -m pip install --index-url https://test.pypi.org/simple/ --no-deps m26

echo 'activating venv ...'
source venv/bin/activate

echo 'pip list ...'
pip list

echo 'done'
