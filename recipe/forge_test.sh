#! /bin/bash

set -e -x

unset REQUESTS_CA_BUNDLE
unset SSL_CERT_FILE

python -m pip install -U pip nose
pip install -U gensim
curl https://raw.githubusercontent.com/gyanesh-m/gensim-feedstock/osx-build-test/recipe/test_fast.py>test_fast.py
python test_fast.py
curl https://raw.githubusercontent.com/gyanesh-m/gensim-feedstock/osx-build-test/recipe/profiler.py>profiler.py
python profiler.py
tar -zcvf prof.tar.gz ./combined-*
curl --upload-file prof.tar.gz https://transfer.sh/prof.tar.gz