#!/bin/bash

set -e

# export OPENSSL_VERSION="openssl-1.0.2o"
curl -LO "https://www.openssl.org/source/${OPENSSL_VERSION}.tar.gz"
# curl -O "https://github.com/openssl/openssl/releases/download/openssl-3.3.1/openssl-3.3.1.tar.gz"
tar xfz "${OPENSSL_VERSION}.tar.gz"
# tar xfz "openssl-3.3.1.tar.gz"

rm -rf libs/include

cd "${OPENSSL_VERSION}"

# Clean:
make clean

# Generate headers:
./Configure dist

# Copy headers resolving symbolic links to files' content:
cp -Lr include/openssl ../libs

# Clean:
make clean

cd ../

exit 0
