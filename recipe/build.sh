#!/usr/bin/bash

set -ex

cp -r ${BUILD_PREFIX}/share/libtool/build-aux/config.* ./build-aux

if [[ "$target_platform" == linux* ]]; then
  rm -f tests/scripts/functions/wildcard
elif [[ "$target_platform" == osx* ]]; then
  rm -f tests/scripts/variables/INCLUDE_DIRS
fi

if [[ ${target_platform} =~ linux* || ${target_platform} =~ .*aarch64.* || ${target_platform} =~ .*ppc64le.* ]]; then
  config_opts="--disable-dependency-tracking"
fi

./configure --prefix=${PREFIX} \
            --host=${HOST} \
            ${config_opts}

# build.sh in source code used for bootstrapping
bash build.sh

./make check
./make install
