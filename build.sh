#!/bin/bash

# See https://packaging.python.org/en/latest/tutorials/packaging-projects/
# Uses file pyproject.toml and ~/.pypirc
#
# Chris Joakim, September 2024

rm -rf dist/

python3 -m build

if [ "$1" = "explode" ]
then
    # explode the tar file and list its contents
    cd dist/
    gunzip m26-0.3.1.tar.gz
    tar tvf m26-0.3.1.tar > m26.tar.contents.txt
    tar xvf m26-0.3.1.tar
    cat m26.tar.contents.txt
    cd ..
else
    echo "next steps:"
    echo "  python3 -m twine upload --repository testpypi dist/*"
    echo "  python3 -m twine upload --repository pypi dist/*"
fi


# $ python3 -m twine upload --repository testpypi dist/*
# Uploading distributions to https://test.pypi.org/legacy/
# Uploading m26-0.3.1-py3-none-any.whl
# 100% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 18.1/18.1 kB • 00:00 • 19.3 MB/s
# Uploading m26-0.3.1.tar.gz
# 100% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 18.6/18.6 kB • 00:00 • 12.1 MB/s

# View at:
# https://test.pypi.org/project/m26/0.3.1/

# python3 -m pip install --index-url https://test.pypi.org/simple/ --no-deps m26