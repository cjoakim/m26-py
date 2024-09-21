#!/bin/bash

# https://packaging.python.org/en/latest/tutorials/packaging-projects/
# Uses file pyproject.toml

rm -rf dist/

python3 -m build

# Check the contents of the build file:
#   cd dist/
#   gunzip m26-0.3.0.tar.gz
#   tar tvf m26-0.3.0.tar
