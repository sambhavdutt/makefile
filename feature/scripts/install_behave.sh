#!/bin/bash
#
# Copyright IBM Corp. All Rights Reserved.
#
# SPDX-License-Identifier: Apache-2.0
#


#
# This script is used on Debian based linux distros.
# (i.e., linux that supports the apt packaging manager.)
#
# Create virtual Environment to test behave tests

git submodule update --init --recursive

# Create virtual Environment to test behave tests

virtualenv -p /usr/bin/python2.7 venv
export PS1="test"
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2.7
source venv/bin/activate

pip install behave
pip install grpcio-tools
pip install "pysha3==1.0b1"
pip install b3j0f.aop
pip install jinja2
pip install "pyopenssl==17.2.0"
pip install ecdsa
pip install python-slugify
pip install pyyaml
pip install pykafka
pip install requests
pip install pyexecjs
pip install cython
pip install pyjnius

# Execute behave smoke tests
cd feature
behave --junit --junit-directory . -t smoke
cd -
deactivate
