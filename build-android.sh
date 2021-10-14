#! /bin/sh

export CMAKE_JS_ARGS="-r node -v 12.16.3 -a arm64 -G Ninja --CDANDROID_ABI=arm64-v8a --CDANDROID_PLATFORM=21 --CDCMAKE_SYSTEM_NAME=Android --CDCMAKE_MAKE_PROGRAM=${ANDROID_SDK}/cmake/3.18.1/bin/ninja --CDCMAKE_TOOLCHAIN_FILE=${ANDROID_SDK}/ndk/21.4.7075529/build/cmake/android.toolchain.cmake --CDCMAKE_CXX_FLAGS='-DBUILDING_NODE_EXTENSION' --CDCMAKE_JS_INC=${PWD}/node_modules/nodejs-mobile-react-native/android/libnode/include/node"

echo $CMAKE_JS_ARGS
npm rebuild --build-from-source
