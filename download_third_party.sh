#!/bin/bash
mkdir -p third-party
cd third-party
wget https://github.com/AXERA-TECH/ax-npu-kit-650/releases/download/ax630c_v1.0.0/opencv.tar.gz
tar zxvf opencv.tar.gz
cd ..