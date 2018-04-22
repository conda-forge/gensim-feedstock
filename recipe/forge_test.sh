#! /bin/bash

set -e -x

unset REQUESTS_CA_BUNDLE
unset SSL_CERT_FILE

export OPENBLAS_NUM_THREADS=1


cat > site.cfg << EOF

[DEFAULT]
library_dirs = $PREFIX/lib
include_dirs = $PREFIX/include
[atlas]
atlas_libs = openblas
libraries = openblas
[openblas]
libraries = openblas
library_dirs = $PREFIX/lib
include_dirs = $PREFIX/include
EOF

if [[ $(uname) == 'Darwin' ]]; then
    export CFLAGS="${CFLAGS} -stdlib=libc++ -lc++"
    export LDFLAGS="-headerpad_max_install_names -undefined dynamic_lookup -bundle -Wl,-search_paths_first -lc++"
else
    unset LDFLAGS
fi

python -m pip install -U pip nose
pip install -U gensim
curl https://raw.githubusercontent.com/gyanesh-m/gensim-feedstock/osx-build-test/recipe/test_fast.py>test_fast.py
python test_fast.py
curl https://raw.githubusercontent.com/gyanesh-m/gensim-feedstock/osx-build-test/recipe/profiler.py>profiler.py
python profiler.py
tar -zcvf prof.tar.gz ./combined-*
curl --upload-file prof.tar.gz https://transfer.sh/prof.tar.gz