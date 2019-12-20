git notes
====

1. [references](#references)
1. [create new repostory from command line](#new_repo_from_command_line)
1. [checkout subdirectory](#checkout_subdirectory)
1. [ssh key](#ssh_key)
1. [moving git repository content to another repository](#move_repository)

---

<a name="references" />

## references

1. [create a git repository from cli](https://stackoverflow.com/q/2423777)
1. [clone a subdirectory only of a git repository](http://stackoverflow.com/a/13738951)
1. [generate a new ssh key](https://help.github.com/articles/generating-ssh-keys)
1. [add ssh key to git](https://help.github.com/articles/error-permission-denied-publickey/)
1. [moving git repository content to another and preserving history](https://stackoverflow.com/a/17373088)
---

<a name="new_repo_from_command_line" />

## create new repostory from command line

```
curl -u 'USER' https://api.github.com/user/repos -d '{"name":"REPOSITORY","description":"REPO_DESCRIPTION"}'
git init
git config user.name USER_NAME
git config user.email USER_EMAIL
git config push.default simple
git remote add origin https://github.com/GITUSER/REPOSITORY.git
git add .
git commit -m 'created REPOSITORY'
git push -u origin master
```

---

<a name="checkout_subdirectory" />

## checkout subdirectory

```
git init REPOSITORY && cd REPOSITORY
git config core.sparseCheckout true
git remote add -f origin http://github.com/GIT_USER/REPOSITORY.git
echo "SUBDIRECTORY/*" > .git/info/sparse-checkout
git pull origin master
```

---

<a name="ssh_key" />

## ssh key

- generate ssh key and register to github.

    ```
    ssh-keygen -t rsa -b 4096 -C GIT_USER_EMAIL
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    cat ~/.ssh/id_rsa.pub
    ```

    *paste the pub key to ssh keys settings from the setting sidebar of github.com*

- ask ssh-agent to keep the ssh key to unlock once instead of every time.

    ```
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    ```

- caching github password in git.

    ```
    git config --global credential.helper 'cache --timeout=3600'
    ```

    Set the cache to timeout after 1 hour (setting is in seconds)

---

<a name="move_repository" />

## moving git repository content to another repository

- move the content of FROM_REPOSITORY to TO_REPOSITORY.

    ```
    git clone https://github.com/GIT_USER/TO_REPOSITORY.git
    cd TO_REPOSITORY/
    git remote add FROM_REPOSITORY https://github.com/GIT_USER/FROM_REPOSITORY.git
    git fetch FROM_REPOSITORY
    git merge FROM_REPOSITORY/master
    git remote rm FROM_REPOSITORY
    git branch --unset-upstream
    git push origin master
    ```
