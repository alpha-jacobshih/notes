
# heroku

1. [references](#references)
1. [setup environment](#setup_environment)

---

<a name="references" />

## references
* [heroku](https://www.heroku.com/)
* [heroku wiki](https://en.wikipedia.org/wiki/Heroku)

---

<a name="setup_environment" />

## setup environment

### build and create a docker container

* dockerfile.

    [herokugo.dockerfile](./dockerfiles/herokugo.dockerfile)

* docker-compose.yml

    [docker-compose.yml](./docker-compose.yml)

* build the image.

    - export user and group id first.

    ```
    export UID=`id -u $USER`
    export GID=`id -g $USER`
    ```

    - build the image.

    ```
    docker-compose build
    ```

    - create and start the container in background.
    
    ```
    docker-compose up -d
    ```

* enter the container.

    ```
    docker exec -it herokugo bash
    ```

* stop and remove the container.

    ```
    docker-compose down
    ```

* or download and install heroku package from command line.

```
curl https://cli-assets.heroku.com/install.sh | sh
```

## heroku

* login heroku

```
user@c6953705ddd9:~/herokugo$ heroku login
```

* clones a heroku app

```
user@c6953705ddd9:~/herokugo/src$ heroku git:clone -a jxlbot
```

* configure git account

```
user@c6953705ddd9:~/herokugo/src/jxlbot$ git config user.email "jacob_shih@hotmail.com"
user@c6953705ddd9:~/herokugo/src/jxlbot$ git config user.name "jacob_shih"
```

* format the go files before commit

```
user@c6953705ddd9:~/herokugo/src/jxlbot$ gofmt -w .
```

* commit and push code and it will be built automatically in heroku

```
user@c6953705ddd9:~/herokugo/src/jxlbot$ git add main.go 
user@c6953705ddd9:~/herokugo/src/jxlbot$ git commit -m 'What - [jxlbot] add a function to process received message.'
user@c6953705ddd9:~/herokugo/src/jxlbot$ git push heroku master
```

* manage external thirdparty packages

    * use govendor to update the file vendor.json and commit to heroku.

    ```
    govendor list
    govendor add +external
    govendor sync
    govendor list
    ```

    * [managing dependencies with govendor](https://jonathanmh.com/managing-dependencies-govendor-heroku-dokku/)

---


