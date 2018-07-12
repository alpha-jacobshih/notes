FROM ubuntu:16.04
MAINTAINER jacob_shih
WORKDIR /home

# install for development
RUN apt-get update; \
    apt-get install -y --fix-missing \
    git \
    subversion \
    automake \
    bc \
    cpio \
    build-essential \
    libbz2-dev \
    liblzma-dev \
    libpcre3-dev \
    libtool \
    ncurses-dev \
    python \
    python3-pip \
    ruby \
    sharutils \
    u-boot-tools \
    zlib1g-dev

# install additional tools
RUN apt-get update; \
    apt-get install -y \
    wget \
    curl \
    tzdata \
    unzip \
    vim \
    sudo

# googletest
RUN echo install googletest; \
    cd /usr/src; \
    git clone https://github.com/google/googletest; \
    ln -s /usr/src/googletest/googletest/include/gtest/ /usr/src/googletest/googletest/gtest; \
    ln -s /usr/src/googletest/googlemock/include/gmock/ /usr/src/googletest/googlemock/gmock; \
    echo install googletest done;

# add user
RUN useradd -c 'docker user' -m -d /home/user -s /bin/bash user

# allow sudo usage
RUN echo "user ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user
RUN chmod 0440 /etc/sudoers.d/user

# reconfigure to use bash
RUN echo no | dpkg-reconfigure dash

# initialize the user profile from the skeleton profile
RUN cp /etc/skel/.bashrc /home/user/.bashrc

# run as a user
CMD ["su", "user", "-c", "/bin/bash"]

# set up working directory
WORKDIR /home/user
ENV HOME /home/user

# set timezone
ENV TZ=Asia/Taipei
RUN dpkg-reconfigure -f noninteractive tzdata
