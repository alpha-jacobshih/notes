
# go language

1. [references](#references)
1. [install go](#install_go)
1. [go ide](#go_ide)
1. [go docker](#go_docker)
1. [learn to go](#learn_to_go)
1. [hello world](#hello_world)

---

<a name="references" />

## references
* [golang official repository](https://hub.docker.com/_/golang/)
* [About Go Language - An Overview](https://blog.learngoprogramming.com/about-go-language-an-overview-f0bee143597c)

---

<a name="install_go" />

## install go

```
sudo apt-get install golang
```

---

<a name="go_ide" />

## go ide

### goclipse

* install eclipse

    * [download eclipse (64 bits)](https://www.eclipse.org/downloads/download.php?file=/oomph/epp/oxygen/R2/eclipse-inst-linux64.tar.gz)
    * [download eclipse (32 bits)](https://www.eclipse.org/downloads/download.php?file=/oomph/epp/oxygen/R2/eclipse-inst-linux32.tar.gz)

* install goclipse

    * Start Eclipse, go to Help -> Install New Software...
    * Click the Add... button, then enter the Update Site URL: http://goclipse.github.io/releases/ in the Location field.
    * Select 'goclipse' in the Work with: dropdown.

* install go tools

    * install gocode

    ```
    go get github.com/nsf/gocode/
    go install github.com/nsf/gocode/
    sudo mv bin/gocode $(go env GOROOT)/bin
    ```

    * install guru

    ```
    go get golang.org/x/tools/
    go install golang.org/x/tools/cmd/guru
    sudo mv bin/guru $(go env GOROOT)/bin
    ```

    * install godef

    ```
    go get github.com/rogpeppe/godef
    go install github.com/rogpeppe/godef
    sudo mv bin/godef $(go env GOROOT)/bin
    ```

    * install govendor

    ```
    go get -u github.com/kardianos/govendor
    ```

        * list and filter existing dependencies and packages.

        ```
        govendor list
        ```

        * add referenced packages

        ```
        govendor add +external
        ```

        * pull referenced packages and update vendor.json file.

        ```
        govendor sync
        ```


* goclipse configuration

    * eclipse -> window -> preference -> go -> tools

        * gocode

            * set executable path

            ```
            /usr/lib/go-1.6/bin/gocode
            ```

        * guru

            * set executable path

            ```
            /usr/lib/go-1.6/bin/guru
            ```

        * godef

            * set executable path

            ```
            /usr/lib/go-1.6/bin/godef
            ```

---

### web-based ide for go language.

* coding with go on the Wide way.

    [Wide](https://github.com/b3log/wide)
    [Wide user guide](https://legacy.gitbook.com/book/88250/wide-user-guide/details)

* pull the docker image and create the container to run WIDE.

```
docker pull 88250/wide:latest
docker run -p 127.0.0.1:7070:7070 88250/wide:latest ./wide -docker=true -channel=ws://127.0.0.1:7070
```

* Open browser: http://127.0.0.1:7070


---

<a name="go_docker" />

## go docker

* create a dockerfile for go container.

[golang.dockerfile](golang.dockerfile)

* build the dockerfile.

```
docker build -f golang.dockerfile -t jacobrepo/go:0.01 .
```

* create the go container.

```
docker create -it -h golang --name golang --dns 172.19.10.100 -v /home/jacob_shih/volumes/go/:/home/user/go/ jacobrepo/go:0.01
```

* start the container.

```
docker start golang
```

* execute the container.

```
docker exec -it golang su user
```

---

<a name="learn_to_go" />

## learn to go

### The Go Playground

[The Go Playground](https://play.golang.org/)

### Go lang Addresses, Pointers and Types

[Go lang Addresses, Pointers and Types](https://stackoverflow.com/a/24623251)

### JSON and Go

[Looping/iterate over the second level nested JSON in go lang](https://stackoverflow.com/questions/29366038/looping-iterate-over-the-second-level-nested-json-in-go-lang)

### Build Web Application with Golang

[Build Web Application with Golang](https://legacy.gitbook.com/book/astaxie/build-web-application-with-golang)

### Pointer vs Non-Pointer Method Receivers

[Don't Get Bitten by Pointer vs Non-Pointer Method Receivers in Golang](https://nathanleclaire.com/blog/2014/08/09/dont-get-bitten-by-pointer-vs-non-pointer-method-receivers-in-golang/)

---

<a name="hello_world" />

## hello world

* create hello world go file. ($HOME/go/src/helloworld/main.go)

```
package main

import "fmt"

func main() {
	fmt.Println("Hello world!")
}
```

* go run.

```
user@golang:~/go/src/helloworld$ go run main.go
Hello world!
```

* go build.

```
user@golang:~/go/src/helloworld$ ls
main.go
user@golang:~/go/src/helloworld$ go build
user@golang:~/go/src/helloworld$ ls
helloworld  main.go
user@golang:~/go/src/helloworld$ ./helloworld
Hello world!
```

* go install.

```
user@golang:~/go$ go install helloworld
user@golang:~/go$ ls bin/
helloworld
```

