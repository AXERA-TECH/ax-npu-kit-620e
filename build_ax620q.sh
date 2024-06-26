#!/bin/bash
chmod +x ./download_ax_bsp.sh
./download_ax_bsp.sh

chmod +x ./download_third_party.sh
./download_third_party.sh

mkdir -p build && cd build
cmake ..  \
  -DCMAKE_TOOLCHAIN_FILE=../toolchains/arm-linux-uclibc-gnueabihf.toolchain.cmake \
  -DCMAKE_INSTALL_PREFIX=./install \
  -DCMAKE_BUILD_TYPE=Release \
  -DBUILD_DEMO=ON  \
  -DCHIP_AX620Q=ON
make -j4
make install
cd ..