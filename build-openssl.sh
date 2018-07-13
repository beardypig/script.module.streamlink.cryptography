#!/usr/bin/env bash
set -e

# setup the android environment variables
. setenv-android.sh

set -x
OPENSSL_DIR="$HOME/ossl-${ANDROID_API}/${OPENSSL_VERSION}"

wget "https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz"
tar zxf "openssl-${OPENSSL_VERSION}.tar.gz"

pushd "openssl-${OPENSSL_VERSION}"
./config shared no-ssl2 no-ssl3 no-comp no-hw no-engine --prefix="$OPENSSL_DIR"
make depend
make
make install
popd
