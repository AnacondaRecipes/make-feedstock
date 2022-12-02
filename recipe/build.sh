#!/usr/bin/bash

set -x

cd $SRC_DIR

cp -r ${BUILD_PREFIX}/share/libtool/build-aux/config.* ./config

# fixing cyclic dependencies on itself ...
conda create -p $SRC_DIR/tools make --yes --quiet
export PATH=$SRC_DIR/tools/bin:$PATH

./configure --prefix=${PREFIX} \
            --host=${HOST}
make -j${CPU_COUNT} ${VERBOSE_AT}
make check
make install
