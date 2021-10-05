FROM ubuntu:focal

ARG IDF_VERSION=v4.3.1

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    git wget flex bison gperf \
    python3 python3-pip python3-setuptools cmake \
    ninja-build ccache libffi-dev libssl-dev dfu-util \
    libusb-1.0-0

RUN useradd -m idf
RUN mkdir /esp && chown -R idf /esp

USER idf

RUN cd /esp && git clone --branch ${IDF_VERSION} --recursive https://github.com/espressif/esp-idf.git
RUN cd /esp/esp-idf && ./install.sh esp32
RUN echo ". /esp/esp-idf/export.sh" >> ~/.bashrc

ENTRYPOINT ["/bin/bash", "-i", "-c"]
