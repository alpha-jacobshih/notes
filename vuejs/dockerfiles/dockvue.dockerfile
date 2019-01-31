FROM node:8.11.3-alpine

RUN apk update; \
    apk add git \
    subversion \
    automake \
    bc \
    cpio \
    libtool \
    ncurses-dev \
    python \
    ruby \
    tzdata \
    unzip \
    vim \
    sudo

RUN npm install -g yarn
RUN yarn global add @vue/cli

# set timezone
RUN cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime

# add user
ENV USER=node
#RUN addgroup -S $USER && adduser -S $USER -G $USER

# allow sudo usage
RUN echo "$USER ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/$USER
RUN chmod 0440 /etc/sudoers.d/$USER

# set up working directory
WORKDIR /home/$USER

# profile
RUN echo '. /etc/profile ;' >> /home/$USER/.profile; \
    echo 'PS1="\\w\$ "' >> /home/$USER/.profile;

# Tell docker that all future commands should run as the user named user.
USER $USER
RUN  . /home/$USER/.profile
