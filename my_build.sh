#!/bin/bash

# export OPENSSL_VERSION="openssl-3.3.1"
export OPENSSL_VERSION="openssl-1.1.1e"
./generate-headers.sh
# https://github.com/openssl/openssl/releases/download/openssl-3.3.1/openssl-3.3.1.tar.gz

export ANDROID_NDK_HOME=/dev_sdks/android/ndk/21.4.7075529
./build-android-clang.sh

rm ~/dev/simple_wyvern/build/openssl/libcrypto.a
rm ~/dev/simple_wyvern/build/openssl/libcrypto.so
rm ~/dev/simple_wyvern/build/openssl/libopenssl.a
rm ~/dev/simple_wyvern/build/openssl/libopenssl.so

cd libs

cp android/clang/arm64-v8a/* ~/dev/simple_wyvern/build/openssl
mv ~/dev/simple_wyvern/build/openssl/libssl.so ~/dev/simple_wyvern/build/openssl/libopenssl.so
mv ~/dev/simple_wyvern/build/openssl/libssl.a ~/dev/simple_wyvern/build/openssl/libopenssl.a

cp -Lr "../${OPENSSL_VERSION}"/include .
rm -rf ~/dev/simple_wyvern/build/openssl/include
cp -r include ~/dev/simple_wyvern/build/openssl


