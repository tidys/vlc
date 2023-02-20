#!/bin/sh
# 1. 安装依赖
ubuntu=1
mingw32=2
mingw64=3
platform=${ubuntu}

if [ ${platform} -eq ${ubuntu} ]; then
        echo "apt-get install ..."
        sudo apt-get update -qq
        sudo apt-get install -qqy \
                git wget bzip2 file libwine-dev unzip libtool libtool-bin libltdl-dev pkg-config ant \
                build-essential automake texinfo ragel yasm p7zip-full autopoint \
                gettext cmake zip wine nsis g++-mingw-w64-i686 curl gperf flex bison \
                libcurl4-gnutls-dev python3 python3-setuptools python3-mako python3-requests \
                gcc make procps ca-certificates \
                openjdk-11-jdk-headless nasm jq gnupg \
                meson autoconf
        sudo apt-get install -qqy \
                gcc-mingw-w64-x86-64 g++-mingw-w64-x86-64 mingw-w64-tools
else
        echo "pacman dep ..."
        pacman -Syu
        pacman -S --needed git wget bzip2 file unzip libtool pkg-config \
                automake autoconf texinfo yasm p7zip \
                gettext cmake zip curl gperf flex bison \
                python3 python3-setuptools python3-mako \
                gcc make ca-certificates nasm gnupg patch help2man \
                python3 meson
        if [ ${platform} -eq ${mingw32} ]; then
                echo "pacman dep mingw32 ..."
                pacman -S --needed mingw32/mingw-w64-i686-ragel # 安装32位版本
        elif [ ${platform} -eq ${mingw64} ]; then
                echo "pacman dep mingw64 ..."
                pacman -S --needed mingw64/mingw-w64-x86_64-ragel # 安装64位版本    
        fi
        pacman -S --needed mingw-w64-x86_64-toolchain
fi


# 2.安装build tools
Exist=1
UnExist=0
state=${Exist}
if [ ${platform} -eq ${ubuntu} ]; then
        if [ ${state} -eq ${UnExist}  ]; then
                wget https://github.com/mstorsjo/llvm-mingw/releases/download/20220906/llvm-mingw-20220906-msvcrt-ubuntu-18.04-x86_64.tar.xz
                # 解压到了系统根目录下
                tar xvf llvm-mingw-20220906-msvcrt-ubuntu-18.04-x86_64.tar.xz -C /opt
        fi
        echo " install build tools ..."
        export PATH=/opt/llvm-mingw-20220906-msvcrt-ubuntu-18.04-x86_64/bin:$PATH
else
        if (( ${state} == ${UnExist}  )) then
                wget https://github.com/mstorsjo/llvm-mingw/releases/download/20220906/llvm-mingw-20220906-msvcrt-x86_64.zip
                unzip llvm-mingw-20220906-msvcrt-x86_64.zip -d /opt
        fi
        echo " install build tools ..."
        export PATH=/opt/llvm-mingw-20220906-msvcrt-x86_64/bin:$PATH
fi
echo ${PATH}
mkdir build
cd build
../extras/package/win32/build.sh -a x86_64 -z