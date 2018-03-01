#! /bin/bash

set -e -x

unset REQUESTS_CA_BUNDLE
unset SSL_CERT_FILE

python -m pip install -U pip nose
pip install -U gensim
python -m unittest -v test_fast.TestFastVersion
python -m unittest -v gensim.test.test_doc2vec.TestDoc2VecModel 
nosetests --exe -v gensim
