#! /bin/bash

set -e -x

unset REQUESTS_CA_BUNDLE
unset SSL_CERT_FILE

python -m pip install -U pip nose
pip install -U gensim
curl https://raw.githubusercontent.com/gyanesh-m/gensim-feedstock/osx-build-test/recipe/test_fast.py>test_fast.py
curl https://raw.githubusercontent.com/RaRe-Technologies/gensim/develop/gensim/test/test_doc2vec.py>test_word2vec.py

python test_fast.py

python -m cProfile -o prof.out test_word2vec.py

curl --upload-file prof.out https://transfer.sh/word2vec.out

# python -m gensim.test.test_doc2vec 
# python -m gensim.test.test_fasttext
# python -m unittest gensim.test.test_word2vec
#nosetests --exe -v gensim
