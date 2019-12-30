# setup gitlab server on windows

## references

- [running gitlab from docker on windows 10](https://stackoverflow.com/a/55385018)

## run official image gitlab/gitlab:latest on windows 10.

```
mkdir d:\GitlabConfig
mkdir d:\GitlabConfig\backups

docker volume create gitlab-logs
docker volume create gitlab-data 
docker run --detach `
    --name gitlab `
    --restart always `
    --hostname gitlab.local `
    --publish 4443:443 --publish 4480:80 --publish 8222:22 `
    --volume d:\GitlabConfig:/etc/gitlab `
    --volume gitlab-logs:/var/log/gitlab `
    --volume gitlab-data:/var/opt/gitlab `
    gitlab/gitlab-ce
```
