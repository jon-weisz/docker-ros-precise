FROM jonweisz/ubuntu-base-devel:precise
MAINTAINER Jon Weisz <jon.weisz@gmail.com>
#Builds a base vanilla groovy-precise image
#

ENV DEBIAN_FRONTEND noninteractive
ENV DISTRO precise
ENV ROSDISTRO groovy

# minimum installation
RUN sudo apt-get install -y software-properties-common ssh sudo wget curl emacs23-nox lsb-release

#minimal ROS Install
RUN sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $DISTRO main" > /etc/apt/sources.list.d/ros-latest.list'
RUN sudo wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
RUN sudo apt-get update
RUN sudo apt-get install -y ros-groovy-desktop-full



# change user
USER tester
WORKDIR /home/tester/


RUN echo "source /opt/ros/groovy/devel/setup.bash" >> $HOME/.bashrc

ENTRYPOINT "/bin/bash"
