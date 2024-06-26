# 源码编译

## AX630C（交叉编译）

### 1. 编译环境
- cmake >= 3.13
- 交叉编译工具链，可按如下操作下载和配置
```shell
wget https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu.tar.xz
sudo tar -xvf gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu.tar.xz -C /opt/
export PATH="/opt/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu/bin/:$PATH"
```

### 2. 下载源码
```shell
git clone https://github.com/AXERA-TECH/ax-npu-kit-620e.git
cd ax-npu-kit-620e
```

### 3. 编译
```shell
chmod +x build_ax630c.sh
./build_ax630c.sh
```

编译完成后会在 build/install 下生成如下文件：
```shell
build/install
├── bin
│   └── hvcfp_demo
├── include
│   ├── ax_skel_api.h
│   ├── ax_skel_err.h
│   └── ax_skel_type.h
└── lib
    └── libax_skel.so
```

## AX620Q（交叉编译）

### 1. 编译环境
- cmake >= 3.13
- 交叉编译工具链（请从FAE获取），可按如下操作下载和配置
```shell
sudo tar -zxvf arm-linux-gnueabihf-uclibc-8.3.0.tar.gz -C /opt/
export PATH="/opt/arm-linux-gnueabihf-uclibc-8.3.0/bin/:$PATH"
```

### 2. 下载源码
```shell
git clone https://github.com/AXERA-TECH/ax-npu-kit-620e.git
cd ax-npu-kit-620e
```

### 3. 编译
```shell
chmod +x build_ax620q.sh
./build_ax620q.sh
```

编译完成后会在 build/install 下生成如下文件：
```shell
build/install
├── bin
│   └── hvcfp_demo
├── include
│   ├── ax_skel_api.h
│   ├── ax_skel_err.h
│   └── ax_skel_type.h
└── lib
    └── libax_skel.so
```