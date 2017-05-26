# Description:
#   because internet

module.exports = (robot) ->

  robot.hear /it'?s done|i (did|finished|completed|done) it/i, (res) ->
    res.send "http://media.giphy.com/media/zCME2Cd20Czvy/giphy.gif"

  robot.hear /shame/i, (res) ->
    res.send "https://m.popkey.co/6bee24/6GJWk.gif"

  robot.hear /do it/i, (res) ->
    res.send "https://media.giphy.com/media/io7yBs6CsXuAE/giphy.gif"

  robot.hear /y tho/i, (res) ->
    res.send "https://i.imgur.com/yNlQWRM.jpg"

  robot.hear /but why/i, (res) ->
    res.send "https://media.giphy.com/media/1M9fmo1WAFVK0/giphy.gif"

  robot.hear /good point/i, (res) ->
    res.send "https://img.memecdn.com/wait-good-point_fb_1144675.jpg"

  robot.hear /dog/i, (res) ->
    res.send "https://media.tenor.co/images/46892d582757ea6381b593053556b667/tenor.gif"