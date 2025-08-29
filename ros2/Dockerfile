ARG BASE_IMAGE=osrf/ros:humble-desktop-full-jammy

FROM ${BASE_IMAGE}

#Make normal user
ARG USERADD=yes
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

RUN echo "source /opt/ros/humble/setup.bash" >> "/home/${USER}/.bashrc"
