FROM nvidia/cuda:11.1.1-devel-ubuntu18.04

ENV DEBCONF_NOWARNINGS=yes
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1
ENV DEBIAN_FRONTEND=noninteractive
ENV OPENSSL_CFLAGS=-I/usr/include/openssl
ENV OPENSSL_LIBS=-L/usr/libi

RUN apt-get update
RUN apt-get install -y vim bash-completion net-tools lsb-release curl sudo
RUN apt-get install -y build-essential
RUN apt-get install -y cmake
RUN apt-get install -y python3-pip
RUN apt-get install -y wget
RUN apt-get install -y unzip
RUN apt-get install -y git

RUN pip3 install -U pip
RUN pip3 install osmnx
RUN pip3 install matplotlib
RUN pip3 install pyyaml
RUN pip3 install torch
RUN pip3 install pandas
RUN pip3 install pymc3
RUN pip3 install scikit-learn
RUN pip3 install mip

#Make normal user
ARG uid=1000
ARG user=docker
ARG passwd=docker

RUN useradd -m -u ${uid} ${user}
RUN gpasswd -a ${user} sudo
RUN echo ${user}:${passwd} | chpasswd
USER ${user}
WORKDIR "/home/${user}"
RUN echo "export LD_LIBRARY_PATH='$LD_LIBRARY_PATH:/usr/local/lib/python3.10/dist-packages/cuquantum/lib'" >> ~/.bashrc

ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics


