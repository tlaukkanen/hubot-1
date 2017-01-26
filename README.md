# hubot

hubot is a chat bot built on the [Hubot][hubot] framework. It will eventually
take over all of Liaison.

[hubot]: http://hubot.github.com

## Running hubot Locally

You can test your hubot by running the following, however some plugins will not
behave as expected unless the [environment variables](#configuration) they rely
upon have been set.

You can start hubot locally by running:

    % bin/hubot

You'll see some start up output and a prompt:

    [Sat Feb 28 2015 12:38:27 GMT+0000 (GMT)] INFO Using default redis on localhost:6379
    hubot>

Then you can interact with hubot by typing `hubot help`.

    hubot> hubot help
    hubot animate me <query> - The same thing as `image me`, except adds [snip]
    hubot help - Displays all of the help commands that hubot knows about.
    ...

## Scripting

An example script is included at `scripts/example.coffee`, so check it out to
get started, along with the [Scripting Guide][scripting-docs].

[scripting-docs]: https://github.com/github/hubot/blob/master/docs/scripting.md

### external-scripts

Hubot is able to load plugins from third-party `npm` packages. This is the
recommended way to add functionality to your hubot. You can get a list of
available hubot plugins on [npmjs.com][npmjs] or by using `npm search`:

    % npm search hubot-scripts panda
    NAME             DESCRIPTION                        AUTHOR DATE       VERSION KEYWORDS
    hubot-pandapanda a hubot script for panda responses =missu 2014-11-30 0.9.2   hubot hubot-scripts panda
    ...

Also check out the [Hubot Script
Catalog](http://hubot-script-catalog.herokuapp.com/)

To use a package, check the package's documentation, but in general it is:

1. Use `npm install --save` to add the package to `package.json` and install it
2. Add the package name to `external-scripts.json` as a double quoted string

[npmjs]: https://www.npmjs.com

### hubot-scripts

Before hubot plugin packages were adopted, most plugins were held in the
[hubot-scripts][hubot-scripts] package. Some of these plugins have yet to be
migrated to their own packages. They can still be used but the setup is a bit
different.

To enable scripts from the hubot-scripts package, add the script name with
extension as a double quoted string to the `hubot-scripts.json` file in this
repo.

[hubot-scripts]: https://github.com/github/hubot-scripts

## Persistence

> Note: we need to setup redis

If you are going to use the `hubot-redis-brain` package (strongly suggested),
you will need to add the Redis to Go addon on Heroku which requires a verified
account or you can create an account at [Redis to Go][redistogo] and manually
set the `REDISTOGO_URL` variable.

    % heroku config:add REDISTOGO_URL="..."

If you don't need any persistence feel free to remove the `hubot-redis-brain`
from `external-scripts.json` and you don't need to worry about redis at all.

[redistogo]: https://redistogo.com/

## Deploy

We run hubot on Debian on GCE. See [the docs][deploy-unix]. Assuming you have
access to GCE, run the following:

```
$ gcloud compute ssh hubot
$ cd /srv/hubot
$ sudo git pull
$ sudo systemctl restart hubot
```

When deploying, copy the `bin/hubot.service` script to
`/etc/systemd/system/hubot.service` and modify the file appropriately.

You need to set/modify the following env vars:

- `HUBOT_SLACK_TOKEN` for slack adapter
- `HUBOT_GOOGLE_IMAGES_HEAR=1` to enable "image me"
- for [google image
  search][gsi]
  - `HUBOT_GOOGLE_CSE_ID`
  - `HUBOT_GOOGLE_CSE_KEY`
- `BREWERY_DB` for hubot-beer-me

When changing `hubot.service` you'll need to:

```
$ sudo systemctl daemon-reload
```

[gsi]: https://github.com/hubot-scripts/hubot-google-images#custom-mustachification-service
[deploy-unix]: https://github.com/github/hubot/blob/master/docs/deploying/unix.md
