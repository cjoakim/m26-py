#!/bin/bash

source venv/bin/activate

python setup.py sdist

# For sdist deployment to PyPi, or local PyPi server:
# python setup.py sdist
# python setup.py sdist upload
# python setup.py sdist upload -r local
# python setup.py sdist upload -r pypilegacy
# ls -al /Users/cjoakim/pypi-packages
# rm /Users/cjoakim/pypi-packages/m26*
