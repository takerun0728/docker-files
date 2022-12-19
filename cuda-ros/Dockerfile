FROM nvidia/cuda:11.2.0-devel-ubuntu20.04

ENV DEBCONF_NOWARNINGS=yes
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1
ENV DEBIAN_FRONTEND=noninteractive

#Base
RUN apt-get update
RUN apt-get install -y vim bash-completion net-tools lsb-release gdb curl sudo

#ROS(Install step by step for download failure)
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add - 
RUN apt-get update
RUN apt-get install -y ros-noetic-ros-base
RUN apt-get install -y ros-noetic-desktop
RUN apt-get install -y ros-noetic-desktop-full
RUN apt-get install -y ros-noetic-jsk-visualization
RUN apt-get install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
RUN rosdep init

RUN apt-get update
RUN apt-get install -y python3-pip
RUN apt-get install -y wget

RUN apt-get install -y python3-tk
RUN pip3 install -U pip
RUN pip3 install matplotlib
RUN pip3 install gym
RUN pip3 install torch==1.8.1+cu111 torchvision==0.9.1+cu111 torchaudio==0.8.1 -f https://download.pytorch.org/whl/torch_stable.html
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

RUN echo "source /opt/ros/noetic/setup.bash" >> /home/docker/.bashrc
RUN echo "source /home/docker/projects/catkin_ws/devel/setup.sh" >> /home/docker/.bashrc

ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics


