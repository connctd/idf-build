FROM ubuntu:focal

ARG IDF_VERSION=v4.3.1

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    git wget flex bison gperf \
    python3 python3-pip python3-setuptools cmake \
    ninja-build ccache libffi-dev libssl-dev dfu-util autoconf libtool automake pkg-config dpkg-dev libsodium-dev \
    libusb-1.0-0

RUN useradd -m idf
RUN mkdir /esp && chown -R idf /esp
RUN mkdir /source && chown -R idf /source

USER idf

RUN cd /esp && git clone --branch ${IDF_VERSION} --recursive https://github.com/espressif/esp-idf.git
RUN cd /esp/esp-idf && ./install.sh esp32
RUN echo ". /esp/esp-idf/export.sh" >> ~/.bashrc
VOLUME ["/source"]
WORKDIR /source
ENTRYPOINT ["/bin/bash", "-i", "-c"]
