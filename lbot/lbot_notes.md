
# line bot

1. [references](#references)

---

<a name="references" />

## references

* [create-your-line-bot-golang](http://www.evanlin.com/create-your-line-bot-golang/)
* [LineBotTemplate](https://github.com/kkdai/LineBotTemplate/blob/master/README.md)

---

## line official account

### create new line official account

[create a line official account](https://www.linebiz.com/id-en/service/line-account-connect/)

- click [register standard](https://entry.line.biz/form/unverified)

    - input the name of the line official account.
    - select category and subcategory.


[line official account manager](https://manager.line.biz)

- accounts -> {account name} -> settings

    - account settings

        - add profile photo and status.
        - choose cover photo.
        - enable/disable group and multi-person chats.

    - response settings

        - main settings

            - response mode : bot (use webhook to response)

        - detailed settings

            - auto-response : disabled
            - webhook : enabled

    - messaging api

        - enable messaging api and select (or create) a provider.
        - copy and save the channel id and secret used for app.
        - set the webhook url.
        - click 'LINE Developers' to launch develop settings for the bot.

---

## create a bot with the messaging api

### messaging api

- click the button 'Start now'

    [line developer - messaging api](https://developers.line.biz/en/services/messaging-api/)

- select provider to create new channel

    [select provider](https://developers.line.biz/console/register/messaging-api/provider/)

- create new channel

    - channel name

    - channel description

    - select category and subcategory.

- channel settings

    - basic settings

        - channel secret is unique secret key for the channel.

          *set to channel secret to conf vars on settings page of heroku.*

            - *heroku dashboard -> settings -> Config Vars -> ChannelSecret*


    - messaging api

        - webhook url

            - the url of an endpoint on your server that can process webhook events sent by the line platform.

        - use webhook : enabled.

            - if webhook is enabled, the line platform sends a request to your webhook url every time a user sends a message.

        - channel access token

            - use channel access token to call messaging api, click issue button to generate a new token.

            - set the channel access token to config vars on settings page of heroku.

              *heroku dashboard -> settings -> Config Vars -> ChannelAccessToken*

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

1. emoji

[emoji unicode tables](https://apps.timwhitlock.info/emoji/tables/unicode)

---


