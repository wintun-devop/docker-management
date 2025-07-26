#!/bin/bash

sudo dnf update -y

sudo dnf config-manager --set-enabled crb

sudo dnf makecache

sudo dnf install -y gcc openssl-devel bzip2-devel libffi-devel wget make zlib-devel \
  xz-devel sqlite-devel readline-devel tk-devel gdbm-devel \
  ncurses-devel uuid-devel libuuid-devel zlib-devel

sudo dnf install -y \
  openssl-devel bzip2-devel xz-devel libuuid-devel readline-devel \
  ncurses-devel tk-devel tcl-devel libffi-devel sqlite-devel

sudo dnf install -y gdbm-devel libdb-devel


VERSION=3.13.5
wget https://www.python.org/ftp/python/$VERSION/Python-$VERSION.tgz
tar -xzf Python-$VERSION.tgz
cd Python-$VERSION

./configure --enable-optimizations

make -j$(nproc)

sudo make altinstall

INSTALLED_PYTHON_VERSION = $(python3.13 --version)

echo "${INSTALLED_PYTHON_VERSION} have been installed."