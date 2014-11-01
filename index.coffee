scraper = require 'backpage-scraper'
async = require 'async'
config = require './config'
cache = require './cache'

mongoose = require 'mongoose'
mongoose.connect 'mongodb://localhost/backpage'

async.forEach config.sections, (section, next) ->
  scraper.getLinks section, (links) ->
    async.forEach links, (link, done) -> 
      scraper.getPost link, (data) ->
        data.url = link
        cache data
        done()
    , next

, (err) ->
  console.log "CACHING COMPLETE"
  process.exit()