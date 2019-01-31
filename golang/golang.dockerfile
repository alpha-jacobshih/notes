FROM golang:1.10
MAINTAINER jacob_shih "jacob_shih@hotmail.com"
WORKDIR /home

# update ubuntu software repository
RUN apt-get update

# install necessary tools
RUN apt-get install -y \
    vim \
    tzdata \
    sudo

# set timezone
ENV TZ=Asia/Taipei
RUN dpkg-reconfigure -f noninteractive tzdata

# add user
RUN useradd -c 'docker user' -m -d /home/user -s /bin/bash user

# allow sudo usage
RUN echo "user ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user
RUN chmod 0440 /etc/sudoers.d/user

# reconfigure to use bash
RUN echo no | dpkg-reconfigure dash

# initialize the user profile from the skeleton profile
RUN cp /etc/skel/.bashrc /home/user/.bashrc \
  && echo 'PATH="/usr/local/go/bin:$GOPATH/bin:$HOME/bin:$PATH"' >> /home/user/.bashrc

# run as a user
CMD ["su", "user", "-c", "/bin/bash"]

# set up working directory
ENV HOME /home/user
ENV GOPATH $HOME/go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
RUN chown user:user -R "$HOME"
# WORKDIR $HOME/go

# set up working directory
WORKDIR /home/user
ENV HOME /home/user
