FROM nvidia/cuda:12.0.0-devel-ubuntu22.04

ENV DEBCONF_NOWARNINGS=yes
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1
ENV DEBIAN_FRONTEND=noninteractive

#Base
RUN apt-get update
RUN apt-get install -y vim bash-completion net-tools lsb-release gdb curl sudo

#ROS(Install step by step for download failure)
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null 
RUN apt-get update
RUN apt-get install -y ros-humble-ros-base
RUN apt-get install -y ros-humble-desktop
RUN apt-get install -y ros-humble-rqt-* python3-colcon-common-extensions

RUN apt-get update
RUN apt-get install -y python3-pip
RUN apt-get install -y wget

RUN apt-get install -y python3-tk
RUN pip3 install -U pip
RUN pip3 install matplotlib
RUN pip3 install gym
RUN pip3 install torch torchvision torchaudio
RUN pip3 install pandas
RUN pip3 install cupy

#Make normal user
ARG uid=1000
ARG user=docker
ARG passwd=docker

RUN useradd -m -u ${uid} ${user}
RUN gpasswd -a ${user} sudo
RUN echo ${user}:${passwd} | chpasswd
USER ${user}
WORKDIR "/home/${user}"

RUN echo "source /opt/ros/humble/setup.bash" >> /home/docker/.bashrc
RUN echo "source /home/docker/projects/ros2_ws/install/setup.sh" >> /home/docker/.bashrc

ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics


