#!/bin/bash
mkdir -p third-party
cd third-party
if [ ! -d opencv ]; then
  wget -c https://github.com/AXERA-TECH/ax-npu-kit-620e/releases/download/v1.0.0/opencv.tar.gz
  tar zxvf opencv.tar.gz
fi
cd ..