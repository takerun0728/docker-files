FROM nvidia/cuda:11.2.0-devel-ubuntu18.04

ENV DEBCONF_NOWARNINGS=yes
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1
ENV DEBIAN_FRONTEND=noninteractive

#Base
RUN apt-get update
RUN apt-get install -y vim bash-completion net-tools lsb-release gdb curl sudo

#ROS(Install step by step for download failure)
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | apt-key add -
RUN apt-get update
RUN apt-get install -y ros-melodic-ros-base
RUN apt-get install -y ros-melodic-desktop
RUN apt-get install -y ros-melodic-desktop-full
RUN apt-get install -y ros-melodic-jsk-visualization
RUN apt-get install -y python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
RUN rosdep init

RUN apt-get update
RUN apt-get install -y python3-pip
RUN apt-get install -y wget

RUN ln -s /usr/local/cuda/lib64/libcusolver.so.11 /usr/local/cuda/lib64/libcusolver.so.10
RUN apt-get install -y python3-tk
RUN pip3 install -U pip
RUN pip3 install tensorflow
RUN pip3 install matplotlib
RUN pip3 install gym
RUN pip3 install pylint
RUN pip3 install jupyterlab
RUN pip3 install jedi==0.17.2
RUN pip3 install pyyaml
RUN pip3 install torch==1.8.1+cu111 torchvision==0.9.1+cu111 torchaudio==0.8.1 -f https://download.pytorch.org/whl/torch_stable.html
RUN pip3 install pandas

RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN pip3 install xeus-python
RUN jupyter labextension install @jupyterlab/debugger

RUN apt-get install -y libmuparser-dev
RUN apt-get install -y portaudio19-dev
RUN pip3 install pyaudio

#Make normal user
ARG uid=1000
ARG user=docker
ARG passwd=docker

RUN useradd -m -u ${uid} ${user}
RUN gpasswd -a ${user} sudo
RUN echo ${user}:${passwd} | chpasswd
USER ${user}
WORKDIR "/home/${user}"

RUN echo "source /opt/ros/melodic/setup.bash" >> /home/docker/.bashrc
RUN echo "source /home/docker/projects/catkin_ws/devel/setup.sh" >> /home/docker/.bashrc

ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

