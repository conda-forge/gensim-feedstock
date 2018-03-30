#! /bin/bash

set -e -x

unset REQUESTS_CA_BUNDLE
unset SSL_CERT_FILE

python -m pip install -U pip nose
pip install -U gensim
pip install -U pytest
pip install pytest-profiling
curl https://raw.githubusercontent.com/gyanesh-m/gensim-feedstock/osx-build-test/recipe/test_fast.py>test_fast.py
#curl https://raw.githubusercontent.com/RaRe-Technologies/gensim/develop/gensim/test/test_doc2vec.py>test_word2vec.py

python test_fast.py
curl https://raw.githubusercontent.com/gyanesh-m/gensim-feedstock/osx-build-test/recipe/profiler.py>profiler.py
python profiler.py
tar -zcvf proff.tar.gz ./prof
curl --upload-file prof.out https://transfer.sh/proff.tar.gz

# python -m gensim.test.test_doc2vec 
# python -m gensim.test.test_fasttext
# python -m unittest gensim.test.test_word2vec
#nosetests --exe -v gensim
