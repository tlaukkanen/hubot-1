# Description:
#   Evaluate one line of Haskell
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot haskell <script> - Evaluate one line of Haskell
#
# Author:
#   edwardgeorge, slightly modified from code by jingweno

HASKELLJSON=""

module.exports = (robot) ->
  robot.respond /(haskell)\s+(.*)/i, (msg)->
    script = msg.match[2]

    msg.http("http://tryhaskell.org/eval")
      .query(exp: script)
      .headers(Cookie: "HASKELLJSON=#{HASKELLJSON}")
      .post() (err, res, body) ->
        switch res.statusCode
          when 200
            # TODO: figure out how to set cookies with the api, use chromium network dev tool
            #if res.headers["set-cookie"]
            #  HASKELLJSON = res.headers["set-cookie"][0].match(/HASKELLJSON=([-a-z0-9]+);/)[1]
            result = JSON.parse(body)

            if result.error
              msg.send result.error
            else
              msg.send "#{result.success.value}\n#{result.success.type}"
          else
            msg.send "Unable to evaluate script: #{script}. Request returned with the status code: #{res.statusCode}"
