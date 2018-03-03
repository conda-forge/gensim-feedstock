#! /bin/bash

set -e -x

unset REQUESTS_CA_BUNDLE
unset SSL_CERT_FILE

python -m pip install -U pip nose
pip install -U gensim
curl https://raw.githubusercontent.com/gyanesh-m/gensim-feedstock/osx-build-test/recipe/test_fast.py>test_fast.py
curl https://raw.githubusercontent.com/RaRe-Technologies/gensim/develop/gensim/test/test_doc2vec.py>test_doc2vec.py
python test_fast.py
python test_doc2vec.py 
nosetests --exe -v gensim
