#!/usr/bin/env bash

wget "https://github.com/pyca/cryptography/archive/${CRYPTOGRAPHY_VERSION}.tar.gz" -O "cryptography-${CRYPTOGRAPHY_VERSION}.tar.gz"
tar xvf "cryptography-${CRYPTOGRAPHY_VERSION}.tar.gz"

pushd "cryptography-${CRYPTOGRAPHY_VERSION}"
python setup.py bdist_wheel
popd
