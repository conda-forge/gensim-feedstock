#! /bin/bash

set -e -x

unset REQUESTS_CA_BUNDLE
unset SSL_CERT_FILE

python -m pip install -U pip nose
pip install -U gensim
curl https://raw.githubusercontent.com/gyanesh-m/gensim-feedstock/osx-build-test/recipe/test_fast.py>test_fast.py
curl https://raw.githubusercontent.com/gyanesh-m/gensim-feedstock/osx-build-test/recipe/test_w2v.py>test_w2v.py

python test_fast.py
# python -m gensim.test.test_doc2vec 
# python -m gensim.test.test_fasttext
#python -m unittest gensim.test.test_word2vec
python test_w2v.py
#nosetests --exe -v gensim
