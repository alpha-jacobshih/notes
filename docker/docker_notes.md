
# docker

1. [references](#references)
1. [docker basic](#docker_basic)
1. [install docker](#install_docker)
    1. [set up docker repository](#set_up_docker_repository)
    1. [install docker ce](#install_docker_ce)

1. [basic docker operations](#basic_docker_operations)
    1. [list docker images](#list_docker_images)
    1. [run a docker and check ubuntu version of docker image](#run_a_docker_and_check_ubuntu_version_of_docker_image)
    1. [create a container](#create_a_container)
    1. [start a container](#start_a_container)
    1. [stop a container](#stop_a_container)
    1. [attach to a running container](#attach_to_a_running_container)
    1. [docker run](#docker_run)
    1. [list container](#list_container)
    1. [create docker image](#create_docker_image)
    1. [export container](#export_container)
    1. [import container](#import_container)
    1. [save image](#save_image)
    1. [load image](#load_image)
    1. [show history of image](#show_history_of_image)

1. docker-compose
    1. [install docker compose](#install_docker_compose)

1. misc
    1. [Solving Docker permission denied](#permission_denied)
    1. [Setup terminal width and height parameters to container with docker exec command](#resize_terminal)

1. [examples](docker_examples.md)
    1. [create a ubuntu 14.04 container for arm 4.3.2 toolchain](docker_examples.md#create_ubuntu_1404_container_for_arm_toolchain)
    1. [create a ubuntu 16.04 container for meson build system](docker_examples.md#create_ubuntu_1604_container_for_meson_build_system)
    1. [create a ubuntu 16.04 container for hc1892 sdk](docker_examples.md#create_ubuntu_1604_container_for_hc1892_sdk)
    1. [create a ubuntu 14.04 container for dhpw310av](docker_examples.md#create_ubuntu_1404_container_for_dhpw310av)
    1. [create a ubuntu 16.04 container for buildroot](docker_examples.md#create_ubuntu_1604_container_for_buildroot)
    1. [ftp server](docker_examples.md#ftp_server)

---

<a name="references" />

## references
* [docker_practice](https://philipzheng.gitbooks.io/docker_practice/content/)
* [docker_theory_install](https://joshhu.gitbooks.io/docker_theory_install/content/)
* [write excellent dockerfile](https://blog.fundebug.com/2017/05/15/write-excellent-dockerfile/)

<a name="docker_basic" />

## docker basic
* Docker I/O
* Repository
* Image
   - Images are created with the build command, and they will produce a container when started with run.
   - Images are stored in a Docker registry such as registry.hub.docker.com.
* Container
   - An instance of an image is called a container.
   - you create a new container based on an image.
   - You can think about images and containers as a class and an instance of class.

---

## container vs.virtual machines
* **virtual machine diagram**

    <img src="https://www.docker.com/sites/default/files/d8/2018-11/container-vm-whatcontainer_2.png" width=450>

* **container diagram**

    <img src="https://www.docker.com/sites/default/files/d8/2018-11/docker-containerized-appliction-blue-border_2.png" width=450>


---

<a name="install_docker" />

## install docker

<a name="set_up_docker_repository" />

### set up docker repository
1. update apt package index.

    ```
    sudo apt-get update
    ```

2. install packages to allow apt to use a repository over https.

    ```
    sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
    ```

3. add docker's official GPG key.

    ```
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    ```

4. set up the stable docker repository.

    ```
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    ```

<a name="install_docker_ce" />

### install docker ce

1. update apt package index.

    ```
    sudo apt-get update
    ```

2. install the latest version of docker ce.

    ```
    sudo apt-get install docker-ce
    ```

3. verify if docker is installed correctly.

    ```
    docker run ubuntu:10.04 /bin/echo 'Hello docker'
    ```

---
<a name='basic_docker_operations'/>

## basic docker operations

<a name="list_docker_images" />

### list docker images
- usage

    ```
    Usage:  docker images [OPTIONS] [REPOSITORY[:TAG]]
    ```

- list docker images

    ```
    jacob_shih:dockertest$ docker images
    REPOSITORY                      TAG                 IMAGE ID            CREATED             SIZE
    alphadocker/ubt1404_arm-4.3.2   0.00.01             091b0fc7e71f        17 hours ago        886MB
    ubuntu                          latest              f7b3f317ec73        5 months ago        117MB
    ubuntu                          14.04               302fa07d8117        6 months ago        188MB
    ubuntu                          10.04               e21dbcc7c9de        3 years ago         183MB
    ```

<a name="run_a_docker_and_check_ubuntu_version_of_docker_image" />

### run a docker and check ubuntu version of docker image

```
jacob_shih:dockertest$ docker run --rm ubuntu:10.04 lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 10.04 LTS
Release:        10.04
Codename:       lucid
```

```
jacob_shih:dockertest$ docker run --rm ubuntu:14.04 lsb_release -a
Distributor ID: Ubuntu
Description:    Ubuntu 14.04.5 LTS
Release:        14.04
Codename:       trusty
No LSB modules are available.
```

<a name="create_a_container" />

### create a container

- usage

    ```
    Usage:  docker create [OPTIONS] IMAGE [COMMAND] [ARG...]

    Create a new container

    Options:
      -e, --env list                       Set environment variables
      -h, --hostname string                Container host name
      -i, --interactive                    Keep STDIN open even if not attached
          --link list                      Add link to another container
          --name string                    Assign a name to the container
      -p, --publish list                   Publish a container's port(s) to the host
      -P, --publish-all                    Publish all exposed ports to random ports
      -t, --tty                            Allocate a pseudo-TTY
      -v, --volume list                    Bind mount a volume
      -w, --workdir string                 Working directory inside the container
    ```

- create a container with default name

    ```
    docker create -it ubuntu:14.04
    ```

- create a container with specified name

    ```
    docker create -it --name ubt1404 ubuntu:14.04
    ```

- create a container with admin privilege

    ```
    docker create -it --name ubt1404 --privileged --cap-add SYS_ADMIN --cap-add DAC_READ_SEARCH ubuntu:14.04
    ```

- create a container with environment variables

    ```
    docker create -it --name ubt1404 --env PATH=/home/hello --env HELLO=WORLD ubuntu:14.04
    ```

- mount a host folder to container

    ```
    docker create -it --name ubt1404 -v /home/jacob_shih/temp/dockertest:/tmp/dockertest ubuntu:14.04
    ```

<a name="start_a_container" />

### start a container
- usage

    ```
    Usage:  docker start [OPTIONS] CONTAINER [CONTAINER...]
    ```

- start a container with specified name

    ```
    docker start ubt1404
    ```

<a name="stop_a_container" />

### stop a container
- usage

    ```
    Usage:  docker stop [OPTIONS] CONTAINER [CONTAINER...]
    ```

- stop a container with specified name

    ```
    docker stop ubt1404
    ```

<a name="attach_to_a_running_container" />

### attach to a running container
- usage

    ```
    Usage:  docker attach [OPTIONS] CONTAINER
    ```

- attach local stdin, stdout and stderr streams to a running container

    ```
    docker attach ubt1404
    ```

<a name="docker_run" />

### docker run
- usage

    ```
    Usage:  docker run [OPTIONS] IMAGE [COMMAND] [ARG...]

    Run a command in a new container

    Options:
      -a, --attach list                    Attach to STDIN, STDOUT or STDERR
      -d, --detach                         Run container in background and print container ID
          --dns list                       Set custom DNS servers
      -e, --env list                       Set environment variables
      -i, --interactive                    Keep STDIN open even if not attached
          --mount mount                    Attach a filesystem mount to the container
          --name string                    Assign a name to the container
      -p, --publish list                   Publish a container's port(s) to the host
          --rm                             Automatically remove the container when it exits
      -t, --tty                            Allocate a pseudo-TTY
      -v, --volume list                    Bind mount a volume
      -w, --workdir string                 Working directory inside the container
    ```

- to start the process in the container and attach the console to the process's stdin, stdout and stderr.

    ```
    docker run -it --name mytest ubuntu:14.04
    ```

<a name="list_container" />

### list container
- usage

    ```
    Usage:  docker ps [OPTIONS]

    List containers

    Options:
      -a, --all             Show all containers (default shows just running)
    ```

- to show only running containers

    ```
    docker ps
    ```

- to show all containers

    ```
    docker ps -a
    ```

- to show the latest created container

    ```
    docker ps -l
    ```

- to show only running containers

    ```
    docker ps
    ```

- customize the output format of container list

    ```
    docker ps -a --format "table {{.ID}}\\t{{.Names}}\\t{{.Image}}\\t{{.Status}}\\t{{.Ports}}"
    ```

    ```
    CONTAINER ID        NAMES               IMAGE                              STATUS                      PORTS
    0be56e0c89cb        ibox                alphadocker/ibox:0.01              Up 13 minutes
    3be97f1d29e8        eager_lichterman    openwrt-x86-generic-rootfs         Exited (255) 4 days ago
    ae751a3828a3        xbuildroot          alphadocker/ubt1604_kamelot:0.01   Exited (0) 3 weeks ago
    03b106352c80        august              alphadocker/ubt1104_august:0.01    Exited (255) 3 weeks ago
    3b509af9e6c8        jolly_joliot        37ecdd347f2c                       Exited (100) 2 months ago
    ```

    - alias for listing containers in customized format

    ```
    vi ~/.bashrc
    ```

    ```
    ##############################################################################
    # alias
    alias docker.ps='docker ps -a --format "table {{.ID}}\\t{{.Names}}\\t{{.Image}}\\t{{.Status}}\\t{{.Ports}}"'
    ```

<a name="create_docker_image" />

### create docker image
- usage:

    ```
    docker commit [-m message] [-a author] CONTAINER REPOSITORY:TAG
    ```

- example:

    ```
    docker commit -m 'arm-4.3.2' -a 'jacob_shih' ubt1404_arm-4.3.2 alphadocker/ubt1404_arm-4.3.2:0.01
    ```

<a name="export_container" />

### export container
- usage

    ```
    Usage:  docker export [OPTIONS] CONTAINER

    Options:
      -o, --output string   Write to a file, instead of STDOUT
    ```

- export a container as a tar archive

    ```
    docker export -o ubt1404.tar ubt1404
    ```

- export a container as a tar archive by redirecting stdout to a tar file

    ```
    docker export ubt1404 > ubt1404.tar
    ```

<a name="import_container" />

### import container
- usage

    ```
    Usage:  docker import [OPTIONS] file|URL|- [REPOSITORY[:TAG]]
    ```

- import the contents from a tarball to create a filesystem image

    ```
    docker import ubt1404.tar dockertest/ubt1404:0.01
    ```

- import docker image from stdin by concatenating tar file to stdout

    ```
    cat ubt1404.tar | docker import - dockertest/ubt1404:0.01
    ```

<a name="save_image" />

### save image
- usage

    ```
    Usage:  docker save [OPTIONS] IMAGE [IMAGE...]

    Options:
      -o, --output string   Write to a file, instead of STDOUT
    ```

- save one or more images to a tar archive

    ```
    docker save dockertest/ubt1404:0.01 -o saved_ubt1404.tar
    ```

<a name="load_image" />

### load image
- usage

    ```
    Usage:  docker load [OPTIONS]

    Options:
      -i, --input string   Read from tar archive file, instead of STDIN
    ```

- load an image from a tar archive

    ```
    docker load --input saved_ubt1404.tar
    ```

<a name="show_history_of_image" />

### show history of image
- usage

    ```
    Usage:  docker history [OPTIONS] IMAGE
    ```

- show the history of an image

    ```
    docker history alphadocker/ubt1604_hc1892_user:0.01
    ```

---

## docker-compose

<a name="install_docker_compose" />

### install docker compose

- download and setup docker-compose

    ```
    sudo curl -L "https://github.com/docker/compose/releases/download/1.10.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    ```

- grant permission for docker-compose

    ```
    sudo chmod +x /usr/local/bin/docker-compose
    ```

- add current user to docker group

    ```
    sudo gpasswd -a ${USER} docker
    ```

---

## misc

<a name="permission_denied" />

### Solving Docker permission denied

* [Solving Docker permission denied while trying to connect to the Docker daemon socket](https://techoverflow.net/2017/03/01/solving-docker-permission-denied-while-trying-to-connect-to-the-docker-daemon-socket/)

    ```
    sudo usermod -a -G docker $USER
    ```

---

<a name="resize_terminal" />

### Setup terminal width and height parameters to container with docker exec command

```
docker exec -e COLUMNS="`tput cols`" -e LINES="`tput lines`" -it [CONTAINER] [COMMAND]
```

---
