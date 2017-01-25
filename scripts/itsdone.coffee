# Description:
#  Let everyone know that it's done and over with. 
#

module.exports = (robot) ->

  robot.hear /it'?s done|i (did|finished|completed|done) it/i, (res) ->
    res.send "http://media.giphy.com/media/zCME2Cd20Czvy/giphy.gif"
