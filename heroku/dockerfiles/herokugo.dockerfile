FROM golang:1.10
MAINTAINER jacob_shih "jacob_shih@hotmail.com"

# update ubuntu software repository
RUN apt-get update

# install heroku cli
RUN wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh

# install necessary tools
RUN apt-get install -y \
    vim \
    tzdata \
    sudo

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

# setup environment variables
ENV HOME /home/$USER
ENV GOPATH $HOME/herokugo
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

# install go packages
RUN go get -u github.com/kardianos/govendor


# set up working directory
RUN chown $USER:$USER -R "$HOME"
WORKDIR $HOME

# initialize the user profile from the skeleton profile
RUN cp /etc/skel/.bashrc /home/$USER/.bashrc \
  && echo 'PS1="\\w\$ "' >> /home/$USER/.bashrc \
  && echo 'PATH="/usr/local/go/bin:$GOPATH/bin:$HOME/bin:$PATH"' >> /home/$USER/.bashrc

RUN . /home/$USER/.profile
