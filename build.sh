#!/usr/bin/env bash

function install {
  echo installing $1
  shift
  sudo apt-get -y install "$@"
}

sudo apt-get -y update

install 'development tools' build-essential
install 'git' git
install 'wget' wget

### Updating gcc

install python-software-properties
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
install gcc-4.8
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 50

### Updating g++

install g++-4.8
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 50

### installing emacs
install emacs24

### Downloading llvm 3.8 binaries

cd $HOME
wget http://llvm.org/releases/3.8.0/clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz
tar -xf clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz
mv clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04 llvm-3.8
rm -f clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz

### Updating .bashrc file

echo "export PATH=$HOME/llvm-3.8/bin:$PATH" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=$HOME/llvm-3.8/lib:$LD_LIBRARY_PATH" >> ~/.bashrc

export PATH=$HOME/llvm-3.8/bin:$PATH
export LD_LIBRARY_PATH=$HOME/llvm-3.8/lib:$LD_LIBRARY_PATH

source ~/.bashrc
