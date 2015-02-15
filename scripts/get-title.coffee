cheerio = require 'cheerio'

module.exports = (robot) ->
  robot.hear /(https?:\/\/.*)/i, (msg) ->
    url = msg.match[1]
    msg.http(url).get() (err, res, body) ->
      $ = cheerio.load(body)
      title = $('title').text()
      msg.send title
