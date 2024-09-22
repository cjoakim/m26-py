#!/bin/bash

# https://packaging.python.org/en/latest/tutorials/packaging-projects/
# Uses file pyproject.toml

rm -rf dist/

python3 -m build

if [ "$1" = "explode" ]
then
    # explode the tar file and list its contents
    cd dist/
    gunzip m26-0.3.0.tar.gz
    tar tvf m26-0.3.0.tar > m26.tar.contents.txt
    tar xvf m26-0.3.0.tar
    cat m26.tar.contents.txt
    cd ..
fi
