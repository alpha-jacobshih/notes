
# line bot

1. [references](#references)

---

<a name="references" />

## references

* [create-your-line-bot-golang](http://www.evanlin.com/create-your-line-bot-golang/)
* [LineBotTemplate](https://github.com/kkdai/LineBotTemplate/blob/master/README.md)

---

## create a bot with the messaging api

### messaging api

- click the button 'Start now'

    [line developer - messaging api](https://developers.line.biz/en/services/messaging-api/)

- select provider to create new channel

    [select provider](https://developers.line.biz/console/register/messaging-api/provider/)

- create new channel

    - app name

    - app description

    - plan

        - developer trial

            to create a bot that can send push messages and have **up to 50 friends**.

        - free

            to create a bot with an **unlimited** number of friends. **push messages cannot be sent** with this plan.

- messaging settings

    - use webhooks: enabled

    - allow bot to join group chats

        - enabled: to allow bot to join group chats.
        - disabled: not allow to join group chats.

    - auto-reply messages

        - disabled: not to send preset message (set from Line@ Manager) automatically when a user sends a message to bot.

    - greeting messages

        - enabled: send preset message (set from Line@ Manager) automatically when a user adds the bot as a friend.

    - channel id

        - unique identifier of the channel.

    - channel secret

        - unique secret key for the channel.
        - set to channel secret to conf vars on settings page of heroku.

        *heroku dashboard -> settings -> Config Vars -> ChannelSecret*

    - channel access token

        - long-lived token require for making api calls.
        - set to channel access token to conf vars on settings page of heroku.

        *heroku dashboard -> settings -> Config Vars -> ChannelAccessToken*

    - webhook url

        - server endpoint url that receives requests from the line platform when a webhook is triggered.


---

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

settings -> messaging api settings

- click 'Enable API' button with selected provider.

### messaging api settings

- click the button 'LINE Developers' to launch develop settings for the bot.

---

## Create a new app in heroku

[Create New App](https://dashboard.heroku.com/new-app?template=)

- app name should only contain lowercase letters, numbers, and dashes.

---

## setup development environment

### create a docker container for golang and heroku cli.

[docker container for golang and heroku](https://github.com/alpha-jacobshih/notes/blob/master/heroku/heroku_notes.md#setup_environment)

## build a line bot from LineBotTemplate

1. clone from https://github.com/kkdai/LineBotTemplate.git

```
git clone https://github.com/kkdai/LineBotTemplate.git
```

1. customizations

```
mv LineBotTemplate mytrialbot
cd mytrialbot
rm -rf .git
git init
git config user.email "jacob_shih@hotmail.com"
git config user.name "jacob_shih"
heroku git:remote -a mytrialbot
git add .
git commit -am "message..."
git push heroku master
```

---

## resources

1. sticker list for line bot

[sticker list](https://devdocs.line.me/files/sticker_list.pdf)

---


