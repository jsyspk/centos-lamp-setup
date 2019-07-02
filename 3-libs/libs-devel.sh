#!/usr/bin/env bash
echo "libpng-devel needed for some node module" \
&& sudo yum install libpng-devel \
&& echo "Install C++ for npm package" \
&& sudo yum install -y gcc gcc-c++
