#!/usr/bin/env bash
set -e

# setup the android environment variables
. setenv-android.sh

set -x
OPENSSL_DIR="$HOME/ossl-${ANDROID_API}/${OPENSSL}"

wget "https://www.openssl.org/source/openssl-${OPENSSL}.tar.gz"
tar zxf "openssl-${OPENSSL}.tar.gz"

pushd "openssl-${OPENSSL}"
./config shared no-ssl2 no-ssl3 no-comp no-hw no-engine --prefix="$OPENSSL_DIR"
make depend
make
make install_sw
popd
