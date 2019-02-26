
# line bot

1. [references](#references)

---

<a name="references" />

## references
* [create-your-line-bot-golang](http://www.evanlin.com/create-your-line-bot-golang/)

---

## Create a LINE@ Account

- Create a Standard Account

    (Create a LINE@ Account)[https://entry-at.line.me]

- Line@ display name

    ```
    jxTestBot
    ```

- Line@ID

    ```
    ＠agg0446n
    ```

## LINE@ MANAGER

### configure and manager the line@ account.

(LINE@ MANAGER)[https://admin-official.line.me]

Accounts -> {account name}

- Add your own profile photo and status message.
- Choose your cover photo.
- Display your account for the world to see!
- Add a personal touch to the greeting message sent to users when they friend your account.
- Make your account page as attractive as possible.


### enable messaging api

Settings -> Messaging API Settings

- click 'Enable API' button with selected Provider.

### messaging api settings

FIXME

---

## build a line bot from LineBotTemplate

1. clone from https://github.com/kkdai/LineBotTemplate.git

```
git clone https://github.com/kkdai/LineBotTemplate.git
```

1. customizations

```
mv LineBotTemplate jxlbot
cd jxlbot
rm -rf .git
git init
git config user.email "jacob_shih@hotmail.com"
git config user.name "jacob_shih"
heroku git:remote -a jxlbot
git add .

```

---

## resources

1. sticker list for line bot

[sticker list](https://devdocs.line.me/files/sticker_list.pdf)

---


