#!/bin/sh

# 安装依赖
# sudo apt-get update -qq
# sudo apt-get install -qqy \
#     git wget bzip2 file libwine-dev unzip libtool libtool-bin libltdl-dev pkg-config ant \
#     build-essential automake texinfo ragel yasm p7zip-full autopoint \
#     gettext cmake zip wine nsis g++-mingw-w64-i686 curl gperf flex bison \
#     libcurl4-gnutls-dev python3 python3-setuptools python3-mako python3-requests \
#     gcc make procps ca-certificates \
#     openjdk-11-jdk-headless nasm jq gnupg \
#     meson autoconf

# 安装build tools
# wget https://github.com/mstorsjo/llvm-mingw/releases/download/20220906/llvm-mingw-20220906-msvcrt-ubuntu-18.04-x86_64.tar.xz
# 解压到了系统根目录下
# tar xvf llvm-mingw-20220906-msvcrt-ubuntu-18.04-x86_64.tar.xz -C /opt
# export PATH=/opt/llvm-mingw-20220906-msvcrt-ubuntu-18.04-x86_64/bin:$PATH

sudo apt-get install -qqy \
        gcc-mingw-w64-x86-64 g++-mingw-w64-x86-64 mingw-w64-tools
mkdir build
cd build
../extras/package/win32/build.sh -a x86_64

