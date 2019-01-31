
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

* create a docker container.

```
docker build -f herokugo.dockerfile -t jacobrepo/herokugo:0.01 .
docker create -it --name herokugo --dns 172.19.10.100 -v /home/jacob_shih/volumes/herokugo:/home/user/herokugo jacobrepo/herokugo:0.01
docker start herokugo
docker exec -it herokugo su user
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


