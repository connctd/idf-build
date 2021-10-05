FROM ubuntu:focal

ARG IDF_VERSION=v4.3.1

RUN apt-get install git wget flex bison gperf \
    python3 python3-pip python3-setuptools cmake \
    ninja-build ccache libffi-dev libssl-dev dfu-util \
    libusb-1.0-0

RUN mkdir /esp
RUN cd /esp && git clone --branch ${IDF_VERSION} --recursive https://github.com/espressif/esp-idf.git
RUN cd /esp/esp-idf && ./install.sh esp32
