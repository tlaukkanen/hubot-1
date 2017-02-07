# Description:
#   because internet

module.exports = (robot) ->

  robot.hear /it'?s done|i (did|finished|completed|done) it/i, (res) ->
    res.send "http://media.giphy.com/media/zCME2Cd20Czvy/giphy.gif"

  robot.hear /shame/i, (res) ->
    res.send "https://m.popkey.co/6bee24/6GJWk.gif"

  robot.hear /do it/i, (res) ->
    res.send "https://media.giphy.com/media/io7yBs6CsXuAE/giphy.gif"
