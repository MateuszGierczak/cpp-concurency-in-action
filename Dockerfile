FROM ubuntu:24.04 AS ubuntu

RUN apt-get upgrade \
 && apt-get update

RUN apt-get install -y \
 cmake \
 curl \
 gcc-14 \
 git \
 unzip \
 zip \
 tar \
 vim

### VCPKG CONFIGURATION ###
ARG VCPKG_VERSION=2024.12.16

RUN curl -q -L https://github.com/microsoft/vcpkg/archive/refs/tags/${VCPKG_VERSION}.zip -o vcpkg-${VCPKG_VERSION}.zip \
 && unzip vcpkg-${VCPKG_VERSION}.zip \
 && rm -f vcpkg-${VCPKG_VERSION}.zip \
 && mv vcpkg-${VCPKG_VERSION} /usr/bin/vcpkg-build \
 && cd /usr/bin/vcpkg-build \
 && ./bootstrap-vcpkg.sh \
 && ln -s /usr/bin/vcpkg-build/vcpkg /usr/bin/vcpkg

### NINJA BUILD CONFIGURATION ###
RUN curl -q -L https://github.com/ninja-build/ninja/releases/download/v1.12.1/ninja-linux.zip -o ninja-linux.zip \
 && unzip ninja-linux.zip \
 && mv ninja /usr/bin/ninja \
 && ln -s /usr/bin/ninja /usr/bin/ninja-build \
 && rm -f ninja-linux.zip
