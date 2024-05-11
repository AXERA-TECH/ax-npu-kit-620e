#!/bin/bash
if [ ! -d ax620q_bsp_sdk ]; then
  chmod +x ./download_ax_bsp.sh
  ./download_ax_bsp.sh
fi

if [ ! -d third-party ]; then
  chmod +x ./download_third_party.sh
  ./download_third_party.sh
fi

mkdir -p build && cd build
cmake ..  \
  -DCMAKE_TOOLCHAIN_FILE=../toolchains/aarch64-none-linux-gnu.toolchain.cmake \
  -DCMAKE_INSTALL_PREFIX=./install \
  -DCMAKE_BUILD_TYPE=Release \
  -DBUILD_DEMO=ON  \
  -DCHIP_AX630C=ON
make -j4
make install
cd ..