ARG BASE_IMAGE=ubuntu:24.04
ARG ENBL_GPU=no

FROM ${BASE_IMAGE}

RUN apt-get update
RUN apt-get install -y vim bash-completion net-tools lsb-release gdb curl sudo wget
RUN apt-get install -y python3-pip python3-tk python3-venv libffi-dev

RUN python3 -m venv /opt/venv
ENV PATH "/opt/venv/bin:$PATH"

RUN pip3 install -U pip
RUN pip3 install dwave-ocean-sdk
RUN pip3 install osmnx
RUN pip3 install matplotlib
RUN pip3 install gym
RUN pip3 install pylint
RUN pip3 install pyyaml
RUN pip3 install torch
RUN pip3 install pandas
RUN pip3 install pymc
RUN pip3 install gmpy2
RUN pip3 install tensornetwork
RUN pip3 install openjij
RUN pip3 install pyqubo
RUN pip3 install scikit-learn
RUN pip3 install pulp
RUN pip3 install qiskit
RUN pip3 install pylatexenc
RUN pip3 install xeus-python
RUN pip3 install mip
RUN pip3 install ipykernel
RUN pip3 install qpsolvers
RUN pip3 install quadprog
RUN pip3 install cudaq

RUN if [ "$ENBL_GPU" = "yes" ]; then \
      pip3 install qiskit-aer-gpu; \
    fi

#Make normal user
ARG USERADD=no
ARG UID=1000
ARG USER=ubuntu
ARG PASSWD=ubuntu

RUN if [ "$USERADD" = "yes" ]; then \
      useradd -m -u ${UID} ${USER}; \
    fi
RUN gpasswd -a ${USER} sudo
RUN echo ${USER}:${PASSWD} | chpasswd
USER ${USER}
WORKDIR "/home/${USER}"
