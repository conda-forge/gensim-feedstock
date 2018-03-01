#! /bin/bash

set -e -x

unset REQUESTS_CA_BUNDLE
unset SSL_CERT_FILE

python -m pip install -U pip nose
pip install -U gensim
wget https://raw.githubusercontent.com/gyanesh-m/gensim-feedstock/osx-build-test/recipe/test_fast.py
pwd
python test_fast.py
python -m unittest -v gensim.test.test_doc2vec.TestDoc2VecModel 
nosetests --exe -v gensim
