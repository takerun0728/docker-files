FROM nvidia/cuda:11.7.1-devel-ubuntu20.04

ENV DEBCONF_NOWARNINGS=yes
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1
ENV DEBIAN_FRONTEND=noninteractive

#Base
RUN apt-get update
RUN apt-get install -y vim bash-completion net-tools lsb-release gdb curl sudo
RUN apt-get install -y python3-pip
RUN apt-get install -y wget
RUN apt-get install -y python3-tk
RUN pip3 install -U pip
RUN pip3 install dwave-ocean-sdk
RUN pip3 install osmnx
RUN pip3 install matplotlib
RUN pip3 install gym
RUN pip3 install pylint
RUN pip3 install jupyterlab
RUN pip3 install jedi==0.17.2
RUN pip3 install pyyaml
RUN pip3 install torch==1.8.1+cu111 torchvision==0.9.1+cu111 torchaudio==0.8.1 -f https://download.pytorch.org/whl/torch_stable.html
RUN pip3 install pandas
RUN pip3 install cupy
RUN pip3 install pymc3
RUN pip3 install gmpy2
RUN pip3 install tensornetwork
RUN pip3 install openjij
RUN pip3 install pyqubo
RUN pip3 install scikit-learn
RUN pip3 install pulp

RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN pip3 install xeus-python

#Make normal user
ARG uid=1000
ARG user=docker
ARG passwd=docker

RUN useradd -m -u ${uid} ${user}
RUN gpasswd -a ${user} sudo
RUN echo ${user}:${passwd} | chpasswd
USER ${user}
WORKDIR "/home/${user}"

ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics


