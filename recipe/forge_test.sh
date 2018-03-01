#! /bin/bash

set -e -x

unset REQUESTS_CA_BUNDLE
unset SSL_CERT_FILE

python -m pip install -U pip nose
pip install -U gensim
python test_fast.py
python -m unittest -v gensim.test.test_doc2vec.TestDoc2VecModel 
nosetests --exe -v gensim
