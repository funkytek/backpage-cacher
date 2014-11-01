mongoose = require 'mongoose'

Post = mongoose.model 'Post',
   title: String
   body: String
   address: String
   otherAds: [String]
   images: [String]

module.exports = (data) ->

  post = new Post data
  post.save (err) ->
    console.log data.url
    console.log err if err?
