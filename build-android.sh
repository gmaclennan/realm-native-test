#!/bin/bash

set -eEu -o pipefail
shopt -s extdebug

readonly NODE_VERSION=12.18.3
readonly NODE_ARCH=arm64
readonly ANDROID_ABI=arm64-v8a
readonly ANDROID_PLATFORM=21
readonly CMAKE_VERSION=3.18.1
readonly NDK_VERSION=21.4.7075529
readonly NODE_INCLUDE_DIR="${PWD}/node_modules/nodejs-mobile-react-native/android/libnode/include/node/"
readonly NODE_BINARY="${PWD}/node_modules/nodejs-mobile-react-native/android/libnode/bin/${ANDROID_ABI}/libnode.so"

cd node_modules/realm

npx cmake-js build \
  -r node \
  -v $NODE_VERSION \
  -a $NODE_ARCH \
  -l verbose \
  -G Ninja \
  --CDNODE_BINARY="${NODE_BINARY}" \
  --CDANDROID_ABI=$ANDROID_ABI \
  --CDANDROID_PLATFORM=$ANDROID_PLATFORM \
  --CDCMAKE_SYSTEM_NAME=Android \
  --CDCMAKE_MAKE_PROGRAM="${ANDROID_SDK_ROOT}/cmake/${CMAKE_VERSION}/bin/ninja" \
  --CDCMAKE_TOOLCHAIN_FILE="${ANDROID_SDK_ROOT}/ndk/${NDK_VERSION}/build/cmake/android.toolchain.cmake" \
  --CDCMAKE_CXX_FLAGS="-DBUILDING_NODE_EXTENSION" \
  --CDCMAKE_JS_INC="${NODE_INCLUDE_DIR}" \
  --CDCMAKE_SHARED_LINKER_FLAGS=" "
