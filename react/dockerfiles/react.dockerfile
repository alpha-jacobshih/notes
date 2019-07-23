FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y \
    apt-utils \
    curl \
    git \
    tzdata \
    wget \
    sudo

# nodejs
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - \
    && apt-get install -y nodejs

# install heroku cli
RUN wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh

# add user
ENV USER=user
RUN useradd -c 'docker $USER' -m -d /home/$USER -s /bin/bash $USER

# allow sudo usage
RUN echo "$USER ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/$USER
RUN chmod 0440 /etc/sudoers.d/$USER

# set timezone
ENV TZ=Asia/Taipei
RUN dpkg-reconfigure -f noninteractive tzdata

# reconfigure to use bash
RUN echo no | dpkg-reconfigure dash

# Tell docker that all future commands should run as the user named user.
USER $USER

# initialize the user profile from the skeleton profile
RUN cp /etc/skel/.bashrc /home/$USER/.bashrc \
  && echo 'PS1="\\w\$ "' >> /home/$USER/.bashrc \
  && echo 'PATH="/usr/local/go/bin:$GOPATH/bin:$HOME/bin:$PATH"' >> /home/$USER/.bashrc

RUN . /home/$USER/.profile

