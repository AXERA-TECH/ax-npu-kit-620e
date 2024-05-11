#!/bin/bash
if [ ! -d ax620q_bsp_sdk ]; then
  echo "clone ax620q bsp to ax620q_bsp_sdk, please wait..."
  wget -c https://github.com/AXERA-TECH/ax620q_bsp_sdk/archive/refs/tags/v2.0.0.tar.gz
  tar zxvf v2.0.0.tar.gz
  mv ax620q_bsp_sdk-2.0.0 ax620q_bsp_sdk
  cp inc/ax_skel_type.h ax620q_bsp_sdk/msp/out/arm_glibc/include/
  cp inc/ax_skel_type.h ax620q_bsp_sdk/msp/out/arm_uclibc/include/
  cp inc/ax_skel_type.h ax620q_bsp_sdk/msp/out/arm64_glibc/include/
fi