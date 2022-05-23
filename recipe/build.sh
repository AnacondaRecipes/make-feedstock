#!/usr/bin/bash

set -x

mkdir -p config
cp -r ${BUILD_PREFIX}/share/libtool/build-aux/config.* ./config

./configure --prefix=${PREFIX} \
            --host=${HOST}
make -j${CPU_COUNT} ${VERBOSE_AT}
make check
make install
